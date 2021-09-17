library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)

# CSV needs a column labelled "text" see line 9
csv <- read.csv("E:/XXXXXXXX/emotesttext.csv", stringsAsFactors = FALSE)
mySentiment <- get_nrc_sentiment(csv$text)
csv <- cbind(csv, mySentiment)
sentimentTotals <- data.frame(colSums(csv[,c(5:12)]))
names(sentimentTotals) <- "count"
sentimentTotals <- cbind("sentiment" = rownames(sentimentTotals), sentimentTotals)
rownames(sentimentTotals) <- NULL
ggplot(data = sentimentTotals, aes(x = sentiment, y = count)) +
  geom_bar(aes(fill = sentiment), stat = "identity") +
  xlab("Emotion") + ylab("Total Count") + ggtitle("Total Emotion Score in all comments") +
  theme(text=element_text(size=8, family="mono"))

library(tm)
library(wordcloud)

# OBAMA 2009
text <- readLines("obama.txt", warn = F)
docs <- Corpus(VectorSource(text))

# Convert text to lower case, remove punctuation
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removePunctuation)

# Remove 'stop words'
docs <- tm_map(docs, removeWords, stopwords("english"))

tdm <- TermDocumentMatrix(docs)
m <- as.matrix(tdm)
v <- sort(rowSums(m), decreasing = T)
word.table <- data.frame(word = names(v), freq = v)
row.names(word.table) <- 1:nrow(word.table)

# Create Word Cloud
set.seed(12)
png("wordcloud_obama.png", width = 12, height = 8, units = "in", res = 300)
wordcloud(words = word.table$word, freq = word.table$freq, min.freq = 1,
          rot.per = 0.15, random.order = F, colors = brewer.pal(8, "Dark2"))
dev.off()

# TRUMP 2017
text <- readLines("trump.txt", warn = F)
docs <- Corpus(VectorSource(text))

# Convert text to lower case, remove punctuation
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removePunctuation)

# Remove 'stop words'
docs <- tm_map(docs, removeWords, stopwords("english"))

tdm <- TermDocumentMatrix(docs)
m <- as.matrix(tdm)
v <- sort(rowSums(m), decreasing = T)
word.table <- data.frame(word = names(v), freq = v)
row.names(word.table) <- 1:nrow(word.table)

# Create Word Cloud
set.seed(12)
png("wordcloud_trump.png", width = 12, height = 8, units = "in", res = 300)
wordcloud(words = word.table$word, freq = word.table$freq, min.freq = 1, 
          rot.per = 0.15, random.order = F, colors = brewer.pal(8, "Dark2"))
dev.off() 

dev.off()

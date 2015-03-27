library("tm")

input_text <- readLines("C:/Users/dell/Desktop/sample.txt")

corpus <- VCorpus(VectorSource(input_text))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)

badwords <- VectorSource(readLines("C:/Users/dell/Desktop/badwords.txt"))

corpus <- tm_map(corpus, removeWords, badwords)

term_document_matrix <- TermDocumentMatrix(corpus)

bag_of_words <- inspect(term_document_matrix)


library(pdftools)
library(stringr)
library(wordcloud)
library(htmltools)

bts_text <- pdf_text("방탄소년단.pdf")
bts_text_line <- strsplit(bts_text, split ="\n")
bts_text_sent <- strsplit(unlist(bts_text_line), split = "\n")
bts_text_word <- strsplit(unlist(bts_text_sent), split = " ")
bts_text_word <- unlist(bts_text_word)
bts_text_word

bts_text_word_main <- bts_text_word[nchar(bts_text_word)>0]
which(str_detect(tolower(bts_text_word_main), "각주"))
bts_text_word_main <- bts_text_word_main[1:6892]
bts_text_word_freq <- sort(table(bts_text_word_main),decreasing = TRUE)

pal <- brewer.pal(8, "Dark2")
wordcloud(words = names(bts_text_word_freq),
          freq = bts_text_word_freq,
          min.freq = 5,
          max.words = 200,
          random.order = FALSE,
          rot.per = 0.1,
          scale = c(4,0.2),
          colors = pal)

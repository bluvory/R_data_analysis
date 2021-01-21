#### 10-1 ���� ���� �ؽ�Ʈ ���̴� ####


## -------------------------------------------------------------------- ##

install.packages(c("digest", "evaluate", "formatR", "highlight", "knitr", 
                   "parser", "plyr", "Rcpp", "stringr"))
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")
install.packages("remote")
install.packages("multilinguer")
library(multilinguer)
install_jdk()
install.packages(c("stringr", "hash", "tau", "Sejong", "RSQLite", "devtools"), type = "binary")
remotes::install_github('haven-jeon/KoNLP',
                        upgrade='never',
                        INSTALL_opts=c("--no-multiarch"))

install.packages('devtools')
devtools::install_github('haven-jeon/KoNLP')

library(KoNLP)
library(dplyr)
install.packages("KoNLP_0.80.2.tar.gz", repos=NULL, type="source",
                 fileEncoding = "euc-kr")

useNIADic()

# ������ �ҷ�����
txt <- readLines("hiphop.txt")
head(txt)

# Ư������ �����ϱ�
install.packages("stringr")
library(stringr)

txt <- str_replace_all(txt, "\\W", " ")

# ���� �����ϱ�
extractNoun("���ѹα��� ����� �ѹݵ��� �� �μӵ����� �Ѵ�")

# ���翡�� ���� ����
nouns <- extractNoun(txt)

# ������ ���� list�� ���ڿ� ���ͷ� ��ȯ, �ܾ ��ǥ ����
wordcount <- table(unlist(nouns))

# ������ ���������� ��ȯ
df_word <- as.data.frame(wordcount, stringsAsFactors=F)

# ������ ����
df_word <- rename(df_word, word=Var1, frep=Frep)

# �� ���� �̻� �ܾ� ����
df_word <- filter(df_word, nchar(word) >= 2)














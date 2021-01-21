#### 10-1 힙합 가사 텍스트 마이닝 ####


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

# 데이터 불러오기
txt <- readLines("hiphop.txt")
head(txt)

# 특수문자 제거하기
install.packages("stringr")
library(stringr)

txt <- str_replace_all(txt, "\\W", " ")

# 명사 추출하기
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

# 가사에서 명사 추출
nouns <- extractNoun(txt)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors=F)

# 변수명 수정
df_word <- rename(df_word, word=Var1, frep=Frep)

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)















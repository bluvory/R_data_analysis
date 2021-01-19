#### 09-1 한국복지패널데이터 분석 준비하기 ####


## -------------------------------------------------------------------- ##


install.packages("foreign")
library(foreign)   # SPSS 파일 불러오기
library(dplyr)     # 전처리
library(ggplot2)   # 시각화
library(readxl)    # 엑셀 파일 불러오기

# 데이터 불러오기
raw_welfare <- read.spss(file="data/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame=T)

# 복사본 만들기
welfare <- raw_welfare

# 데이터 검토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

# 변수명 바꾸기











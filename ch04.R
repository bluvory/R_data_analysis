#### 04-1 데이터 프레임 이해하기 ####

# 열(column) : 변수(variable)
# 행(row) : 케이스(case)

# 데이터가 크다
# 행이 많다 -> 컴퓨터가 느려짐  -> 고사양 장비 구축
# 열이 많다 -> 분석 방법의 한계 -> 고급 분석 방법





#### 04-2 데이터 프레임 만들기 ####


## -------------------------------------------------------------------- ##


english <- c(90, 80, 60, 70)   # 영어 점수 생성

math <- c(50, 60, 100, 20)     # 수학 점수 생성

# englist, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm

class <- c(1, 1, 2, 2)

df_midterm <- data.frame(english, math, class)
df_midterm

# df_midterm의 english로 평균 산출
mean(df_midterm$english)

# df_midterm의 math로 평균 산출
mean(df_midterm$math)

# 데이터 프레임 한번에 만들기
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm





#### 04-3 외부 데이터 이용하기 ####


## -------------------------------------------------------------------- ##


# readxl 패키지 설치하고 로드하기
install.packages("readxl")
library(readxl)

# 경로 지정
setwd("C:/Users/eunbi/Desktop/myAI/쉽게 배우는 R 데이터 분석/data")
getwd()
dir()

# 엑셀 파일을 불러와 df_exam에 할당
df_exam <- read_excel("excel_exam.xlsx")
df_exam

df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar

# col_names=F : 열 이름을 가져올 것인가? (True/False)
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names=F)
df_exam_novar

# 엑셀 파일에 시트가 여러 개 있다면
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet=3)

# csv 파일 불러오기
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

# 문자가 들어있는 파일을 불러올 때 : stringsAsFactors = F
df_csv_exam <- read.csv("csv_exam.csv", strinsgsAsFactors=F)


# 데이터 프레임을 csv파일로 저장하기

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))

# csv 파일로 저장하기
write.csv(df_midterm, file="df_midterm.csv")


# 데이터 프레임을 RDS 파일로 저장하기
saveRDS(df_midterm, file="df_midterm.rds")

# RDS 파일 불러오기 전 파일 삭제
rm(df_midterm)
df_midterm   # ERROR

# RDS 파일 불러오기
df_midterm <- readRDS("df_midterm.rds")
df_midterm
#### 05-1 데이터 파악하기 ####


## -------------------------------------------------------------------- ##


exam <- read.csv("csv_exam.csv")

# head() : 데이터 앞부분
head(exam)
head(exam, 10)

# tail() : 데이터 뒷부분
tail(exam)
tail(exam, 10)

# View() : 뷰어 창에서 데이터 확인
View(exam)

# dim() : 데이터 차원
# 데이터의 행, 열 출력
dim(exam)

# str() : 데이터 속성
str(exam)

# summary() 요약 통계량
summary(exam)

# mpg 데이터 파악하기
# as.data.fram : 데이터의 속성을 데이터 프레임 형태로 바꿈
# ggplot2::mpg : ggplot2에 들어이쓴 pg 데이터를 지
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)
?mpg





#### 05-2 변수명 바꾸기 ####


## -------------------------------------------------------------------- ##


# dplyr 설치 및 로드
install.packages("dplyr")
library("dplyr")

df_raw <- data.frame(var1=c(1, 2, 1),
                     var2=c(2, 3, 2))
df_raw

# 데이터 프레임 복사본 만들기
df_new <- df_raw

# 변수명 바꾸기
# rename(데이터 프레임명, 새 변수명 = 기존 변수명)
df_new <- rename(df_new, v2=var2)
df_new





#### 05-3 파생변수 만들기 ####


## -------------------------------------------------------------------- ##


df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))

df$var_sum <- df$var1 + df$var2
df

df$var_mean <- (df$var1 + df$var2) / 2
df


# mpg 통합 변수 만들기
mpg$total <- (mpg$cty + mpg$hwy) / 2
head(mpg)

# 통합 연비 변수 평균
mean(mpg$total)

# 통합 연비 변수 total의 평균과 중앙값 확인
summary(mpg$total)

# 히스토그램 설정
hist(mpg$total)

# total 연비와 평균과 중앙값이 약 20이다
# total 연비가 20~25 사이에 해당하는 자동차 모델이 가장 많다
# 대부분 25 이하이고, 25를 넘기는 자동차는 많지 않다
# total 변수가 20을 넘기면 합격, 넘기지 못하면 불합격으로 분류된 변수 만들기

# 조건문을 활용해 파생변수 만들기
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

# 빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test)

#  막대 그래프로 빈도 표현하기
library(ggplot2)
qplot(mpg$test)

# 중첩 조건문 이용하기
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)

table(mpg$grade)
qplot(mpg$grade)

# 원하는 만큼 범주 만들기
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")))
head(mpg, 20)

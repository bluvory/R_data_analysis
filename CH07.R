#### 07-1 결측치 정제하기 ####


## -------------------------------------------------------------------- ##


# 결측치 찾기
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))

is.na(df)

table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

# 결측치가 포함된 데이터를 함수에 적용하면 정상적으로 연산안됨
mean(df$score)
sum(df$score)

# 결측치 제거하기
library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# na.omit() : 변수를 지정하지 않고 결측치가 있는 행을 한번에 제거
df_nomiss2 <- na.omit(df)
df_nomiss2

# 함수의 결측치 제외 기능 이용하기
# na.rm = True : 결측치 제외
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

exam <- read.csv("data/csv_exam.csv")
exam[c(3, 8, 15), "math"] <- NA
exam

exam %>% summarise(mean_math = mean(math))

exam %>% summarise(mean_math = mean(math, na.rm=T))

exam %>% summarise(mean_math = mean(math, na.rm=T),
                   sum_math = sum(math, na.rm=T),
                   median_math = median(math, na.rm=T))

# 결측치 대체하기
# 데이터가 작고 결측치가 많은 경우 결측치를 제거하면 너무 많은 데이터가 손실돼 분석 겨로가가 왜곡되는 문제 발생
# 결측치 대체법 (Imputation)

# 평균값으로 결측치 대체하기
mean(exam$math, na.rm=T)

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

mean(exam$math)





### 07-2 이상치 정제하기 ####


## -------------------------------------------------------------------- ##


# 이상치(Outlier) : 정상 범주에서 크게 벗어난 값
# 이상치 제거하기 - 존재할 수 없는 값

outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$sex)
table(outlier$score)

# sex가 3이면 NA 할당
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

# score가 5보다 크면 NA 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

# filter() 이용해 결측치 제외후 성별에 따른 score 평균 구하기
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))


# 이상치 제거하기 - 극단적인 값
# 극단치 : 논리적으로 존재할 수 있지만 극단적으로 크거나 작은 값
# 어디까지를 정상 범위로 볼 것인지 정하기

# 상자 그림으로 극단치 기준 정하기
library(ggplot2)
boxplot(mpg$hwy)

# 상자그림 통계치 출력
# 아래쪽 극단치 경게, 1사분위수, 중앙값, 3사분위수, 위쪽 극단치 경계
boxplot(mpg$hwy)$stats

# 12-37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

# 결측치 제외하고 간단한 분석 수행
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm=T))

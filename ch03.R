#### 03-1 변수 ####


## -------------------------------------------------------------------- ##


# 변수 variable => 분석의 대사
# 상수 constant

a <- 1
b <- 2
c <- 3
d <- 3.5

a+b
# 3

a+b+c
# 6

4/b
# 2

5*b
# 10

var1 <- c(1, 2, 5, 7, 8)

var2 <- c(1:5)
# 1 2 3 4 5

var3 <- seq(1, 5)
# 1 2 3 4 5

var4 <- seq(1, 10, by=2)
# 1 3 5 7 9

var5 <- seq(1, 10, by=3)
# 1 4 7 10

var1 + 2
# 3 4 7 9 10

var1 + var2
# 2 4 8 11 13

str1 <- "a"
str2 <- "texxt"
str3 <- "Hello World!"
str4 <- c("a", "b", "c")
str5 <- c("Hello!", "World", "is", "good!")

str1 + 2
# ERROR int str1+2 : non-numeric argument to binary operator






#### 03-2 함수 ####

## -------------------------------------------------------------------- ##


# 데이터 분석 = 함수를 이용해서 변수를 조작하는 일

x <- c(1, 2, 3)
mean(x)  # 2
max(x)   # 3
min(x)   # 1

str5 <- c("Hello!", "World", "is", "good!")

paste(str5, collapse=",")
# 쉼표를 구분자로 str5의 단어들 하나로 합치기
# "Hello!,World,is,good!"

paste(str5, collapse=" ")
# "Hello! World is good!"

x_mean <- mean(x)  # 2

str5_paste <- paste(str5, collapse=" ")





#### 03-3 패키지 (package) ####


## -------------------------------------------------------------------- ##


# ggplot2 패키지 설치
install.packages("ggplot2")

# ggplot2 패키지 로드
library(ggplot2)

# 여러 문자로 구성된 변수 생성
x <- c("a", "a", "b", "c")

# 빈도 막대 그래프 출력
qplot(x)

# data에 mpg, x축에 hwy 변수 지정해 그래프 생성
# mpg : ggplot2에 들어있는 자동차 연비 관련 정보를 담고있는 데이터터
# hwy : 자동차가 고속도로에서 1갤런에 몇 마일을 가는지 나타낸 변
qplot(data=mpg, x=hwy)

# x축 cty
qplot(data=mpg, x=cty)

# x축 drv, y축 hwy
qplot(data=mpg, x=drv, y=hwy)

# x축 drv, y축 hwy, 선 그래프 형태
qplot(data=mpg, x=drv, y=hwy, geom="line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", colour=drv)

# qplot 함수 메뉴얼 출력
?qplot
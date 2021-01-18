### 3-1 변수 ###
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

### 3-2 함수 ###
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
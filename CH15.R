#### 15-1 R 내장 함수로 데이터 추출하기 ####


## -------------------------------------------------------------------- ##


exam <- read.csv("data/csv_exam.csv")

# 조건 없이 전체 데이터 출력
exam[]

# 인덱싱 (indexing) - 데이터 추출
exam[1, ]
exam[2, ]

exam[exam$class == 1, ]
exam[exam$math >= 80, ]

# 내장함수에서는 조건을 입력할 때 변수명 앞에 데이터 프레임 이름을 반복해 써야 한다
exam[exam$class == 1 & exam$math >= 50, ]
exam[exam$english < 90 | exam$science < 50, ]

exam[, 1]
exam[, 2]
exam[, 3]


# 변수명으로 변수 추출하기
# 인덱스보다는 변수명을 활용하는게 편리
exam[, "class"]
exam[, "math"]

exam[, c("class", "math", "english")]


# 행 변수 동시 출력
exam[1, ]

exam[5, "english"]

exam[exam$math >= 50, "english"]

exam[exam$math >= 50, c("english", "science")]


# dplyr과 내장함수의 차이
# aggregate : 범주별 요약 통계량을 구하는 R 내장 함수
exam$tot <- (exam$math + exam$english + exam$science)/3
aggregate(data=exam[exam$math >= 50 & exam$english >= 80, ], tot~class, mean)

exam %>% 
  filter(math >= 50 & english >= 80) %>% 
  mutate(tot = (math + english + science)/3) %>% 
  group_by(class) %>% 
  summarise(mean = mean(tot))





#### 15-2 변수 타입 ####


## -------------------------------------------------------------------- ##


# 연속 변수 (Continuous Variable) - Numeric 타입
# 키, 몸무게, 소득처럼 연속적이고 크기를 의미하는 값

# 범주 변수 (Categorical Variable) - Factor 타입
# 대상을 분류하는 의미를 지니는 변수


# 변수 타입 간 차이
var1 <- c(1, 2, 3, 1, 2)
var1

var2 <- factor(c(1, 2, 3, 1, 2))
var2

var1 + 2
var2 + 2  # error

# 변수 타입
class(var1)
class(var2)

mean(var1)
mean(var2)


# 변수의 구성 범주
# levels : factor 변수의 값이 어떤 범주로 구성되는지
levels(var1)
levels(var2)

# 문자로 구성된 factor 변수
var3 <- c("a", "b", "b", "c")
var3

var4 <- factor(c("a", "b", "b", "c"))
var4

class(var3)
class(var4)


# 변수 타입 바꾸기
var2 <- as.numeric(var2)
mean(var2)


# 변환 함수
# as.numeric()
# as.factor()
# as.character()
# as.Date()
# as.data.frame()


# 변수 타입
# numeric 실수
# integer 정수
# complex 복소수
# character 문자
# logical 논리
# factor 범주
# Date 날짜





#### 15-3 데이터 구조 ####


## -------------------------------------------------------------------- ##


# 벡터(Vector) - 1차원
# 하나의 값 또는 여러 개의 값으로 구성된 데이터 구조
a <- 1
a

b <- "hello"
b

class(a)
class(b)


# 데이터 프레임(Data Frame) - 2차원
# 행과 열로 구성, 다양한 변수 타입으로 구성
x1 <- data.frame(var1 = c(1, 2, 3),
                 var2 = c("a", "b", "c"))
x1

class(x1)


# 매트릭스(Matrix) - 2차원
# 행과 열로 구성, 한가지 변수 타입으로 구성
x2 <- matrix(c(1:12), ncol=2)
x2

class(x2)

# 에러이(Array) - 다차원
# 2차원 이상으로 구성된 매트릭스, 한 가지 변수 타입으로 구성
x3 <- array(1:20, dim=c(2, 5, 2))
x3

class(x3)


# 리스트(List) - 다차원
# 모든 데이터 구조를 포함하는 데이터 구조
x4 <- list(f1=a,  # 벡터
           f2=x1, # 데이터 프레임
           f3=x2, # 매트릭스
           f4=x3) # 어레이
x4

class(x4)


# boxplot의 출력 결과 = 리스트
mpg <- ggplot2::mpg
x <- boxplot(mpg$cty)
x

x$stats[, 1]     # 요약 통계량 추출
x$stats[, 1][3]  # 중앙값 추출
x$stats[, 1][2]  # 1분위수 추출

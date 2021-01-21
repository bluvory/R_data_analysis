#### 15-1 R ���� �Լ��� ������ �����ϱ� ####


## -------------------------------------------------------------------- ##


exam <- read.csv("data/csv_exam.csv")

# ���� ���� ��ü ������ ���
exam[]

# �ε��� (indexing) - ������ ����
exam[1, ]
exam[2, ]

exam[exam$class == 1, ]
exam[exam$math >= 80, ]

# �����Լ������� ������ �Է��� �� ������ �տ� ������ ������ �̸��� �ݺ��� ��� �Ѵ�
exam[exam$class == 1 & exam$math >= 50, ]
exam[exam$english < 90 | exam$science < 50, ]

exam[, 1]
exam[, 2]
exam[, 3]


# ���������� ���� �����ϱ�
# �ε������ٴ� �������� Ȱ���ϴ°� ����
exam[, "class"]
exam[, "math"]

exam[, c("class", "math", "english")]


# �� ���� ���� ���
exam[1, ]

exam[5, "english"]

exam[exam$math >= 50, "english"]

exam[exam$math >= 50, c("english", "science")]


# dplyr�� �����Լ��� ����
# aggregate : ���ֺ� ��� ��跮�� ���ϴ� R ���� �Լ�
exam$tot <- (exam$math + exam$english + exam$science)/3
aggregate(data=exam[exam$math >= 50 & exam$english >= 80, ], tot~class, mean)

exam %>% 
  filter(math >= 50 & english >= 80) %>% 
  mutate(tot = (math + english + science)/3) %>% 
  group_by(class) %>% 
  summarise(mean = mean(tot))





#### 15-2 ���� Ÿ�� ####


## -------------------------------------------------------------------- ##


# ���� ���� (Continuous Variable) - Numeric Ÿ��
# Ű, ������, �ҵ�ó�� �������̰� ũ�⸦ �ǹ��ϴ� ��

# ���� ���� (Categorical Variable) - Factor Ÿ��
# ����� �з��ϴ� �ǹ̸� ���ϴ� ����


# ���� Ÿ�� �� ����
var1 <- c(1, 2, 3, 1, 2)
var1

var2 <- factor(c(1, 2, 3, 1, 2))
var2

var1 + 2
var2 + 2  # error

# ���� Ÿ��
class(var1)
class(var2)

mean(var1)
mean(var2)


# ������ ���� ����
# levels : factor ������ ���� � ���ַ� �����Ǵ���
levels(var1)
levels(var2)

# ���ڷ� ������ factor ����
var3 <- c("a", "b", "b", "c")
var3

var4 <- factor(c("a", "b", "b", "c"))
var4

class(var3)
class(var4)


# ���� Ÿ�� �ٲٱ�
var2 <- as.numeric(var2)
mean(var2)


# ��ȯ �Լ�
# as.numeric()
# as.factor()
# as.character()
# as.Date()
# as.data.frame()


# ���� Ÿ��
# numeric �Ǽ�
# integer ����
# complex ���Ҽ�
# character ����
# logical ����
# factor ����
# Date ��¥





#### 15-3 ������ ���� ####


## -------------------------------------------------------------------- ##


# ����(Vector) - 1����
# �ϳ��� �� �Ǵ� ���� ���� ������ ������ ������ ����
a <- 1
a

b <- "hello"
b

class(a)
class(b)


# ������ ������(Data Frame) - 2����
# ��� ���� ����, �پ��� ���� Ÿ������ ����
x1 <- data.frame(var1 = c(1, 2, 3),
                 var2 = c("a", "b", "c"))
x1

class(x1)


# ��Ʈ����(Matrix) - 2����
# ��� ���� ����, �Ѱ��� ���� Ÿ������ ����
x2 <- matrix(c(1:12), ncol=2)
x2

class(x2)

# ������(Array) - ������
# 2���� �̻����� ������ ��Ʈ����, �� ���� ���� Ÿ������ ����
x3 <- array(1:20, dim=c(2, 5, 2))
x3

class(x3)


# ����Ʈ(List) - ������
# ��� ������ ������ �����ϴ� ������ ����
x4 <- list(f1=a,  # ����
           f2=x1, # ������ ������
           f3=x2, # ��Ʈ����
           f4=x3) # ���
x4

class(x4)


# boxplot�� ��� ��� = ����Ʈ
mpg <- ggplot2::mpg
x <- boxplot(mpg$cty)
x

x$stats[, 1]     # ��� ��跮 ����
x$stats[, 1][3]  # �߾Ӱ� ����
x$stats[, 1][2]  # 1������ ����
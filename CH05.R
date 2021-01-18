#### 05-1 ������ �ľ��ϱ� ####


## -------------------------------------------------------------------- ##


exam <- read.csv("csv_exam.csv")

# head() : ������ �պκ�
head(exam)
head(exam, 10)

# tail() : ������ �޺κ�
tail(exam)
tail(exam, 10)

# View() : ��� â���� ������ Ȯ��
View(exam)

# dim() : ������ ����
# �������� ��, �� ���
dim(exam)

# str() : ������ �Ӽ�
str(exam)

# summary() ��� ��跮
summary(exam)

# mpg ������ �ľ��ϱ�
# as.data.fram : �������� �Ӽ��� ������ ������ ���·� �ٲ�
# ggplot2::mpg : ggplot2�� ����̾� pg �����͸� ��
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)
?mpg





#### 05-2 ������ �ٲٱ� ####


## -------------------------------------------------------------------- ##


# dplyr ��ġ �� �ε�
install.packages("dplyr")
library("dplyr")

df_raw <- data.frame(var1=c(1, 2, 1),
                     var2=c(2, 3, 2))
df_raw

# ������ ������ ���纻 �����
df_new <- df_raw

# ������ �ٲٱ�
# rename(������ �����Ӹ�, �� ������ = ���� ������)
df_new <- rename(df_new, v2=var2)
df_new





#### 05-3 �Ļ����� ����� ####


## -------------------------------------------------------------------- ##


df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))

df$var_sum <- df$var1 + df$var2
df

df$var_mean <- (df$var1 + df$var2) / 2
df


# mpg ���� ���� �����
mpg$total <- (mpg$cty + mpg$hwy) / 2
head(mpg)

# ���� ���� ���� ���
mean(mpg$total)

# ���� ���� ���� total�� ��հ� �߾Ӱ� Ȯ��
summary(mpg$total)

# ������׷� ����
hist(mpg$total)

# total ����� ��հ� �߾Ӱ��� �� 20�̴�
# total ���� 20~25 ���̿� �ش��ϴ� �ڵ��� ���� ���� ����
# ��κ� 25 �����̰�, 25�� �ѱ�� �ڵ����� ���� �ʴ�
# total ������ 20�� �ѱ�� �հ�, �ѱ��� ���ϸ� ���հ����� �з��� ���� �����

# ���ǹ��� Ȱ���� �Ļ����� �����
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

# ��ǥ�� �հ� ���� �ڵ��� �� ���캸��
table(mpg$test)

#  ���� �׷����� �� ǥ���ϱ�
library(ggplot2)
qplot(mpg$test)

# ��ø ���ǹ� �̿��ϱ�
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)

table(mpg$grade)
qplot(mpg$grade)

# ���ϴ� ��ŭ ���� �����
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")))
head(mpg, 20)
#### 07-1 ����ġ �����ϱ� ####


## -------------------------------------------------------------------- ##


# ����ġ ã��
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))

is.na(df)

table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

# ����ġ�� ���Ե� �����͸� �Լ��� �����ϸ� ���������� ����ȵ�
mean(df$score)
sum(df$score)

# ����ġ �����ϱ�
library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# na.omit() : ������ �������� �ʰ� ����ġ�� �ִ� ���� �ѹ��� ����
df_nomiss2 <- na.omit(df)
df_nomiss2

# �Լ��� ����ġ ���� ��� �̿��ϱ�
# na.rm = True : ����ġ ����
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

# ����ġ ��ü�ϱ�
# �����Ͱ� �۰� ����ġ�� ���� ��� ����ġ�� �����ϸ� �ʹ� ���� �����Ͱ� �սǵ� �м� �ܷΰ��� �ְ�Ǵ� ���� �߻�
# ����ġ ��ü�� (Imputation)

# ��հ����� ����ġ ��ü�ϱ�
mean(exam$math, na.rm=T)

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

mean(exam$math)





### 07-2 �̻�ġ �����ϱ� ####


## -------------------------------------------------------------------- ##


# �̻�ġ(Outlier) : ���� ���ֿ��� ũ�� ��� ��
# �̻�ġ �����ϱ� - ������ �� ���� ��

outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$sex)
table(outlier$score)

# sex�� 3�̸� NA �Ҵ�
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

# score�� 5���� ũ�� NA �Ҵ�
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

# filter() �̿��� ����ġ ������ ������ ���� score ��� ���ϱ�
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))


# �̻�ġ �����ϱ� - �ش����� ��
# �ش�ġ : ���������� ������ �� ������ �ش������� ũ�ų� ���� ��
# �������� ���� ������ �� ������ ���ϱ�

# ���� �׸����� �ش�ġ ���� ���ϱ�
library(ggplot2)
boxplot(mpg$hwy)

# ���ڱ׸� ���ġ ���
# �Ʒ��� �ش�ġ ���, 1�������, �߾Ӱ�, 3�������, ���� �ش�ġ ���
boxplot(mpg$hwy)$stats

# 12-37 ����� NA �Ҵ�
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

# ����ġ �����ϰ� ������ �м� ����
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm=T))
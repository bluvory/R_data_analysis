#### 09-1 �ѱ������гε����� �м� �غ��ϱ� ####


## -------------------------------------------------------------------- ##


install.packages("foreign")
library(foreign)   # SPSS ���� �ҷ�����
library(dplyr)     # ��ó��
library(ggplot2)   # �ð�ȭ
library(readxl)    # ���� ���� �ҷ�����

# ������ �ҷ�����
raw_welfare <- read.spss(file="data/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame=T)

# ���纻 �����
welfare <- raw_welfare

# ������ �����ϱ�
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

# ������ �ٲٱ�










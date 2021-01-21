#### 13-1 ����� ���� ���� ####

# ��� ��� (Descriptive statistics)
# �����͸� ����� �����ϴ� ��� ���

# �߷� ��� (Inferential statistics)
# � ���� �߻��� Ȯ���� ����ϴ� ��� ���

# ��� �м��� �����ߴ� = �߷� ��踦 �̿��� ���� ������ �ߴ�
# �ŷ��� �� �ִ� ����� �������� ����Ȯ�� ����ϴ� ����� ���� ���� ���� ��ġ��

# ����� ���� ���� (Statistical hypothesis test)
# ����Ȯ���� �̿��� ������ �����ϴ� ���

# ����Ȯ�� (Significance probability, p-value)
# �����δ� ���� �� ���̰� ���µ� �쿬�� ���̰� �ִ� �����Ͱ� ����� Ȯ��






#### 13-2 t���� - �� ������ ��� �� ####


## -------------------------------------------------------------------- ##



mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)

mpg_diff <- mpg %>%
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

head(mpg_diff)
table(mpg_diff$class)


# t������ ���ϴ� ������ �л��� ������ ���ο� ���� �����ϴ� ������ �ٸ�
# �Ϲ������� p-value�� 0.05�̸��̸� '���� �� ���̰� ��������� �����ϴ�'�� �ؼ�
# �� compact�� suv �� ��� ���� ���� ���̰� ��������� �����ϴ�
# sample estimates�κ��� ���� compact���ÿ��� > suv���ÿ���
t.test(data=mpg_diff, cty~class, var.equal=T)


# �Ϲ� �ֹ����� ����ϴ� �ڵ����� ���� �ֹ����� ����ϴ� �ڵ��� �� ���� ���� ���̰� ��������� ��������
# r: regular �Ϲ� / p : premium ����
mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r", "p"))

table(mpg_diff2$fl)


# p-value�� 0.2875�̹Ƿ� 0.05 �̸�
# �Ϲ� �ֹ����� ���� �ֹ����� ����ϴ� �ڵ��� �� ���� ���� ���̰� ��������� �������� �ʴ�
t.test(data=mpg_diff2, cty~fl, var.equal=T)





#### 13-3 ����м� - �� ������ ���輺 �м�####


## -------------------------------------------------------------------- ##


# ����м� (Correlation Analysis)
# �� ���� ������ ���� ������ �ִ��� �����ϴ� ��� �м� ���
# ������ (Correlation Coefficient)
# �� ������ �󸶳� ���õǾ� �ִ���, ���ü��� ���� �ľ�
# 0~1 ������ ���� ���ϰ� 1�� �������� ���ü��� ũ��
# �������� ����� �����, ������ �ݺ�� ����

economics <- as.data.frame(ggplot2::economics)


# cor.test�� ����м�
# p-value�� 0.05�̸��̹Ƿ� �Ǿ��ڼ��� ���� �Һ� ������ ����� ��������� ����
# cor�� 0.61�̹Ƿ� �Ǿ��� ���� ���� �Һ� ������ ����� ����
cor.test(economics$unemploy, economics$pce)


# ������ ��Ʈ�� �����
# mtcars������ �̿�
head(mtcars)

car_cor <- cor(mtcars)
round(car_cor, 2)


install.packages("corrplot")
library(corrplot)

corrplot(car_cor)

corrplot(car_cor, method="number")

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF",
                          "#77AADD", "#4477AA"))

corrplot(car_cor,
         method = "color",      # ����� ǥ��
         col = col(200),        # ���� 200�� ����
         type = "lower",        # ���� �Ʒ� ��ĸ� ǥ��
         order = "hclust",      # ������ ���������� ����ȭ
         addCoef.col = "black", # ������ ����
         tl.col = "black",      # ������ ����
         tl.srt = 45,           # ������ 45�� �����
         diag = F)              # �밢 ��� ����
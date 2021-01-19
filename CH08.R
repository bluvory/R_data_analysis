#### 08-1 R�� ���� �� �ִ� �׷��� ���캸�� ####
# �׷���(Graph) : �����͸� ���� ���� �׸����� ǥ���� ��
# ggplot2 �̿�



#### 08-2 ������ - ������ ���� ǥ���ϱ� ####


## -------------------------------------------------------------------- ##


library(ggplot2)

# ��� �����ϱ�
# displ: ��ⷮ, hwy: ���ӵ��� ����
ggplot(data=mpg, aes(x=displ, y=hwy))

# ��濡 ������ �߰�
# geom_point(): ������ �׸��� �Լ�
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()

# �� ������ �����ϴ� ���� �߰��ϱ�
# xlim: x�� ����, ylim: y�� ����
ggplot(data=mpg, aes(x=displ, y=hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)

# �׷����� �̹��� ���Ϸ� �����ϱ�
# Export -> Save as Image/JPEG/PNG/PDF





#### 08-3 ���� �׷��� - ���� �� ���� ǥ���ϱ� ####


## -------------------------------------------------------------------- ##


# ��� ���� �׷��� �����
# geom_col(): ���� �׷��� ����� �Լ�

library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm=T))

df_mpg

ggplot(data=df_mpg, aes(x=drv, y=mean_hwy)) + geom_col()

# ũ������� �����ϱ�
# reorder(): ���븦 ���� ũ�� ������ ����
# - ���̱�: ��������
ggplot(data=df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) + geom_col()


# �� ���� �׷��� �����
# geom_bar(): �� ���� �׷��� �׸��� �Լ�
ggplot(data=mpg, aes(x=drv)) + geom_bar()

ggplot(data=mpg, aes(x=hwy)) + geom_bar()





#### 08-4 �� �׷��� - �ð��� ���� �޶����� ������ ǥ���ϱ� ####


## -------------------------------------------------------------------- ##


# ggplot2 ��Ű���� �ִ� economics ������ �̿��� �ð迭 ������ �׸���
# economics: �̱��� ���� ��ǥ���� ������ ��Ÿ�� �׷���
# date: �ð�, unemploy: �Ǿ��� ��
# geom_line() ���

ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line()




#### 08-5 ���� �׷��� - ���� �� ���� ǥ���ϱ� ####


## -------------------------------------------------------------------- ##


# ���� �׸� �����
# mpg �������� drv(���� ���)�� hwy(���ӵ��� ����)
# geom_boxplot() �̿�

ggplot(data=mpg, aes(x=drv, y=hwy)) + geom_boxplot()

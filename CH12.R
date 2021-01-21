#### 12-1 plotly ��Ű���� ���ͷ�Ƽ�� �׷��� ����� ####


## -------------------------------------------------------------------- ##


# ���ͷ�Ƽ�� �׷��� (Interactive Graph)
# ���콺 �����ӿ� �����ϸ� �ǽð����� ���°� ���ϴ� �׷���

install.packages("plotly")
library(plotly)
library(ggplot2)

# x�� ��ⷮ displ
# y�� ���ӵ��� ���� hwy
# �������� ���� �������drv ���� �ٸ� ������ ǥ��
p <- ggplot(data=mpg, aes(x=displ, y=hwy, col=drv)) + geom_point()

ggplotly(p)

# html�� ����
# Export -> Save as Web Page...

# ���ͷ�Ƽ�� ���� �׷��� �����
# diamonds : ���̾Ƹ�� 5���� ���� ĳ��, ���� ���, ���� �� �Ӽ��� ���� ������
p <- ggplot(data=diamonds, aes(x=cut, fill=clarity)) +
  geom_bar(position="dodge")

ggplotly(p)




#### 12-2 dygraphs ��Ű���� ���ͷ�Ƽ�� �ð迭 �׷��� ����� ####


## -------------------------------------------------------------------- ##


install.packages("dygraphs")
library(dygraphs)

# economics : �Ǿ��� ��, ����� �� 1967~2015�� �̱��� ���� ���� ��ǥ�� ���� ������
economics <- ggplot2::economics
head(economics)

# �ð� ���� �Ӽ��� ���ϴ� xts ������ Ÿ������ ����
library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

# �׷��� ����
dygraph(eco)

# ��¥ ���� ���� ��� dyRangeSelector()
# ������ ���� �� �¿�� �����̸� �ð��� ���� �����Ͱ� ��� ���ϴ��� �� �� ����
dygraph(eco) %>% dyRangeSelector()

# ����� psavert
eco_a <- xts(economics$psavert, order.by=economics$date)

# �Ǿ��� �� unemploy
eco_b <- xts(economics$unemploy/1000, order.by=economics$date)

# cbind() : ���η� ����
# colnames() : ������ ����
eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "unemploy")
head(eco2)

dygraph(eco2) %>% dyRangeSelector()
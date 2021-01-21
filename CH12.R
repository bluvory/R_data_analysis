#### 12-1 plotly 패키지로 인터랙티브 그래프 만들기 ####


## -------------------------------------------------------------------- ##


# 인터랙티브 그래프 (Interactive Graph)
# 마우스 움직임에 반응하며 실시간으로 형태가 변하는 그래프

install.packages("plotly")
library(plotly)
library(ggplot2)

# x축 배기량 displ
# y축 고속도로 연비 hwy
# 산점도의 점을 구동방식drv 별로 다른 색으로 표현
p <- ggplot(data=mpg, aes(x=displ, y=hwy, col=drv)) + geom_point()

ggplotly(p)

# html로 저장
# Export -> Save as Web Page...

# 인터랙티브 막대 그래프 만들기
# diamonds : 다이아몬드 5만여 개의 캐럿, 컷팅 방식, 가격 등 속성을 담은 데이터
p <- ggplot(data=diamonds, aes(x=cut, fill=clarity)) +
  geom_bar(position="dodge")

ggplotly(p)




#### 12-2 dygraphs 패키지로 인터랙티브 시계열 그래프 만들기 ####


## -------------------------------------------------------------------- ##


install.packages("dygraphs")
library(dygraphs)

# economics : 실업자 수, 저축률 등 1967~2015년 미국의 월별 경제 지표를 담은 데이터
economics <- ggplot2::economics
head(economics)

# 시간 순서 속성을 지니는 xts 데이터 타입으로 변경
library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

# 그래프 생성
dygraph(eco)

# 날짜 범위 선택 기능 dyRangeSelector()
# 범위를 정한 뒤 좌우로 움직이면 시간에 따라 데이터가 어떻게 변하는지 알 수 있음
dygraph(eco) %>% dyRangeSelector()

# 저축률 psavert
eco_a <- xts(economics$psavert, order.by=economics$date)

# 실업자 수 unemploy
eco_b <- xts(economics$unemploy/1000, order.by=economics$date)

# cbind() : 가로로 결합
# colnames() : 변수명 수정
eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "unemploy")
head(eco2)

dygraph(eco2) %>% dyRangeSelector()

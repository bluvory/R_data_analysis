#### 08-1 R로 만들 수 있는 그래프 살펴보기 ####
# 그래프(Graph) : 데이터를 보기 쉽게 그림으로 표현한 것
# ggplot2 이용



#### 08-2 산점도 - 변수간 관계 표현하기 ####


## -------------------------------------------------------------------- ##


library(ggplot2)

# 배경 설정하기
# displ: 배기량, hwy: 고속도로 연비
ggplot(data=mpg, aes(x=displ, y=hwy))

# 배경에 산점도 추가
# geom_point(): 산점도 그리는 함수
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()

# 축 범위를 조정하는 설정 추가하기
# xlim: x축 지정, ylim: y축 지정
ggplot(data=mpg, aes(x=displ, y=hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)

# 그래프를 이미지 파일로 저장하기
# Export -> Save as Image/JPEG/PNG/PDF





#### 08-3 막대 그래프 - 집단 간 차이 표현하기 ####


## -------------------------------------------------------------------- ##


# 평균 막대 그래프 만들기
# geom_col(): 막대 그래프 만드는 함수

library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm=T))

df_mpg

ggplot(data=df_mpg, aes(x=drv, y=mean_hwy)) + geom_col()

# 크기순으로 정렬하기
# reorder(): 막대를 값의 크기 순으로 정렬
# - 붙이기: 내림차순
ggplot(data=df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) + geom_col()


# 빈도 막대 그래프 만들기
# geom_bar(): 빈도 막대 그래프 그리는 함수
ggplot(data=mpg, aes(x=drv)) + geom_bar()

ggplot(data=mpg, aes(x=hwy)) + geom_bar()





#### 08-4 선 그래프 - 시간에 따라 달라지는 데이터 표현하기 ####


## -------------------------------------------------------------------- ##


# ggplot2 패키지에 있는 economics 데이터 이용해 시계열 데이터 그리기
# economics: 미국의 경제 지표들을 월별로 나타낸 그래프
# date: 시간, unemploy: 실업자 수
# geom_line() 사용

ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line()




#### 08-5 막대 그래프 - 집단 간 차이 표현하기 ####


## -------------------------------------------------------------------- ##


# 상자 그림 만들기
# mpg 데이터의 drv(구동 방식)별 hwy(고속도로 연비)
# geom_boxplot() 이용

ggplot(data=mpg, aes(x=drv, y=hwy)) + geom_boxplot()


#### 13-1 통계적 가설 검정 ####

# 기술 통계 (Descriptive statistics)
# 데이터를 요약해 설명하는 통계 기법

# 추론 통계 (Inferential statistics)
# 어떤 값이 발생할 확률을 계산하는 통계 기법

# 통계 분석을 수행했다 = 추론 통계를 이용해 가설 검정을 했다
# 신뢰할 수 있는 결론을 내리려면 유의확률 계산하는 통계적 가설 검정 절차 거치기

# 통계적 가설 검정 (Statistical hypothesis test)
# 유의확률을 이용해 가설을 검정하는 방법

# 유의확률 (Significance probability, p-value)
# 실제로는 집단 간 차이가 없는데 우연히 차이가 있는 데이터가 추출될 확률






#### 13-2 t검정 - 두 집단의 평균 비교 ####


## -------------------------------------------------------------------- ##



mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)

mpg_diff <- mpg %>%
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

head(mpg_diff)
table(mpg_diff$class)


# t검정은 비교하는 집단의 분산이 같은지 여부에 따라 적용하는 공식이 다름
# 일반적으로 p-value가 0.05미만이면 '집단 간 차이가 통계적으로 유의하다'고 해석
# 즉 compact와 suv 간 평균 도시 연비 차이가 통계적으로 유의하다
# sample estimates부분을 보면 compact도시연비 > suv도시연비
t.test(data=mpg_diff, cty~class, var.equal=T)


# 일반 휘발유를 사용하는 자동차와 고급 휘발유를 사용하는 자동차 간 도시 연비 차이가 통계적으로 유의한지
# r: regular 일반 / p : premium 고급
mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r", "p"))

table(mpg_diff2$fl)


# p-value가 0.2875이므로 0.05 미만
# 일반 휘발유와 고급 휘발유를 사용하는 자동차 간 도시 연비 차이가 통계적으로 유의하지 않다
t.test(data=mpg_diff2, cty~fl, var.equal=T)





#### 13-3 상관분석 - 두 변수의 관계성 분석####


## -------------------------------------------------------------------- ##


# 상관분석 (Correlation Analysis)
# 두 연속 변수가 서로 관련이 있는지 검정하는 통계 분석 기법
# 상관계수 (Correlation Coefficient)
# 두 변수가 얼마나 관련되어 있는지, 관련성의 정도 파악
# 0~1 사이의 값을 지니고 1에 가까울수록 관련성이 크다
# 상관계수가 양수면 정비례, 음수면 반비례 관계

economics <- as.data.frame(ggplot2::economics)


# cor.test로 상관분석
# p-value가 0.05미만이므로 실업자수와 개인 소비 지출의 상관이 통계적으로 유의
# cor이 0.61이므로 실업자 수와 개인 소비 지출은 정비례 관계
cor.test(economics$unemploy, economics$pce)


# 상관행렬 히트맵 만들기
# mtcars데이터 이용
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
         method = "color",      # 색깔로 표현
         col = col(200),        # 색상 200개 선정
         type = "lower",        # 왼쪽 아래 행렬만 표시
         order = "hclust",      # 유사한 상관계수끼리 군집화
         addCoef.col = "black", # 상관계수 색깔
         tl.col = "black",      # 변수명 색깔
         tl.srt = 45,           # 변수명 45도 기울임
         diag = F)              # 대각 행렬 제외

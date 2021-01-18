#### 06-1 데이터 전처리 ####

# 데이터 전처리 Data Preprocessing : 분석에 적합하게 데이터를 가공하는 작업

# dplyr 데이터 전처리 패키지
# filter()    행 추출
# select()    열 추출
# arrange()   정렬
# mutate()    변수 추가
# summarise() 통계치 산출
# group_by()  집단별로 나누기
# left_join() 데이터 합치기(열)
# bind_join() 데이터 합치기(행)




#### 06-2 조건에 맞는 데이터만 추출하기 ####


## -------------------------------------------------------------------- ##


library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

# exam에서 class가 1인 경우만 추출해 출력
# %>% : ctrl+shift+m (파이프 연산자)
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)

# 조건, 미만, 이상, 이하 조건 걸기
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

# 여러 조건을 충족하는 행 추출
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)

# 여러 조건 중 하나 이상 충족하는 행 추출하기
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english < 90 | science < 50)

# 목록에 해당하는 행 추출하기
# %in% : 변수의 값이 지정한 조건 목록에 해당하는지 확인하는 기능 (매치연산자)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))

# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)
mean(class1$math)  # 1반 수학점수 평균
mean(class2$math)  # 2반 수학점수 평균





#### 06-3 필요한 변수만 추출하기 ####


## -------------------------------------------------------------------- ##


# 변수 추출하기
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)

# 변수 제외하기
exam %>% select(-math)
exam %>% select(-math, -english)

# dplyr 함수 조합하기
exam %>% filter(class == 1) %>% select(english)

exam %>%
  filter(class == 1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head

exam %>% 
  select(id, math) %>% 
  head(10)





#### 06-4 순서대로 정렬하기 ####


## -------------------------------------------------------------------- ##


# 오름차순으로 정렬하기
exam %>% arrange(math)
exam %>% arrange(class, math)

# 내림차순으로 정렬하기
exam %>% arrange(desc(math))





#### 06-5 파생변수 추가하기 ####


## -------------------------------------------------------------------- ##


exam %>% 
  mutate(total = math + english + science) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science) / 3) %>% 
  head

exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head





#### 06-6 집단별로 요약하기 ####


## -------------------------------------------------------------------- ##


# summarise는 전체를 요약한 값을 구하기보다는 group_by와 조합해 집단별 요약표 만들 때 사용
# group_by : 변수를 지정하면 변수 항목별로 데이터를 분리
exam %>% summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())   # n() : 학생수, 빈도구하기

# drv 변수의 4(사륜구동), f(전륜구동), r(후륜구동)
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

# dplyr 조합하기
# 회사별로 suv 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기

mpg %>% 
  group_by(manufacturer) %>%           # 회사별로 분리
  filter(class == "suv") %>%           # suv 추출
  mutate(tot = (cty + hwy) / 2) %>%    # 통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>%  # 통합 연비 평균 산출
  arrange(desc(mean_tot)) %>%          # 내림차순 정렬
  head(5)                              # 1~5위까지 출력





#### 06-7 데이터 합치기 ####


## -------------------------------------------------------------------- ##




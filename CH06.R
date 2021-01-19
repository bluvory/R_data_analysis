#### 06-1 ������ ��ó�� ####

# ������ ��ó�� Data Preprocessing : �м��� �����ϰ� �����͸� �����ϴ� �۾�

# dplyr ������ ��ó�� ��Ű��
# filter()    �� ����
# select()    �� ����
# arrange()   ����
# mutate()    ���� �߰�
# summarise() ���ġ ����
# group_by()  ���ܺ��� ������
# left_join() ������ ��ġ��(��)
# bind_join() ������ ��ġ��(��)




#### 06-2 ���ǿ� �´� �����͸� �����ϱ� ####


## -------------------------------------------------------------------- ##


library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

# exam���� class�� 1�� ��츸 ������ ���
# %>% : ctrl+shift+m (������ ������)
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)

# ����, �̸�, �̻�, ���� ���� �ɱ�
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

# ���� ������ �����ϴ� �� ����
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)

# ���� ���� �� �ϳ� �̻� �����ϴ� �� �����ϱ�
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english < 90 | science < 50)

# ��Ͽ� �ش��ϴ� �� �����ϱ�
# %in% : ������ ���� ������ ���� ��Ͽ� �ش��ϴ��� Ȯ���ϴ� ��� (��ġ������)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))

# ������ ������ ������ �����
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)
mean(class1$math)  # 1�� �������� ���
mean(class2$math)  # 2�� �������� ���





#### 06-3 �ʿ��� ������ �����ϱ� ####


## -------------------------------------------------------------------- ##


# ���� �����ϱ�
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)

# ���� �����ϱ�
exam %>% select(-math)
exam %>% select(-math, -english)

# dplyr �Լ� �����ϱ�
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





#### 06-4 ������� �����ϱ� ####


## -------------------------------------------------------------------- ##


# ������������ �����ϱ�
exam %>% arrange(math)
exam %>% arrange(class, math)

# ������������ �����ϱ�
exam %>% arrange(desc(math))





#### 06-5 �Ļ����� �߰��ϱ� ####


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





#### 06-6 ���ܺ��� ����ϱ� ####


## -------------------------------------------------------------------- ##


# summarise�� ��ü�� ����� ���� ���ϱ⺸�ٴ� group_by�� ������ ���ܺ� ���ǥ ���� �� ���
# group_by : ������ �����ϸ� ���� �׸񺰷� �����͸� �и�
exam %>% summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())   # n() : �л���, �󵵱��ϱ�

# drv ������ 4(�������), f(��������), r(�ķ�����)
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

# dplyr �����ϱ�
# ȸ�纰�� suv �ڵ����� ���� �� ���ӵ��� ���� ���� ����� ���� ������������ �����ϰ�, 1~5������ ����ϱ�

mpg %>% 
  group_by(manufacturer) %>%           # ȸ�纰�� �и�
  filter(class == "suv") %>%           # suv ����
  mutate(tot = (cty + hwy) / 2) %>%    # ���� ���� ���� ����
  summarise(mean_tot = mean(tot)) %>%  # ���� ���� ��� ����
  arrange(desc(mean_tot)) %>%          # �������� ����
  head(5)                              # 1~5������ ���





#### 06-7 ������ ��ġ�� ####


## -------------------------------------------------------------------- ##


# ���η� ��ġ�� - ���� �����Ϳ� ����(��) �߰�
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))

test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))

total <- left_join(test1, test2, by = "id")
total

# �ٸ� �����͸� Ȱ���� ���� �߰��ϱ�
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kime", "lee", "park", "choi", "jung"))

exam_new <- left_join(exam, name, by = "class")
exam_new

# ���η� ��ġ�� - ���� �����Ϳ� �� �߰�
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))

group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))

group_all <- bind_rows(group_a, group_b)
group_all
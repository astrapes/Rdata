install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
library(plotly)
setwd("c:/rdata")
raw_welfare = read.spss(file="Koweps_hpc10_2015_beta1.sav",to.data.frame =T)
welfare = raw_welfare
head(welfare)
View(welfare)

welfare = rename(welfare,
                 sex = h10_g3,            # 성별
                 birth = h10_g4,          # 태어난 연도
                 marriage = h10_g10,      # 혼인 상태
                 religion = h10_g11,      # 종교
                 income = p1002_8aq1,     # 월급
                 code_job = h10_eco9,     # 직종 코드
                 code_region = h10_reg7)


class(welfare$sex)
table(welfare$sex)
welfare$sex = ifelse(welfare$sex == 9 , NA, welfare$sex)

table(is.na(welfare$sex))

welfare$sex = ifelse(welfare$sex == 1, "male","female")
table(welfare$sex)
qplot(welfare$sex)

class(welfare$income)
summary(welfare$income)
qplot(welfare$income)

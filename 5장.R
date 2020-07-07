exam = read.csv("csv_exam.csv")
head(exam)
tail(exam)
View(exam)
dim(exam)
str(exam)
summary(exam)

mpg = as.data.frame(ggplot2::mpg)
View(mpg)
df_raw = data.frame(var1 = c(1,2,1), var2 = c(2,3,2))
df_raw

# 변수명 변경
df_raw = rename(df_raw, v2 = var2)
df_raw

mpg = as.data.frame(ggplot2 :: mpg)
mpg1= mpg
mpg1=rename(mpg1,city=cty,highway=hwy)
head(mpg1)

# 파생 변수 생성
df = data.frame(var1= c(4,3,8),
                var2 = c(2,6,1))
df
df$var_sum = df$var1 +df$var2
df

mpg$total = (mpg$cty+mpg$hwy)/2
head(mpg)
mpg$test = ifelse(mpg$total >= 20, "pass", "fail")
mpg
table(mpg$test)

library(ggplot2)
qplot(mpg$test)
mpg$grade = ifelse(mpg$total >= 30, "A",
                   ifelse(mpg$total >= 20, "B","C"))
head(mpg,10)
table(mpg$grade)
qplot(mpg$grade)
mpg$grade = ifelse(mpg$total >= 30, "A",
                   ifelse(mpg$total >= 25, "B",
                          ifelse(mpg$total >= 20,"C","D")))
head(mpg)
midwest = as.data.frame(ggplot2 :: midwest)
head(midwest,10)
midwest = rename(midwest,total=poptotal,asian=popasian)

head(midwest,10)
midwest$rate=((midwest$asian)/(midwest$total)*100)

hist(midwest$rate)

a= mean(midwest$rate)
midwest$group=ifelse(midwest$rate >a, "large","small")
midwest

table(midwest$group)
qplot(midwest$group)

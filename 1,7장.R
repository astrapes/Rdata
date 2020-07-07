x=rnorm(100,175,2)  #? •ê·œë¶„?¬,+-2ë¥? ê°€ì§€?Š” 100ê°œì˜ ?‚œ?ˆ˜ ?ƒ?„±
hist(x,breaks=5, probability =T)
lines(density(x),col=2,type='h')
shapiro.test(x)

a<-1
a=2
a
b=5
a+b
var1=c(1,2,3,4,5)
var2=c(1:5)
var3=seq(1,5)
var4=seq(1,10,2)
var5=var1+1
var1+var2
str1="abc"
str2=c("a","b","c")
str3=c('I','am','a','boy')
mean(x)
max(x)
min(x)
sum(x)
sum(-x)
paste(str3,collapse = ' ')
install.packages('ggplot2')
library(ggplot2)
x= c('a','a','b','c')
x
qplot(x)
student=c(80,60,70,50,90)
mean(student)
sd(student)

english = c(30,20,10)
math= c(20,10,30)
df_midterm=data.frame(english,math)

class = c(1,1,2,2)
mean(df_midterm$english)
sd(df_midterm$english)
sqrt(var(df_midterm$english))
install.packages("readxl")
library(readxl)
setwd("c:\rdata")
write.csv(df_midterm, "df_midterm.csv")
df_mid_test=read.csv("df_midterm.csv")
df_mid_test

install.packages("dplyr")
library(dplyr)
df = data.frame(sex=c("M","F",NA, "M", "F"),
                score=c(5,4,3,4,NA))
df

is.na(df)
table(is.na(df))
table(is.na(df$sex))
kk=table(is.na(df$score))

tt=barplot(table(is.na(df$score)),col=rainbow(2),ylim=c(0,20)) 

text(tt,kk,lable = paste(kk,"°Ç"), pos=3)

mean(df$score)
library(dplyr)
df%>% filter(is.na(score))
df %>% filter(!is.na(score))

# ?Š¹? • ì»¬ëŸ¼?—?„œ ê²°ì¸¡ì¹? ? œê±?
df_nomiss = df %>% filter(!is.na(score))
mean(df_nomiss$score)

df_nomiss = df%>% filter(!is.na(score)& !is.na(sex))
df_nomiss

# ê²°ì¸¡ì¹˜ê?€ ?•˜?‚˜?¼?„ ?ˆ?œ¼ë©? ? œê±?
df_nomiss2 = na.omit(df)
df_nomiss2

# ê²°ì¸¡ì¹˜ë?? ? œ?™¸?•˜ê³? ?‰ê·? ?‚°ì¶?
mean(df$score, na.rm =T)

# ?‰ê·? êµ¬í•˜ê¸?
library(readxl)
setwd("c:/rdata")
exam = read.csv("csv_exam.csv")
exam[c(3,8,5),"math"] = NA
exam %>% summarise(mean_math=mean(math))

exam %>% summarise(mean_math=mean(math, na.rm =T))

exam %>% summarise(mean_math=mean(math, na.rm =T),
                   sum_math=sum(math,na.rm =T),
                   median_math = median(math,na.rm=T))

# ?‰ê· ìœ¼ë¡? ??€ì²´í•˜ê¸?
mean(exam$math, na.rm =T)
exam$math = ifelse(is.na(exam$math),55,exam$math)
table(is.na(exam$math))
exam




mpg=as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] = NA

table(is.na(mpg$hwy))
table(is.na(mpg$drv))

mpg %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))


# ?´?ƒì¹? ? œê±? ?•˜ê¸?

outlier = data.frame(sex=c(1,2,1,3,2,1),
                    score=c(5,4,3,4,2,6))

table(outlier$sex)
table(outlier$score)

outlier$sex = ifelse(outlier$sex ==3, NA, outlier$sex)
outlier
outlier$score = ifelse(outlier$score > 5, NA, outlier$score)
outlier

# ê²°ì¸¡ì¹? ? œ?™¸?•˜ê³? ë¶„ì„
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex)%>%
  summarise(mean_score=mean(score))
  
# ?´?ƒì¹? ? œê±°í•˜ê¸?
mpg = as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)

boxplot(mpg$hwy)$stats
boxplot(mpg$hwy,horizontal = 1)
ggplot(data=mpg.aes(x=drv,y=mean_hwy,na.rm=T,1))
mpg$hwy = ifelse(mpg$hwy < 12 | mpg$hwy >37 ,NA, mpg$hwy)
table(is.na(mpg$hwy))
IQR(mpg$hwy)
hist(mpg$hwy, probability = T)
lines(density(mpg$hwy), type = 'h',col=2)
boxplot(mpg$hwy)$stats

ggplot(data=mpg.aes(x=drv,y=mean_hwy,na.rm=T,1))

# ê²°ì¸¡ì¹? ? œ?™¸?•˜ê³? ë¶„ì„?•˜ê¸?
mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy,na.rm =T))

mpg = as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] = "k"
mpg[c(29,43,129,203),"cty"] = c(3,4,39,42)

table(mpg$drv)
mpg$drv = ifelse(mpg$drv %in% c("4","f","r"),mpg$drv, NA)
table(mpg$drv)

boxplot(mpg$cty)$stats
mpg$cty= ifelse(mpg$cty < 9 | mpg$cty >26, NA, mpg$cty)
boxplot(mpg$cty)$stats

mpg %>%
  filter(!is.na(drv) & !is.na(cty))%>%
  group_by(drv) %>%
  summarise(mean_cty=mean(cty,na.rm=T))


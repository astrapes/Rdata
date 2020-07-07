install.packages("plotly")
library(dplyr)
library(ggplot2)
library(readxl)
library(plotly)
mpg = as.data.frame(ggplot2::mpg)
View(mpg)
mpg[c(1,8,19,38,75,142,145,155),"drv"] = c("a","b","c","d","e","g","h","i")
mpg[c(100,109,123,131,135,138),"cty"] = c(1,2,3,4,5,50,60,70)

table(mpg$drv)
mpg$drv = ifelse(mpg$drv %in% c("4","f","r"),mpg$drv, NA)
table(mpg$drv)

boxplot(mpg$cty)$stats
mpg$cty= ifelse(mpg$cty < 9 | mpg$cty >26, NA, mpg$cty)
boxplot(mpg$cty)$stats

a = mpg %>%
  filter(!is.na(drv) & !is.na(cty))%>%
  group_by(drv) %>%
  summarise(mean_cty=mean(cty,na.rm=T))


ggplot(data=a,aes(x=drv,y=mean_cty))+geom_col(fill=rainbow(3))+coord_flip()

ggplot(data=a,aes(x=reorder(drv,mean_cty),y=mean_cty))+geom_col(fill=rainbow(3))+coord_flip()
ggplot(data=a,aes(x=reorder(drv,-mean_cty),y=mean_cty))+geom_col(fill=rainbow(3))+coord_flip()

tt = ggplot(data=a,aes(x=reorder(drv,mean_cty),y=mean_cty))+geom_col(fill=rainbow(3))+coord_flip()
ggplotly(tt)
ggplot(data=a,aes(x=drv,y=mean_cty))+geom_col(fill=rainbow(3))+coord_flip()+ylab('도시연비')+xlab('구동타입')

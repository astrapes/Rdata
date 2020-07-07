library(dplyr)
library(ggplot2)
library(readxl)
library(plotly)

df_mpg=as.data.frame(ggplot2::mpg)
View(df_mpg)
a = df_mpg %>%
  filter(class =="suv")%>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)
a

ggplot(data = a, aes(x=reorder(manufacturer,-mean_cty), y= mean_cty))+geom_col(fill=rainbow(5))

count = table(df_mpg$class)
tt = barplot(count,col=rainbow(7))
text(tt,count,paste0(count,"´ë"),pos=3,col=3,cex=2)
ggplot(data = df_mpg, aes(x=class))+geom_bar(fill=rainbow(7))
text(tt,count,paste0(count,"´ë"),pos=3,col=3,cex=2)

ggplot(data = economics, aes(x=date, y= unemploy))+geom_line()
economics
ggplot(data = economics, aes(x=date, y= psavert))+geom_line()

boxplot(mpg$cty)$stats

df_mpg$cty = ifelse(df_mpg$cty < 9 | df_mpg$cty > 26 , NA, df_mpg$cty)
boxplot(mpg$cty)
table(is.na(df_mpg))
a = df_mpg %>%
  filter(class %in%  c('compact','subcompact','suv'))
  
b = ggplot(data= a, aes(x= class,y=cty),na.rm =T)+geom_boxplot()
ggplotly(b)


library(rvest)
library(stringr)
setwd("c:/rdata")
library(dplyr)

rm(list=ls())
title=c()
url_b="https://movie.naver.com/movie/point/af/list.nhn?&page="

for (i in 1:100){
craw_url=paste0(url_b,1,sep="")

t_css=".color_b"
title_part=read_html(craw_url,encoding = "CP949")%>%
  html_nodes(t_css)%>%
  html_text
title = c(title,title_part)
}
View(title)


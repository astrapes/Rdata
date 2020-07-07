setwd("c:/rdata")
install.packages('rvest')
install.packages('stringr')
library(rvest)
library(stringr)

title=c()
url=c()
press=c()
body=c()
time=c()


url_b='https://news.daum.net/breakingnews/?page='
# selector Gadget 이용하여 title 주소 긁어오기
t_css='#mArticle .tit_thumb .link_txt'

# press,time 정보
pt_css=".info_news"

# head line 뉴스
b_css=".desc_thumb .link_txt"

cr_url=paste0(url_b,1,sep="")
hdoc=read_html(cr_url)

t_node=html_nodes(hdoc,t_css)
t_node

pt_node = html_nodes(hdoc,pt_css)
pt_node

b_node = html_nodes(hdoc,b_css)
b_node

url_part=html_attr(t_node,"href")
url_part

title_part = html_text(t_node)
title_part

pt_part = html_text(pt_node)
pt_part

time_part=str_sub(pt_part,-5)
time_part

press_part = str_sub(pt_part,end = -9)
press_part

body_part = html_text(b_node)
body_part
body_part = str_trim(body_part, side = "both")
body_part

title=c(title, title_part)
press=c(press,press_part)
time=c(time,time_part)
body=c(body,body_part)
url=c(url, url_part)

for (i in 1:200){
cr_url=paste0(url_b,i,sep="")
hdoc=read_html(cr_url)

t_node=html_nodes(hdoc,t_css)
t_node

pt_node = html_nodes(hdoc,pt_css)
pt_node

b_node = html_nodes(hdoc,b_css)
b_node

url_part=html_attr(t_node,"href")
url_part

title_part = html_text(t_node)
title_part

pt_part = html_text(pt_node)
pt_part

time_part=str_sub(pt_part,-5)
time_part

press_part = str_sub(pt_part,end = -9)
press_part

body_part = html_text(b_node)
body_part
body_part = str_trim(body_part, side = "both")
body_part

title=c(title, title_part)
press=c(press,press_part)
time=c(time,time_part)
body=c(body,body_part)
url=c(url, url_part)
}
news=data.frame(title,press,time,body,url)
write.csv(news,"news0706.csv")
View(news)


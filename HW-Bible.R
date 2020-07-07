library(rvest)
library(stringr)
library(wordcloud2)
library(RColorBrewer)
library(KoNLP)

body=c()
verse=c()

url_b='https://www.bskorea.or.kr/bible/korbibReadpage.php?version=GAE&book=psa&chap='
b_css='br+ span'
v_css='.number'

for (i in 1:150){
cr_url=paste0(url_b,i,sep="")
hdoc=read_html(cr_url,encoding = "UTF-8")

# c_node=html_nodes(hdoc,c_css)
b_node=html_nodes(hdoc,b_css)
v_node=html_nodes(hdoc,v_css)

# c_part=html_text(c_node)
b_part=html_text(b_node)
b_part=gsub("\\d+","",b_part)
b_part=str_trim(b_part,side = "both")
v_part=html_text(v_node)

# chapter=c(chapter,c_part)
body=c(body,b_part)
verse=c(verse,v_part)
}
bible=data.frame(verse,body)
View(bible)

txt=sapply(body,extractNoun,USE.NAMES =F)
txt=unlist(txt)
count=Filter(function(x){nchar(x)>=2},txt)

word=table(count)
a = head(sort(word,decreasing = T),20)
b = barplot(a,col=rainbow(20),ylim=c(0,300),las=2)
text(b,a,label=paste0(a,'°³'),pos=3,col=2)

palete = brewer.pal(9,"Greens")
wordcloud2(data=word,
           size=0.4,
           shape='diamond')

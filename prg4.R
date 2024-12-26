library(rvest)
library(httr)
library(xml2)
url= "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_and_their_capitals_in_native_languages"
response=tryCatch(GET(url),error=function(e)e)
if(!inherits(response,"error")){
  print("success")
  
  
  html_content=read_html(response$content,encoding="UTF-8")
  
  countries <- html_content %>%
    html_nodes(".wikitable tbody tr td:nth-child(3)") %>%
    html_text()
  
  
  capitals <- html_content %>%
    html_nodes(".wikitable tbody tr td:nth-child(2)") %>%
    html_text()
  
  clean_countries=gsub("\\[.*?\\]","",countries)
  clean_countries=gsub("&nbsp;","",clean_countries)
  
  clean_capitals <- gsub("\\[.*?\\]", "", capitals)
  clean_capitals <- gsub("&nbsp;", " ", clean_capitals)
  
  clean_countries=enc2utf8(iconv(clean_countries,"UTF-8","ASCII",sub=" "))
  clean_capitals=enc2utf8(iconv(clean_capitals, "UTF-8", "ASCII", sub = " "))
  
  country_capitals=data.frame(countries=clean_countries,capitals=clean_capitals)

  write.csv(country_capitals ,file= "country_capitals.csv",row.names=FALSE)
}else{
  print("fail")
}


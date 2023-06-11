message('Loading Package')
library(rvest)
library(mongolite)

message('Get BBCA Data')
url_bbca <- 'https://finance.yahoo.com/quote/BBCA.JK/history?p=BBCA.JK'
list_bbca <- read_html(url_bbca) %>% html_node("tbody") %>% html_table()
bbca <- data.frame(kode = "BBCA", list_bbca[1,])
bbca[2] <- str_replace(bbca[2], ",", "")
bbca <- gsub("\\.00", "", bbca)
bbca <- gsub("\\,", "", bbca)
bbca <- data.frame(bbca[1], bbca[2], as.numeric(bbca[3]), as.numeric(bbca[4]),
                   as.numeric(bbca[5]),as.numeric(bbca[6]), as.numeric(bbca[7]),as.numeric(bbca[8]))
colnames(bbca) <- c("kode", "date", "open", "high", "low", "close", "adj_close", "volume")

message('Get BBNI Data')
url_bbni <- 'https://finance.yahoo.com/quote/BBNI.JK/history?p=BBNI.JK'
list_bbni <- read_html(url_bbni) %>% html_node("tbody") %>% html_table()
bbni <- data.frame(kode = "BBNI", list_bbni[1,])
bbni[2] <- str_replace(bbni[2], ",", "")
bbni <- gsub("\\.00", "", bbni)
bbni <- gsub("\\,", "", bbni)
bbni <- data.frame(bbni[1], bbni[2], as.numeric(bbni[3]), as.numeric(bbni[4]),
                   as.numeric(bbni[5]),as.numeric(bbni[6]), as.numeric(bbni[7]),as.numeric(bbni[8]))
colnames(bbni) <- c("kode", "date", "open", "high", "low", "close", "adj_close", "volume")

message('Get BBRI Data')
url_bbri <- 'https://finance.yahoo.com/quote/BBRI.JK/history?p=BBRI.JK'
list_bbri <- read_html(url_bbri) %>% html_node("tbody") %>% html_table()
bbri <- data.frame(kode = "BBRI", list_bbri[1,])
bbri[2] <- str_replace(bbri[2], ",", "")
bbri <- gsub("\\.00", "", bbri)
bbri <- gsub("\\,", "", bbri)
bbri <- data.frame(bbri[1], bbri[2], as.numeric(bbri[3]), as.numeric(bbri[4]),
                   as.numeric(bbri[5]),as.numeric(bbri[6]), as.numeric(bbri[7]),as.numeric(bbri[8]))
colnames(bbri) <- c("kode", "date", "open", "high", "low", "close", "adj_close", "volume")

message('Get BMRI Data')
url_bmri <- 'https://finance.yahoo.com/quote/BMRI.JK/history?p=BMRI.JK'
list_bmri <- read_html(url_bmri) %>% html_node("tbody") %>% html_table()
bmri <- data.frame(kode = "BMRI", list_bmri[1,])
bmri[2] <- str_replace(bmri[2], ",", "")
bmri <- gsub("\\.00", "", bmri)
bmri <- gsub("\\,", "", bmri)
bmri <- data.frame(bmri[1], bmri[2], as.numeric(bmri[3]), as.numeric(bmri[4]),
                   as.numeric(bmri[5]),as.numeric(bmri[6]), as.numeric(bmri[7]),as.numeric(bmri[8]))
colnames(bmri) <- c("kode", "date", "open", "high", "low", "close", "adj_close", "volume")

message('Merge Data')
day <- bbca
day[2,] <- bbni[1,]
day[3,] <- bbri[1,]
day[4,] <- bmri[1,]

message('Connecting to MongoDB Atlas')
atlas <- mongo(
  collection = Sys.getenv("ATLAS_COLLECTION"),
  db         = Sys.getenv("ATLAS_DB"),
  url        = Sys.getenv("ATLAS_URL"))

newday <- data.frame(no = atlas$count() + 1, kode = day[,1], date = day[,2], open = day[,3], high = day[,4],
                     low = day[,5], close = day[,6], adj_close = day[,7], volume = day[,8])
atlas$insert(newday)

rm(atlas)
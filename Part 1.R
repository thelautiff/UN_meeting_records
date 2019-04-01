setwd("~/Desktop/UN_meeting_records")
#install.packages("rvest")
library(rvest)
library(dplyr)
library(tidyr) 
library(readtext)
library(stringr)
library(quanteda)
sr <- read.csv("results.csv", header=TRUE, stringsAsFactors = FALSE) 
sr <- sr[grep("B03", sr$X89, ignore.case=TRUE),]
sr$h <- 0

#In my data frame, the column containing the links is called 'links'.
for (i in 1:length(sr$links)){ 
  h <-
    read_html((sr$links)[i])%>% 
    html_node("strong +a") %>%
    html_attrs()
  sr$h[i] <- h
} 
sr <- sr %>% drop_na(h)
sr$h <- paste0("https://digitallibrary.un.org", sr$h)
for (i in 1:nrow(sr)){
  download.file(sr$h[i], paste0("~/Desktop/UN_meeting_records/pdfs/",sr$X1[i],".pdf"))
}
files <- list.files(path = "~/Desktop/UN_meeting_records/pdfs", 
                    pattern = "pdf",
                    full.names = TRUE)

lapply(files, function(i) system(paste("/usr/local/bin/pdftotext", paste0('"', i, '"')), wait = FALSE) )
#Now drag and drop all the txt files to the txt folder
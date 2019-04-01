fls <- list.files("~/Desktop/UN_meeting_records/txt")
df <- list()

for (f in fls){
  message(f)
  files <- readtext(paste0("~/Desktop/UN_meeting_records/txt/", f),
                    docvarsfrom = "filenames",
                    docvarnames = "job.number"
  )
  docs <- strsplit(files$text, split="\\n(?=[0-9]+\\.\\s((Mr|Ms)|Mrs))", perl=TRUE)
  cleandocs <- docs[[1]][2:length(docs[[1]])] #I refer to the text of the speeches as 'cleandocs'- completely arbitrary
  
  #creating the necessary entries for the data frame
  title <- docs[[1]][1] 
  jobno <- files$job.number
  doc_id <- str_extract_all(cleandocs, "((Mr|Ms)|Mrs)(.*?)\\)+")
  names <- sub("\\s\\(","",(str_extract_all(cleandocs, "((Mr|Ms)|Mrs)(.*?)\\(")))
  orgs <- sub("\\)$","",sub("^\\(","",str_extract(str_extract(cleandocs, "((Mr|Ms)|Mrs)(.*?)\\)+"),"\\(.*\\)")))
  
  df[[f]] <- data.frame(f, cleandocs, jobno, names, orgs, title, stringsAsFactors = FALSE)
}
df <- do.call(rbind, df)

#use the terms you want
dict <- dictionary(list(racism=c("race", "racis*")))
df <- df[!is.na(df$names),] #remove NA in names
df <- df[df$names!="character(0)",] #remove some sort of missing values in names
df <- df[!is.na(df$orgs),] #remove NA in orgs
df <- df[which(nchar(df$names)<20),] #remove names longer than 20 characters (error in processing)
corp <- corpus(df, text_field="cleandocs")
corpdfm <- dfm(corp, tolower = TRUE, remove_numbers = TRUE, remove_punct = TRUE, remove=stopwords("en"), groups = "orgs")
dictdfm <- dfm_lookup(corpdfm, dict, valuetype="regex", case_insensitive = TRUE) #apply the dictionary 
dictdfm <- dfm_sort(dictdfm, decreasing=TRUE, margin="documents")
dictdfm[1:20,] #see the top 20
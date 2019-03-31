fls <- list.files("~/Desktop/UN_meeting_records/txt")
df <- list()

for (f in fls){
  message(f)
  files <- readtext(paste0("~/Desktop/UN_meeting_records/txt/", f),
                    docvarsfrom = "filenames",
                    docvarnames = "job.number"
  )
  docs <- strsplit(files$text, split="\\n(?=[0-9]+\\.\\s((Mr|Ms)|Mrs))", perl=TRUE)
  cleandocs <- docs[[1]][2:length(docs[[1]])]

  title <- docs[[1]][1] 
  jobno <- files$job.number
  doc_id <- str_extract_all(cleandocs, "((Mr|Ms)|Mrs)(.*?)\\)+")
  names <- sub("\\s\\(","",(str_extract_all(cleandocs, "((Mr|Ms)|Mrs)(.*?)\\(")))
  orgs <- sub("\\)$","",sub("^\\(","",str_extract(str_extract(cleandocs, "((Mr|Ms)|Mrs)(.*?)\\)+"),"\\(.*\\)")))
  
  df[[f]] <- data.frame(f, cleandocs, jobno, names, orgs, title, stringsAsFactors = FALSE)
}
df <- do.call(rbind, df)

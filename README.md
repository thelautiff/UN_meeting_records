# Investigating UN Meeting Records

How to:

1. Obtain the metadata from [United Nations digital library search](https://digitallibrary.un.org)
2. Use `rvest` and `download.files` to scrape the pdfs from the search results
3. Convert the pdfs to txt files
4. Read them into R
5. Split each file up by speaker
6. Use regular expression pattern matching to extract the speakers' names and organisations
7. Use `quanteda` to create a dictionary to see which speakers/organisations are talking about a topic of interest the most

I had to do this for a project, so I thought I'd share my code to save someone else the pain of having to figure this out from scratch.

Find the guide [here](https://github.com/thelautiff/UN_meeting_records/blob/master/UN%20Digital%20Library%20Search%20Results.Rmd) in an R Markdown file.

I've included some random search results in the `results.csv` file for you to experiment with.

This will be quite a detailed walkthrough; for a more advanced alternative try [this guide](http://pablobarbera.com/ECPR-SC104/code/11-data-in-PDFs.html) by Dr Pablo Barberá.

Many thanks to [Dr Pablo Barberá](http://pablobarbera.com) and [Dr Gokhan Ciflikli](https://www.gokhan.io/) for their invaluable help and advice.

Feedback would be greatly appreciated!

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

Find the guide [here](https://github.com/thelautiff/UN_meeting_records/blob/master/UN%20Digital%20Library%20Search%20Results.Rmd) (it's an R Markdown file). I've set the working directories in the Markdown file to make it work if you clone the whole respository to your ~/Desktop and run the code; the pdf and txt folders are empty and ready to receive downloads of the pdf files/converted txt files. If you'd like to see the nicely rendered html result of the Markdown file, you'll need to first clone/download the repository.

If you're too impatient to read the guide, the code in [Part 1](Part 1.R) converts your pdfs to txt files: all you need is a data frame/csv file with a column containing the links to the pdfs you want to download i.e. [this](https://digitallibrary.un.org/record/733519/files/A_HRC_21_NGO_67-EN.pdf) not [this](https://digitallibrary.un.org/record/733519?ln=en). [Part 2](Part 2.R) covers steps 4-7 above, but you'll need to have your txt files in the txt folder for it to work.

I've included some random search results in the `results.csv` file for you to experiment with.

This will be quite a detailed walkthrough; for a more advanced alternative try [this guide](http://pablobarbera.com/ECPR-SC104/code/11-data-in-PDFs.html) by Dr Pablo Barberá.

Many thanks to [Dr Pablo Barberá](http://pablobarbera.com) and [Dr Gokhan Ciflikli](https://www.gokhan.io/) for their invaluable help and advice.

Feedback would be greatly appreciated!

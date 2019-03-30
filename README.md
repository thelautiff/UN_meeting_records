# Investigating UN Meeting Records

How to:

1. Obtain the metadata from United Nations digital library search (https://digitallibrary.un.org)
2. Use `rvest` to scrape the pdfs from the search results
3. Convert them to .txt files
4. Read them into R
5. Split each file up by speaker
6. Use regular expressions to extract the speakers' names and organisations
7. Use `quanteda` to create a dictionary of terms of interest to see which speakers/organisations are talking about a topic the most

I had to carry out the above for a project so I thought I'd share my code to save someone else the pain of having to figure this out from scratch.

Many thanks to Dr Pablo Barberá and Dr Gokhan Ciflikli for their invaluable help and advice.

Feedback would be greatly appreciated

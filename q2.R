# Load the Gross Domestic Product data for the 190 ranked countries in this 
# data set: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
#
# Remove the commas from the GDP numbers in millions of dollars and average them. 
# What is the average? 
#
# Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table

################################################################################
getData <- function() {
################################################################################

  # add data dir
  if (!file.exists("data")) {
    dir.create("data")
  }

  # fetch and return
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileUrl, destfile = "./data/data2.csv", method = "curl")
  data <- read.csv("./data/data2.csv", skip = 4, nrows = 190)
  return(data)
}

################################################################################
main <- function() {
################################################################################
  data <- getData()
  print(mean(as.numeric(gsub(",","", data$X.4))))
}

main()

# 377652.4

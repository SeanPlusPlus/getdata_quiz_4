# In the data set from Question 2 what is a regular expression that would allow you to count the
# number of countries whose name begins with "United"? Assume that the variable with the country
# names in it is named countryNames. How many countries begin with United?

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
  Sys.setlocale(locale="C")
  data <- getData()
  countryNames <- data$X.3
  print(length(grep("^United", countryNames)))
}

main()

# 3

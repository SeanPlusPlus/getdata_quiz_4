# The American Community Survey distributes downloadable data about United 
# States communities. Download the 2006 microdata survey about housing for 
# the state of Idaho using download.file() from here: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
#
# and load the data into R. The code book, describing the variable names is here: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
#
# Apply strsplit() to split all the names of the data frame on the characters 
# "wgtp". What is the value of the 123 element of the resulting list?

################################################################################
getData <- function() {
################################################################################

  # add data dir
  if (!file.exists("data")) {
    dir.create("data")
  }

  # fetch and return
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileUrl, destfile = "./data/data1.csv", method = "curl")
  data <- read.csv("./data/data1.csv")
  return(data)
}

################################################################################
main <- function() {
################################################################################
  data <- getData()
  splitnames <- strsplit(names(data), "wgtp")
  print(splitnames[[123]])
}

main()

# ""   "15"

#Load the Gross Domestic Product data for the 190 ranked countries in this data set: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

#Load the educational data from this data set: 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

#Match the data based on the country shortcode. Of the countries for which the end of the fiscal year
#is available, how many end in June? 

#Original data sources: 
#http://data.worldbank.org/data-catalog/GDP-ranking-table 
#http://data.worldbank.org/data-catalog/ed-stats

################################################################################
getData <- function() {
################################################################################

  # add data dir
  if (!file.exists("data")) {
    dir.create("data")
  }

  # fetch and return
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileUrl, destfile = "./data/data4_gdp.csv", method = "curl")
  gdp <- read.csv("./data/data4_gdp.csv", skip = 4, nrows = 190)

  # fetch and return
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileUrl, destfile = "./data/data4_ed.csv", method = "curl")
  ed <- read.csv("./data/data4_ed.csv")

  return(list(gdp, ed))
}

################################################################################
main <- function() {
################################################################################
  data  <- getData()
  gdp   <- data[[1]]
  ed    <- data[[2]]
  notes <- ed$Special.Notes
  notes <- notes[notes != ""]
  print(length(intersect(grep("June", notes), grep("Fiscal", notes))))
}

main()

# 13

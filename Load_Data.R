## Load Data  ##
# load required package
if (!require(dplyr)){
  install.packages("dplyr")
}
require(dplyr)
# link zip url
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download the file into your working directory
download.file(fileURL, destfile = "electric_power.zip")
e <- unzip("electric_power.zip", files = NULL)
e <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
e$Date <- as.Date(e$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
e <- subset(e,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# remove incomplete cases
e <- e[complete.cases(t),]

# combine date and time columns
dateTime <- paste(e$Date, e$Time)
dateTime <- setNames(dateTime, "DateTime")

e <- e[ ,!(names(t) %in% c("Date", "Time"))]
e <- cbind(dateTime, t)
e$dateTime <- as.POSIXct(dateTime)

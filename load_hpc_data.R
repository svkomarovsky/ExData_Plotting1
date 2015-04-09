library(lubridate)

download_data = function() {
  if (!file.exists('household_power_consumption.zip')) {
    #download files
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zipfile = "household_power_consumption.zip"
    download.file(fileURL, destfile=zipfile, method="curl")
    unzip(zipfile)  
  }
}
read_data = function() {
  # Read data into a table with appropriate classes
  df <- read.csv2( "household_power_consumption.txt", header = TRUE, na.strings = c("?"), dec="."  )
  #subset data
  df <- subset(df, df$Date=="1/2/2007" | df$Date=="2/2/2007") 
  #Modify data 
  df$Date <- as.character(df$Date)
  df$Time <- as.character(df$Time)
  
  df$Timestamp <- strptime(paste(df$Date,df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  df
}
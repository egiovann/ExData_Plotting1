library(dplyr)

## Set your working directory
setwd()
## Set the location of the data "household_power_consumption.txt"
data_path <-""

## Read the data
data <- read.table(data_path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data, keep only the data from the 1/2/2007 and 2/2/2007
data_sub <- subset(data,(Date == "1/2/2007" | Date =="2/2/2007"))

## Convert the date to Date classes : the result in stored in a new column Date_and_Time
data_sub <- mutate(data_sub, Date_and_Time = strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

##Create the png for plot2
png(paste("plot2.png",sep=""),width=480, height=480)
plot(data_sub$Date_and_Time,as.numeric(data_sub$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

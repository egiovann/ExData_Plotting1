library(plyr)

## Set your working directory
setwd("")
## Set the location of the data "household_power_consumption.txt"
data_path <-""

## Read the data
data <- read.table(data_path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data, keep only the data from the 1/2/2007 and 2/2/2007
data_sub <- subset(data,(Date == "1/2/2007" | Date =="2/2/2007"))

## Convert the date to Date classes : the result in stored in a new column Date_and_Time
data_sub <- mutate(data_sub, Date_and_Time = strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

##Create the png for plot3
png("plot3.png",width=480, height=480)
plot(data_sub$Date_and_Time,as.numeric(data_sub$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines(data_sub$Date_and_Time,as.numeric(data_sub$Sub_metering_2),type="l",col="red")
lines(data_sub$Date_and_Time,as.numeric(data_sub$Sub_metering_3),type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),bty="n")
dev.off()


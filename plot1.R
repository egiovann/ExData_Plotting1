library(plyr)

## Set your working directory
dir <-""
## Set the location of the data
data_path <-""

## Read the data
data <- read.table(data_path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data, keep only the data from the 1/2/2007 and 2/2/2007
data_sub <- subset(data,(Date == "1/2/2007" | Date =="2/2/2007"))

##Create the png for plot1
png(paste(dir,"plot1.png",sep=""),width=480, height=480)
hist(as.numeric(data_sub$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

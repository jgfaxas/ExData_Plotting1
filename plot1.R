# Plot1 generator

## Loading the data (asumming it is in the working directory)

fileName<-"household_power_consumption.txt"
data<- read.table(fileName,header=TRUE,sep=";",na.strings="?")

## Selecting dates
dataSelected<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

## Combining date and time variables
Date.Time<-paste(dataSelected$Date,dataSelected$Time,sep=",")

## date and time convertion to "Date format"
Date.Time<-strptime(Date.Time,"%d/%m/%Y,%H:%M:%S",tz="")

## Substitution of Date and Time for Date.Time in the data set
dataSelected<-subset(dataSelected, select=-c(Date,Time)) #Delete Date and Time from data frame
dataSelected<-cbind(Date.Time,dataSelected) #Add Date.Time to data frame



## Plot Global_active_power
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(dataSelected$Global_active_power,xlab="Global active power (kilowatts)",col="red",main="Global active power")
dev.off()

# Plot2 generator


## Loading the data (asumming it is in the working directory)

fileName<-"household_power_consumption.txt"
data<- read.table(fileName,header=TRUE,sep=";",na.strings="?")

## Selecting dates
dataSelected<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

## Combining date and time variables
Date.Time<-paste(dataSelected$Date,dataSelected$Time,sep=",")

## date and time convertion to "Date format"
Date.Time<-(strptime(Date.Time,"%d/%m/%Y,%H:%M:%S",tz=""))


## Substitution of Date and Time for Date.Time in the data set
dataSelected<-subset(dataSelected, select=-c(Date,Time)) #Delete Date and Time from data frame
dataSelected<-cbind(Date.Time,dataSelected) #Add Date.Time to data frame
dataSelected$Date.Time<-as.POSIXlt(dataSelected$Date.Time) #change to POSIXlt



## Plot Global_active_power
png(filename = "plot2.png",width = 480, height = 480, units = "px")
with(dataSelected,plot(Date.Time,Global_active_power,ylab="Global active power (kilowatts)",main="Time vs Global active power",type="n"))
with(dataSelected,lines(Date.Time,Global_active_power,lwd=1,col="blue"))
dev.off()


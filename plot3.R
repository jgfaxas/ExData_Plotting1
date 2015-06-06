# Plot3 generator


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



## Plot sub metering
png(filename = "plot3.png",width = 480, height = 480, units = "px")
with(dataSelected, plot(Date.Time,Sub_metering_1,ylab="Energy sub metering",main="",xlab="",type="l"))
with(dataSelected,lines(Date.Time,Sub_metering_2,col="blue"))
with(dataSelected,lines(Date.Time,Sub_metering_3,col="red"))
legend("topright",col=c("black","blue","red"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()


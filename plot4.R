# Plot4 generator


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



## multiple plots
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

### plot 1
with(dataSelected,plot(Date.Time,Global_active_power,ylab="Global active power",main="",type="n"))
with(dataSelected,lines(Date.Time,Global_active_power,lwd=1,col="blue"))

### plot 2
with(dataSelected,plot(Date.Time,Voltage,ylab="Voltage",main="",xlab="datetime",type="n"))
with(dataSelected,lines(Date.Time,Voltage,lwd=1,col="black"))

### plot 3

with(dataSelected, plot(Date.Time,Sub_metering_1,ylab="Energy sub metering",main="",xlab="",type="l"))
with(dataSelected,lines(Date.Time,Sub_metering_2,col="blue"))
with(dataSelected,lines(Date.Time,Sub_metering_3,col="red"))
legend("topright",col=c("black","blue","red"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

### plot 4
with(dataSelected,plot(Date.Time,Global_reactive_power,main="",type="n",xlab="datetime"))
with(dataSelected,lines(Date.Time,Global_reactive_power,lwd=1,col="blue"))

dev.off()

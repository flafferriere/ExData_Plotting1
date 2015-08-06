# read the Zip file 

PowerCons<-read.table("household_power_consumption.txt",sep=';', header=TRUE,na.strings="?")
PowerCons$Date<-as.Date(PowerCons$Date,"%d/%m/%Y")
PowerCons$Time<-paste(PowerCons$Date,PowerCons$Time)
PowerCons$Date<-NULL
PowerCons$Time <- strptime(PowerCons$Time,"%Y-%m-%d %H:%M:%S")
PowerConsSelect<-subset(PowerCons,Time<"2007-02-03" & Time>="2007-02-01")

par(mfcol=c(2,2))

#1st Graph
with(PowerConsSelect,plot(Time, Global_active_power,xlab="",ylab = "Global Active Power",type="l"))

#2nd Graph
with(PowerConsSelect,plot(Time, Sub_metering_1,xlab="",ylab = "Energy Sub Metering",type="l"))
with(PowerConsSelect,lines(Time, Sub_metering_2,col="red"))
with(PowerConsSelect,lines(Time, Sub_metering_3,col="blue"))
legend( "topright",bty="n",c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty =c(1,1,1),col=c("black","red","blue"))

#3rd Graph
with(PowerConsSelect,plot(Time, Voltage,xlab="datetime",ylab = "Voltage",type="l"))

#4th Graph
with(PowerConsSelect,plot(Time, Global_reactive_power,xlab="datetime",ylab = "Global_Reactive_Power",type="l"))

dev.copy(png,file="plot4.png",width=480, height=480)
dev.off()
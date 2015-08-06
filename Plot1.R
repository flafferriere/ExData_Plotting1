# read the Zip file 

PowerCons<-read.table("household_power_consumption.txt",sep=';', header=TRUE,na.strings="?")
PowerCons$Date<-as.Date(PowerCons$Date,"%d/%m/%Y")
PowerCons$Time<-paste(PowerCons$Date,PowerCons$Time)
PowerCons$Date<-NULL
PowerCons$Time <- strptime(PowerCons$Time,"%Y-%m-%d %H:%M:%S")
PowerConsSelect<-subset(PowerCons,Time<"2007-02-03" & Time>="2007-02-01")

par(mfcol=c(1,1))

hist(PowerConsSelect$Global_active_power,col = "red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()
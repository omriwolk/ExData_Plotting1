hpc<-read.table("household_power_consumption.txt",
na.strings="?",
sep=";",
skip=66637,
nrow=2881,
col.names=colnames(read.table("household_power_consumption.txt",nrow=1,sep=";",
header=TRUE)))

hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

hpc$Time<-strptime(hpc$Time,"%H:%M:%S")

hpc$Time<-format(hpc$Time,"%H:%M:%S")

datetime<-paste(hpc$Date,hpc$Time)

datetime<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

hpc$datetime<-datetime


par(mfcol=c(2,2))

plot(hpc$datetime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowats)")

plot(hpc$datetime,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(hpc$datetime,hpc$Sub_metering_2,type="l",col="red")
points(hpc$datetime,hpc$Sub_metering_3,type="l",col="blue")
legend("topright",pch="________",col=c("black","red","blue"),legend=names(hpc[ ,7:9]))


plot(hpc$datetime,hpc$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(hpc$datetime,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")




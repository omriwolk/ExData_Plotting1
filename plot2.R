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

png(file="plot2.png")

plot(hpc$datetime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowats)")

dev.off()


hpc<-read.table("household_power_consumption.txt",
na.strings="?",
sep=";",
skip=66637,
nrow=2880,
col.names=colnames(read.table("household_power_consumption.txt",nrow=1,sep=";",
header=TRUE)))

hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

hpc$Date<-format(hpc$Date,"%d-%m-%Y")

hpc$Time<-strptime(hpc$Time,"%H:%M:%S")

hpc$Time<-format(hpc$Time,"%H:%M:%S")

png(file="plot1.png")

hist(hpc$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power(kilowats)")

dev.off()

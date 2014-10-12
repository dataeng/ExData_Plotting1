# read the dataset
data<-read.csv("household_power_consumption.txt",sep=";")

# subset the dataset to the dates '2007-02-01' and '2007-02-02'
d2<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# convert first&second columns to date-time format
dt <- strptime(paste(d2$Date,d2$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")

# convert 3-5,7-9 columns to numeric
d2[,3]<-as.numeric(sub(",", ".", d2[,3], fixed = TRUE))
d2[,4]<-as.numeric(sub(",", ".", d2[,4], fixed = TRUE))
d2[,5]<-as.numeric(sub(",", ".", d2[,5], fixed = TRUE))
d2[,7]<-as.numeric(sub(",", ".", d2[,7], fixed = TRUE))
d2[,8]<-as.numeric(sub(",", ".", d2[,8], fixed = TRUE))
d2[,9]<-as.numeric(sub(",", ".", d2[,9], fixed = TRUE))

# set the english locale to print weekday names in English 
Sys.setlocale("LC_TIME","en_US.utf8")

# make four plots on the same canvas
par(mfrow=c(2,2))

# upper-left plot
plot(dt, d2[,3], xlab="", ylab="Global Active Power", main=NULL, type="l")

# upper-right plot
plot(dt, d2[,5], xlab="datetime", ylab="Voltage", main=NULL, type="l")

# bottom-left plot
plot(dt, d2[,7], xlab="", ylab="Energy sub metering", main=NULL, type="l")
lines(dt,d2[,8], col="red")
lines(dt,d2[,9], col="blue")
legend("topright",c('Sub_metering_1   ','Sub_metering_2   ','Sub_metering_3   '), lty=1, col=c('black','red','blue'))

# bottom-right plot
plot(dt, d2[,4], xlab="datetime", ylab="Global_reactive_power", main=NULL, type="l")

# create png with Plot4
dev.copy(png,file="plot4.png")
dev.off()

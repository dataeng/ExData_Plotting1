# read the dataset; for third plot first two and last three columns needed and hence read
data<-read.csv("household_power_consumption.txt",sep=";")[,c(1:2,7:9)]

# subset the dataset to the dates '2007-02-01' and '2007-02-02'
d2<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# convert 3-5 columns (i.e., Sub_metering_ -values) to numeric
d2[,3]<-as.numeric(sub(",", ".", d2[,3], fixed = TRUE))
d2[,4]<-as.numeric(sub(",", ".", d2[,4], fixed = TRUE))
d2[,5]<-as.numeric(sub(",", ".", d2[,5], fixed = TRUE))

# convert first&second columns to date-time format
dt <- strptime(paste(d2$Date,d2$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")

# set the english locale to print weekday names in English 
Sys.setlocale("LC_TIME","en_US.utf8")

# make plot with required lines, labels and legend
plot(dt, d2[,3], xlab="", ylab="Energy sub metering", main=NULL, type="l")
lines(dt,d2[,4], col="red")
lines(dt,d2[,5], col="blue")
legend("topright",c('Sub_metering_1 ','Sub_metering_2 ','Sub_metering_3 '), lty=1, col=c('black','red','blue'))

# create png with Plot3
dev.copy(png,file="plot3.png")
dev.off()

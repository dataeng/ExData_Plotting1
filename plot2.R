# read the dataset; for second plot only first three columns needed and hence read
data<-read.csv("household_power_consumption.txt",sep=";")[,1:3]

# subset the dataset to the dates '2007-02-01' and '2007-02-02'
d2<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# convert third column (i.e., Global_active_power) to numeric
d2[,3]<-as.numeric(sub(",", ".", d2[,3], fixed = TRUE))

# convert first&second columns to date-time format
dt <- strptime(paste(d2$Date,d2$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")

# set the english locale to print weekday names in English 
Sys.setlocale("LC_TIME","en_US.utf8")

# make plot with required labels
plot(dt, d2[,3], xlab="", ylab="Global Active Power (kilowatts)", main=NULL, type="l")

# create png with Plot2
dev.copy(png,file="plot2.png")
dev.off()

# read the dataset; for first plot only first three columns needed and hence read
data<-read.csv("household_power_consumption.txt",sep=";")[,1:3]

# subset the dataset to the dates '2007-02-01' and '2007-02-02'
d2<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# convert third column (i.e., Global_active_power) to numeric
d2[,3]<-as.numeric(sub(",", ".", d2[,3], fixed = TRUE))

# plot histogram with required labels
hist(d2[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# create png with Plot1
dev.copy(png,file="plot1.png")
dev.off()
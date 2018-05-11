#load data into R
data1 <- read.table("./Week1Project/Electric Power Consumption/household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
#format timestamp/date
datetime<- strptime(paste(data1$Date, data1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
#bind data with timestamp with date
data2=cbind(data1,datetime)
#format date
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
#subset by date
data3 <- data2[(data2$Date=="2007-02-01")|(data2$Date== "2007/02/02"),]
#plot data by required specifications
plot(data3$datetime, data3$Global_active_power, type="l", xlab= "", ylab="Global Active Power (kilowatts)")
#render plot as png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

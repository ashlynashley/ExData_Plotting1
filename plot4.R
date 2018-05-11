#load data into R
data1 <- read.table("./Week1Project/Electric Power Consumption/household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
#format date/time
data1$datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
#subset by date
data1 <- subset(data1, as.Date(datetime) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
#shows 2 by 2 for 4 graphs
par(mfrow=c(2,2))
#plot #1
plot(data1$datetime,data1$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#plot #2
plot(data1$datetime,data1$Voltage, type="l", xlab="datetime", ylab="Voltage")
#plot #3
with(data1,plot(datetime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
    with(data1,lines(datetime,Sub_metering_2,col="red"))
    with(data1,lines(datetime,Sub_metering_3,col="blue"))
    legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), bty="n")
#plot #4
 with(data1, plot(datetime, Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power"))
#render as png
 dev.copy(png, file="plot4.png", width=480, height=480)
 dev.off()
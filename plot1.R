
#load data into R
data1 <- read.table("./Week1Project/Electric Power Consumption/household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
#format date
data1$Date <- as.Date(data1$Date,"%d/%m/%Y")
#subet data by date
data2 <- data1[(data1$Date=="2007-02-01")|(data1$Date== "2007/02/02"),]
#create hist diagram by required specifications
hist(data2$Global_active_power, main = "Global Active Power", col = "red", xlab= "Global Active Power (kilowatts)", ylab="Frequency")
#render png of hist
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

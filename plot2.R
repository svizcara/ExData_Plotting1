##LOAD DATA
data <- read.table("household_power_consumption.txt",
                   sep=";",na.strings = "?",
                   skip=66637, nrows=2879,
                   col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                                 "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                   colClasses = c("character","character",
                                  "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$datetime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#PLOT DATA
png(file="plot2.png", width = 480, height=480)
with(data, plot(datetime, Global_active_power, type="n",
     xlab="",ylab="Global Active Power (kilowatts)"))
lines(datetime, data$Global_active_power)
dev.off()

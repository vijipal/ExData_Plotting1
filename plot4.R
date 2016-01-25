#Using sqldf package, saved the subset of data needed into a local txt file and used it here. 
#See plot1.R for how data has been retrieved
tdata <- read.table("power_consumption_subset.txt")
ttdate <- paste(tdata$Date,":" ,tdata$Time)
gDate <- strptime(ttdate, "%d/%m/%Y : %H:%M:%S")
mynew <- cbind(tdata,gDate)


png(filename="plot4.png")
par(mfrow = c(2,2))
plot(mynew$Global_active_power~mynew$gDate, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(mynew$Voltage~mynew$gDate, type="l",xlab="datetime", ylab="Voltage")
plot(mynew$Global_reactive_power~mynew$gDate, type="l",xlab="datetime", ylab="Global_reactive_power")
dev.off()

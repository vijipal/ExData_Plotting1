
data <- read.table("household_power_consumption.txt",
                   header = TRUE, 
                   sep=";", 
                   na.strings = "?")

datafeb <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datafeb$Timestamp <- strptime(paste(datafeb$Date,datafeb$Time),format="%d/%m/%Y %H:%M:%S")


# PLOT 3


png(file = "plot3.png", width = 480, height = 480, units = "px")


plot(datafeb$Timestamp,datafeb$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering") 
lines(datafeb$Timestamp,datafeb$Sub_metering_2,
      type="l",
      xlab="",
      ylab="Energy sub metering",
      col = "red") 
lines(datafeb$Timestamp,datafeb$Sub_metering_3,
      type="l",
      xlab="",
      ylab="Energy sub metering",
      col = "blue") 

legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()


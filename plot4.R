#package that can perform SQL selects in data frames.
#used sqldf to read only the data that is needed into memory
library(sqldf)
#File copied to local from the url given
myfile <- "household_power_consumption.txt"
fi <- file(myfile)

#2 select statements each specifying a different Date
mydf1 <- sqldf("select * from fi where Date == '1/2/2007'",file.format = list(header = TRUE, sep = ";"))

mydf2 <- sqldf("select * from fi where Date == '2/2/2007'",file.format = list(header = TRUE, sep = ";"))

# close the connection
close(fi)   
#added the 2 rows from the sql select into 1 data frame
tdata <-  rbind(mydf1,mydf2)
ttdate <- paste(tdata$Date,":" ,tdata$Time)

gDate <- strptime(ttdate, "%d/%m/%Y : %H:%M:%S")
mynew <- cbind(tdata,gDate)


png(filename="plot4.png")
par(mfrow = c(2,2))

#plot1
plot(mynew$Global_active_power~mynew$gDate, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot2
plot(mynew$Voltage~mynew$gDate, type="l",xlab="datetime", ylab="Voltage")

#plot3

plot(mynew$gDate,mynew$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering") 
lines(mynew$gDate,datafeb$Sub_metering_2,
      type="l",
      xlab="",
      ylab="Energy sub metering",
      col = "red") 
lines(mynew$gDate,datafeb$Sub_metering_3,
      type="l",
      xlab="",
      ylab="Energy sub metering",
      col = "blue") 

legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(mynew$Global_reactive_power~mynew$gDate, type="l",xlab="datetime", ylab="Global_reactive_power")
dev.off()

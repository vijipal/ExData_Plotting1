
#package that can perform SQL selects in data frames
# used to avoid loading entire data into memory
library(sqldf)
#Complete file copied to local from the url given in assignment
myfile <- "household_power_consumption.txt"
fi <- file(myfile)

#2 select statements each specifying a different Date
mydf1 <- sqldf("select * from fi where Date == '1/2/2007'",file.format = list(header = TRUE, sep = ";"))

mydf2 <- sqldf("select * from fi where Date == '2/2/2007'",file.format = list(header = TRUE, sep = ";"))

# close the connection
close(fi)   
 #added the 2 rows from the sql select into 1 data frame
finaldata <-  rbind(mydf1,mydf2)

#default width and height is specified in project and hence did not add it in code
png(filename = "plot1.png")
with(finaldata,hist(Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

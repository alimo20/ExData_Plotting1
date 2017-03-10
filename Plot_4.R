
#read in a large portion of the data set first
myData <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = "?", nrows=80000, stringsAsFactors = FALSE)
#subset out the values
testData1 <- subset(myData, Date=='1/2/2007')
testData2 <- subset(myData, Date=='2/2/2007')
myData <- rbind(testData1, testData2)

##4.4
png(filename="Plot_4.png")
par(mfrow = c(2,2))
with( myData, {
  plot(Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", xaxt='n' )
  axis(1, at= c(0,1500,2800), c("Thu", "Fri", "Sat"))
  plot(Voltage, type = "l", xlab="", ylab="Voltage", xaxt='n')
  axis(1, at= c(0,1500,2800), c("Thu", "Fri", "Sat"))
  mtext("datetime",side = 1, line = 3)
  plot(Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt='n' )
  points(Sub_metering_2, type = "l", col="red")
  points(Sub_metering_3, type = "l", col="blue")
  axis(1, at= c(0,1500,2800), c("Thu", "Fri", "Sat"))
  legend("topright", c("Sub_metering1", "Sub_metering2", "Sub_metering3"), pt.cex = 1, cex=0.5,lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black", "blue", "red"))
  plot(Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power", xaxt ='n', lwd=0.3)
  axis(1, at= c(0,1500,2800), c("Thu", "Fri", "Sat"))
  mtext("datetime",side = 1, line = 3)
})
dev.off()
#read in a large portion of the data set first
myData <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = "?", nrows=80000, stringsAsFactors = FALSE)
#subset out the values
testData1 <- subset(myData, Date=='1/2/2007')
testData2 <- subset(myData, Date=='2/2/2007')
myData <- rbind(testData1, testData2)

png(filename="Plot_2.png")
plot(myData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt='n' )
axis(1, at= c(0,1500,2800), c("Thu", "Fri", "Sat"))
dev.off()

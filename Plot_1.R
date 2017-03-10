
#read in a large portion of the data set first
myData <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = "?", nrows=80000, stringsAsFactors = FALSE)
#subset out the values
testData1 <- subset(myData, Date=='1/2/2007')
testData2 <- subset(myData, Date=='2/2/2007')
myData <- rbind(testData1, testData2)

##4.1
png(filename="Plot_1.png")
hist(myData$Global_active_power, 
     col="Red", 
     main= "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     ylim = c(0,1300))
par(mar= c(4,4,3,3))
dev.off()
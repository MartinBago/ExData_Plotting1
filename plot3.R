dataSubor <- "./household_power_consumption.txt"
data3 <- read.table(dataSubor, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data3[data3$Date %in% c("1/2/2007","2/2/2007") ,]
denny_cas <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMeteringOne <- as.numeric(subSetData$Sub_metering_1)
subMeteringTwo <- as.numeric(subSetData$Sub_metering_2)
subMeteringThree <- as.numeric(subSetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(denny_cas, subMeteringOne, type="l", ylab="Energy Submetering", xlab="")
lines(denny_cas, subMeteringTwo, type="l", col="red")
lines(denny_cas, subMeteringThree, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

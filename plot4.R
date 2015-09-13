dataSubor <- "./data/household_power_consumption.txt"
data4 <- read.table(dataSubor, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data4[data$Date %in% c("1/2/2007","2/2/2007") ,]

denny_cas <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMeteringOne <- as.numeric(subSetData$Sub_metering_1)
subMeteringTwo <- as.numeric(subSetData$Sub_metering_2)
subMeteringThree <- as.numeric(subSetData$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(denny_cas, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(denny_cas, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(denny_cas, subMeteringOne, type="l", ylab="Energy Submetering", xlab="")
lines(denny_cas, subMeteringTwo, type="l", col="red")
lines(denny_cas, subMeteringThree, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(denny_cas, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

dataSubor <- "./data/household_power_consumption.txt"
data2 <- read.table(dataSubor, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]

denny_cas <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(denny_cas, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


dataSubor <- "./household_power_consumption.txt"
data <- read.table(dataSubor, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePowerprem <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePowerprem, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

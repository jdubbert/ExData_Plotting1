## Download files and subset data to respective dates
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile= "electricpower.zip", method= "curl")
unzip("electricpower.zip")
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
subsetData<- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

datetime<- strptime(paste(subsetData$Date, subsetData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")
globalactivepower<- as.numeric(subsetData$Global_active_power)
subMetering1<- as.numeric(subsetData$Sub_metering_1)
subMetering2<- as.numeric(subsetData$Sub_metering_2)
subMetering3<- as.numeric(subsetData$Sub_metering_3)

png("plot3.png")
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, col="red", type = "l")
lines(datetime, subMetering3, col= "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()

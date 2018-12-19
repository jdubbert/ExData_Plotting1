
## Download files and subset data to respective dates
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile= "electricpower.zip", method= "curl")
unzip("electricpower.zip")
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
subsetData<- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

## Create graph
globalactivepower<- as.numeric(subsetData$Global_active_power)
png("plot1.png")
hist(globalactivepower, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

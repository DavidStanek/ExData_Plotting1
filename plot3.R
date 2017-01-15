## plot 3

# reading data into R, subsetting data, fixing dates

power <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".", stringsAsFactors = F)
names(power)
sub_pow <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
head(sub_pow)
rec_date <- paste(sub_pow$Date, sub_pow$Time, sep = " ")
rec_date2 <- strptime(rec_date, "%d/%m/%Y %H:%M:%S") 
class(rec_date2); length(rec_date2)

# changing sub_metering variables to numeric and making the chart

sub_met_1 <- as.numeric(sub_pow$Sub_metering_1)
sub_met_2 <- as.numeric(sub_pow$Sub_metering_2)
sub_met_3 <- as.numeric(sub_pow$Sub_metering_3)

png(file = "plot3.png", width = 480, height = 480)
plot(rec_date2, sub_met_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
points(rec_date2, sub_met_2, type = "l", col = "red")
points(rec_date2, sub_met_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

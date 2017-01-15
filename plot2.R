## plot 2

# reading data into R, subsetting data, fixing dates

power <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".", stringsAsFactors = F)
names(power)
sub_pow <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
head(sub_pow)
rec_date <- paste(sub_pow$Date, sub_pow$Time, sep = " ")
rec_date2 <- strptime(rec_date, "%d/%m/%Y %H:%M:%S") 
class(rec_date2); length(rec_date2)

# changing global_active_power to numeric and making the chart

glob_act_pow <- as.numeric(sub_pow$Global_active_power)
png(file = "plot2.png", width = 480, height = 480)
plot(rec_date2, glob_act_pow, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
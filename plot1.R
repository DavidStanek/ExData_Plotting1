## plot 1

# reading data into R, subsetting data, first feel for the data

power <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".", stringsAsFactors = F)
names(power)
sub_pow <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
dim(sub_pow)
class(sub_pow)
head(sub_pow)
str(sub_pow)

# most of the variables are chars...

glob_act_pow <- as.numeric(sub_pow$Global_active_power)
png(file = "plot1.png", width = 480, height = 480)
hist(glob_act_pow, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
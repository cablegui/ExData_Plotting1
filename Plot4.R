#Plot4.R

# Read the Electric powere consumption 
elecPowCons <- read.table(file="./data/household_power_consumption.txt",sep=";", na.strings="?", header=TRUE)

# coerce into date format
elecPowCons$Date <- as.Date(as.character(elecPowCons$Date), format = "%d/%m/%Y")

# coerce into datetime format
elecPowCons$datetime <- strptime(as.character(paste(elecPowCons$Date,elecPowCons$Time)) ,  format = "%Y-%m-%d %H:%M:%S")

#Get subset of data between dates 2007-02-01 and 2007-02-02
elecPowConsSubset <- with( elecPowCons, elecPowCons[Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"), ])


dev.off()
#Code to save plot to png format
png("Plot4.png", width = 480, height = 480)

#Plot 4 Answer
par(mfcol = c(2,2), mar = c(4,4,2,2))
# Plot Plot2.R
with(elecPowConsSubset, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatt)"))
#Plot line for Plot3.R
with(elecPowConsSubset, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", col = "black"))
with(elecPowConsSubset, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(elecPowConsSubset, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", bty = "n", lty=1,text.font = 6, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Voltage plot
with(elecPowConsSubset, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#Global Reactive Power
with(elecPowConsSubset, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power"))

dev.off()

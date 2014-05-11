setwd("D:\\COURSERA\\DataSCientist\\Course4ExploratoryDataAnalysis")

#Read the Electric powere consumption 
elecPowCons <- read.table(file="./data/household_power_consumption.txt",sep=";", na.strings="?", header=TRUE)

# coerce into date format
elecPowCons$Date <- as.Date(as.character(elecPowCons$Date), format = "%d/%m/%Y")

# coerce into datetime format
elecPowCons$datetime <- strptime(as.character(paste(elecPowCons$Date,elecPowCons$Time)) ,  format = "%Y-%m-%d %H:%M:%S")

#Get subset of data between dates 2007-02-01 and 2007-02-02
elecPowConsSubset <- with( elecPowCons, elecPowCons[Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"), ])


dev.off()
#Code to save plot to png format
png("Plot1.png", width = 480, height = 480)

#Plot histogram for Plot1.R
with(elecPowConsSubset, hist(Global_active_power, col="red", main="Global Active Power"))
dev.off()









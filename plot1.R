#Course Project 1
#Read the data into R with missing values as "?" and separated by ";"

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)

#To check if the dataset has 2,075,259 rows and 9 columns
summary(data)

#Convert date as format = "%d/%m/%Y" and time as"%H:%M:%S"
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- as.Date(data$Time, format = "%H:%M:%S")
head(data)
summary(data)

#Select only from the dates 2007-02-01 to 2007-02-02
#This means to subset 
subsetdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Defining the png plot area with the given dimensions
png("plot1.png", width = 480, height = 480, unit = "px")

#
hist(subsetdata$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts")
#Close the file
dev.off()
dev.cur()

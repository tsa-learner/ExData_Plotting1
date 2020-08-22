#Course Project 1
#Plotting the second graph
#Read the data into R with missing values as "?" and separated by ";"

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE, dec = ".")

#To check if the dataset has 2,075,259 rows and 9 columns
summary(data)

#Convert date as format = "%d/%m/%Y"
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


#Select only from the dates 2007-02-01 to 2007-02-02
#This means to subset 
subsetdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting dates 
date_time <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$Date_time <- as.POSIXct(date_time)



#Defining the png plot area with the given dimensions

#For Plot2
png("plot3.png", width = 480, height = 480, unit = "px")

#
plot(subsetdata$Sub_metering_1 ~ subsetdata$Date_time, type = "l", 
     ylab= "Energy sub metering", xlab = "")
lines(subsetdata$Sub_metering_2 ~ subsetdata$Date_time, col = "Red")
lines(subsetdata$Sub_metering_3 ~ subsetdata$Date_time, col = "Blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
dev.cur()



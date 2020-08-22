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

#For Plot4
png("plot4.png", width = 480, height = 480, unit = "px")

#Plotting four graphs on the same page into 4 quadrants
par(mfrow = c(2,2))
#First plot
plot(subsetdata$Global_active_power ~ subsetdata$Date_time, type = "l", 
     ylab= "Global Active Power", xlab = "")
#second plot
plot(subsetdata$Voltage ~ subsetdata$Date_time, type = "l", 
     ylab = "Voltage", xlab = "datetime")
#third plot
plot(subsetdata$Sub_metering_1 ~ subsetdata$Date_time, type = "1", 
     ylab = "Energy sub metering", xlab = "")
lines(subsetdata$Sub_metering_2 ~ subsetdata$Date_time, col = "Red")
lines(subsetdata$Sub_metering_3 ~ subsetdata$Date_time, col = "Blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#fourth plot
plot(subsetdata$Global_reactive_power ~ subsetdata$Date_time, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")


dev.off()
dev.cur()



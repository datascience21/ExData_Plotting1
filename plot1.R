# Create a folder "course4" under the working directory anad place the downloaded
#file

# Reading file data
data <- read.table("course4/household_power_consumption.txt", sep =";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), header = TRUE ,na.string = "?")

#Converting data$Date column to Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting 2007-Feb-01 and 2007-Feb-02 data from the original data set
datasubset <- subset(data,data$Date >="2007-02-01" & data$Date <="2007-02-02")

#Saving the plot to plot1.png in working directory
png(filename = "plot1.png" , width=480,height = 480)
#Creating a histogram plot
hist(datasubset$Global_active_power,col = "red" , xlab = "Global  Active Power (kilowatts)", main = "Global Active  Power")
dev.off()
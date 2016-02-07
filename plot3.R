# Create a folder "course4" under the working directory anad place the downloaded
#file

# Reading file data
data <- read.table("course4/household_power_consumption.txt", sep =";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), header = TRUE ,na.string = "?")

#Converting data$Date column to Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting 2007-Feb-01 and 2007-Feb-02 data from the original data set
datasubset <- subset(data,data$Date >="2007-02-01" & data$Date <="2007-02-02")

#Concatenating Date and Time columns and conveting the column to Time class
datasubset$DateTime <-paste(datasubset$Date,datasubset$Time)
datasubset$DateTime<-strptime(datasubset$DateTime,"%Y-%m-%d %H:%M:%S")

#Saving the plot to plot3.png in working directory
png(filename = "plot3.png" , width=480,height = 480)

# Creating the plot
plot (datasubset$DateTime,datasubset$Sub_metering_1,col ="black",type="l",xlab = "",ylab = "Energy sub meeting")
points(datasubset$DateTime,datasubset$Sub_metering_2,col="red",typ="l")      
points(datasubset$DateTime,datasubset$Sub_metering_3,col="blue",typ="l")
legend("topright", legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()

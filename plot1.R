
##Using data from the dates 2007-02-01 and 2007-02-02. 
##Using the strptime() and as.Date() functions.

x<- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
x$date_time <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
y <- x[as.Date(x$date_time) %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

##Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png("plot1.png", width=480, height=480, bg="white")

hist(y$Global_active_power, col="red",
                           main="Global Active Power",
                           xlab="Global Active Power (kilowatts)")




dev.off()
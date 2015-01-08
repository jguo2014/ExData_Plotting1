##Using data from the dates 2007-02-01 and 2007-02-02. 
##Using the strptime() and as.Date() functions.

x<- read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
x$datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
y<- x[as.Date(x$datetime) %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

##Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png("plot4.png", width=480, height=480, bg="white")

par(mfrow=c(2, 2))
with(y, {
        ### Subplot 1 (top left)
        plot(datetime, Global_active_power, type="l", xlab="",
             ylab="Global Active Power")
        ### Subplot 2 (top right)
        plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        ### Subplot 3 (bottom left)
        # Set up the canvas
        plot(datetime, Sub_metering_1, type="n", xlab="",
             ylab="Energy sub metering")
        lines(datetime, Sub_metering_1, col="black")
        lines(datetime, Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue")
        legend("topright",
               legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), ## Names of items in legend
               col=c("black","red","blue"), ## Set colors explicitly
               lty="solid" ## Draw solid lines next to each entry
        )
        ### Subplot 4 (bottom right)
        plot(datetime, Global_reactive_power, type="l") 
}) # end of with() block



dev.off()
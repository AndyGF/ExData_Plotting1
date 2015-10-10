plot4<- function(){
     
     full_data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")
     ## reads in dataset
     
     full_data$datetime <- paste(full_data$Date, full_data$Time)
     full_data$Time <- strptime(full_data$datetime, "%d/%m/%Y %H:%M:%S")
     ## combines date and time, and uses this combination to change the time to the correct format
     
     full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")
     ## changes the Date to correct format
     
     full_data$datetime <- NULL
     ## removes the dummy datetime data
     
     used_data <- full_data[full_data$Date=="2007-02-01"|full_data$Date=="2007-02-02",]
     ## chooses the data for the two days we are interested in
     
     png(filename="plot4.png")
     ## opens file device
     
     par(mfcol=c(2,2))
     ## sets layout of plots
     
     with(used_data, plot(Time,Global_active_power,xlab="", ylab = "Global Active Power",type="l"))
     ## plots first line plot
     
     with(used_data,plot(Time, Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering"))
     ## creates blank second plot
     
     points(used_data$Time,used_data$Sub_metering_1, type="l")
     points(used_data$Time,used_data$Sub_metering_2, type="l",col="red")
     points(used_data$Time,used_data$Sub_metering_3, type="l",col="blue")
     ## adds three lines
     
     legend("topright",legend=names(used_data)[7:9],lty = c(1,1,1),col = c("black","red","blue"),bty = "n")
     ##adds legend
     
     with(used_data, plot(Time,Voltage,xlab = "datetime",type="l"))
     ## adds third plot
     
     with(used_data,plot(Time,Global_reactive_power,xlab = "datetime",type="l"))
     ## adds final plot
     
     dev.off()
     ## closes file device
     
}
plot3<- function(){
     
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
     
     png(filename="plot3.png")
     ## opens file device
     
     plot(used_data$Time, used_data$Sub_metering_1, type="n",xlab="", ylab = "Energy sub metering")
     ## creates blank plot
     
     points(used_data$Time,used_data$Sub_metering_1, type="l") ## adds first line
     points(used_data$Time,used_data$Sub_metering_2, type="l",col="red") ## adds second line
     points(used_data$Time,used_data$Sub_metering_3, type="l",col="blue") ## adds third line
     
     legend("topright",legend=names(used_data)[7:9],lty = c(1,1,1),col = c("black","red","blue")) ## adds legend
     
     dev.off()
     ##closes file device
     
}
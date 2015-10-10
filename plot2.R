plot2<- function(){
     
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
     
     png(filename="plot2.png")
     ## opens file device
     
     with(used_data, plot(Time,Global_active_power,xlab="", ylab = "Global Active Power (kilowatts)",type="l"))
     ## plots the line chart
     
     dev.off()
     ##closes file device
}
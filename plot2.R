my_data <- as.data.frame(read.table("household_power_consumption.txt",header = TRUE , sep = ";",stringsAsFactors = FALSE))

my_data$Date       <- as.Date(my_data$Date , format = "%d/%m/%Y")
my_data$Date_Time  <- paste0(my_data$Date," ",my_data$Time)
my_data$Date_Time  <- as.POSIXct(strptime(my_data$Date_Time,format = "%Y-%m-%d %H:%M:%S"))

my_data[,3:8] <- as.data.frame(sapply(my_data[,3:8],as.numeric))
my_data       <- subset(my_data,Date <= "2007-02-02" & Date >= "2007-02-01")

plot(my_data$Date_Time,my_data$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "Date Time",type = "l")
dev.copy(png,file = "plot2.png",width=480,height=480)
dev.off()

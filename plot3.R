my_data <- as.data.frame(read.table("household_power_consumption.txt",header = TRUE , sep = ";",stringsAsFactors = FALSE))

my_data$Date       <- as.Date(my_data$Date , format = "%d/%m/%Y")
my_data$Date_Time  <- paste0(my_data$Date," ",my_data$Time)
my_data$Date_Time  <- as.POSIXct(strptime(my_data$Date_Time,format = "%Y-%m-%d %H:%M:%S"))

my_data[,3:8] <- as.data.frame(sapply(my_data[,3:8],as.numeric))
my_data       <- subset(my_data,Date <= "2007-02-02" & Date >= "2007-02-01")

plot(my_data$Date_Time,my_data$Sub_metering_1 ,type = "n" , xlab = "Date Time",ylab = "Energy Sub Metering")
lines(my_data$Date_Time,my_data$Sub_metering_1,col = "black")
lines(my_data$Date_Time,my_data$Sub_metering_2,col = "red")
lines(my_data$Date_Time,my_data$Sub_metering_3,col = "blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file = "plot3.png",width=400,height=350)
dev.off()

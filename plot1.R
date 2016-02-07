my_data <- as.data.frame(read.table("household_power_consumption.txt",header = TRUE , sep = ";",stringsAsFactors = FALSE))

my_data$Date       <- as.Date(my_data$Date , format = "%d/%m/%Y")
my_data$Date_Time  <- paste0(my_data$Date," ",my_data$Time)
my_data$Date_Time  <- as.POSIXct(strptime(my_data$Date_Time,format = "%Y-%m-%d %H:%M:%S"))

my_data[,3:8] <- as.data.frame(sapply(my_data[,3:8],as.numeric))
my_data       <- subset(my_data,Date <= "2007-02-02" & Date >= "2007-02-01")

with(my_data,hist(Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)"))
dev.copy(png,file = "plot1.png",width=400,height=350)
dev.off()

dataFile <- "~/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
voltage <- as.numeric(subSetData$Voltage)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
submeter1 <- as.numeric(subSetData$Sub_metering_1)
submeter2 <- as.numeric(subSetData$Sub_metering_2)
submeter3 <- as.numeric(subSetData$Sub_metering_3)


par(mfrow=c(2,2))
plot(datetime,globalActivePower,type = "l" ,xlab = "",ylab = "Global Active Power")
plot(datetime,voltage,type = "l" ,xlab = "datetime",ylab = "Voltage")

plot(datetime,submeter1,type = "l" ,xlab = "",ylab = "Energy Sub Metering")
lines(datetime,submeter2,type = "l",col = "red")
lines(datetime,submeter3,type = "l",col = "blue")
legend("topright",c("Submetering 1","Submetering 2","Submetering 3"), lty=1, lwd=2.5,col = c("black","red","blue"))




plot(datetime,globalReactivePower,type = "l" ,xlab = "datetime",ylab = "Global_Reactive_Power",ylim = c(0,0.5))
png("plot4.png", width=480, height=480)

dev.off()


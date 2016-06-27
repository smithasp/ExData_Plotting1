
# Requirement - The 'household_power_consumption.txt' file should be available in the working directory. 

plot3 <- function(){
  
  columns <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  power <- read.table(file="household_power_consumption.txt",sep=";",na.strings="?",nrows=2880,stringsAsFactors=F,col.names = columns, skip=66637)
  
  power <- transform(power, Datetime= as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))
  
  par(mfrow = c(2,2))  # row wise plotting
  
  png(file="plot4.png",width = 480, height=480)
  
  # plot-1
  plot(power$Datetime,power$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
  
  # plot-2
  plot(power$Datetime,power$Voltage, type="l",xlab="datetime",ylab="Voltage")
  
  # plot-3
  plot(power$Datetime,power$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  
  points(power$Datetime,power$Sub_metering_2,type="l",col="red")
  
  points(power$Datetime,power$Sub_metering_3,type="l",col="blue")
  
  legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.4)
  
  # plot-4
  plot(power$Datetime,power$Global_reactive_power, type="l",xlab="datetime",ylab="Global Reactive Power")
  
  dev.off()
  
  
  
  
  
}
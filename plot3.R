
# Requirement - The 'household_power_consumption.txt' file should be available in the working directory. 

plot3 <- function(){
  
  columns <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  power <- read.table(file="household_power_consumption.txt",sep=";",na.strings="?",nrows=2880,stringsAsFactors=F,col.names = columns, skip=66637)
  
  power <- transform(power, Datetime= as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))
  
  png(file="plot3.png",width = 480, height=480)
  
  plot(power$Datetime,power$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  
  points(power$Datetime,power$Sub_metering_2,type="l",col="red")
  
  points(power$Datetime,power$Sub_metering_3,type="l",col="blue")
  
  legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
  
  dev.off()
  
  
}
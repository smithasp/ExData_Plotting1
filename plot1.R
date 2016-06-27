
# Requirement - The 'household_power_consumption.txt' file should be available in the working directory. 
plot1 <- function(){
  columns <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  power <- read.table(file="household_power_consumption.txt",sep=";",na.strings="?",nrows=2880,stringsAsFactors=FALSE,col.names = columns, skip=66637)
 
  png(file="plot1.png",width = 480, height=480)
  with(power,hist(Global_active_power,xlab= "Global Active Power (kilowatts)",col="red",ylim=c(0,1200),main = "Global Active Power"))
  
  dev.off()
}
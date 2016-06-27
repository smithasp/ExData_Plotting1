# Requirement - The 'household_power_consumption.txt' file should be available in the working directory. 

plot2 <- function(){
columns <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power <- read.table(file="household_power_consumption.txt",sep=";",na.strings="?",nrows=2880,stringsAsFactors=F,col.names = columns, skip=66637)

power <- transform(power, Datetime= as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

png(file="plot2.png",width = 480, height=480)

plot(power$Datetime,power$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

dev.off()

}
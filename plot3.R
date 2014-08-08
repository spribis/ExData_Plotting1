## Download file manually from
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## and save in working directory as Coursera/household_power_consumption.txt

## Read the data
ass1 <- read.csv2("Coursera/household_power_consumption.txt", colClasses="character")
ass1$Date <- as.Date(ass1$Date,"%d/%m/%Y")
ass1a <- ass1[ass1$Date=="2007-02-01" | ass1$Date=="2007-02-02", ]
ass1c <- within(ass1a, { 
        date.time=as.POSIXct(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
        })

## Generate the plot
png(file="Coursera/plot3.png", width=480, height=480)
par(mfcol=c(1,1))
with(ass1c, plot(date.time, as.numeric(Sub_metering_1), main="", xlab="", 
                 ylab="Energy sub metering", type="n"))
with(ass1c, lines(date.time, as.numeric(Sub_metering_1), col="black"))
with(ass1c, lines(date.time, as.numeric(Sub_metering_2), col="red"))
with(ass1c, lines(date.time, as.numeric(Sub_metering_3), col="blue"))
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()
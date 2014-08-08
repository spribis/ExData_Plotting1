## Download file manually from
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## and save in working directory as Coursera/household_power_consumption.txt

## Read the data
ass1 <- read.csv2("Coursera/household_power_consumption.txt", colClasses="character")
ass1$Date <- as.Date(ass1$Date,"%d/%m/%Y")
ass1a <- ass1[ass1$Date=="2007-02-01" | ass1$Date=="2007-02-02", ]

## Generate the plot
png(file="Coursera/plot1.png", width=480, height=480)
par(mfcol=c(1,1))
hist(as.numeric(ass1a$Global_active_power), xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")
dev.off()
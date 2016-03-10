exp <-
    read.table("household_power_consumption.txt", header = TRUE, sep = ";",
               na.strings = "?")
exp <-
    exp[(as.character(exp$Date) == "1/2/2007") |
        (as.character(exp$Date) == "2/2/2007"),  ]

exp$DT <-
    strptime(paste(as.character(exp$Date), as.character(exp$Time)),
             "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow=c(2,2), mar=c(4,5,3,3))

plot(exp$DT, exp$Global_active_power, ylab = "Global Active Power", xlab="", type="l")

plot(exp$DT, exp$Voltage, ylab = "Voltage", xlab="datetime", type="l")

plot(exp$DT, exp$Sub_metering_3, type="n", col="blue", xlab = "",
     ylab = "Energy submetering", ylim = c(0,40))
lines(exp$DT, exp$Sub_metering_1, col = "black", type="l")
lines(exp$DT, exp$Sub_metering_2, col = "red", type="l")
lines(exp$DT, exp$Sub_metering_3, col = "blue", type="l")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1, box.lty = 0)

plot(exp$DT, exp$Global_reactive_power, ylab = "Voltage", xlab="datetime", type="l")

dev.off()
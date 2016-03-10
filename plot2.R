exp <-
    read.table("household_power_consumption.txt", header = TRUE, sep = ";",
               na.strings = "?")
exp <-
    exp[(as.character(exp$Date) == "1/2/2007") |
        (as.character(exp$Date) == "2/2/2007"),  ]

exp$DT <-
    strptime(paste(as.character(exp$Date), as.character(exp$Time)),
             "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(exp$DT, exp$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="l")

dev.off()
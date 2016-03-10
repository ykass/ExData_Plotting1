exp <-
    read.table("household_power_consumption.txt", header = TRUE, sep = ";",
               na.strings = "?")
exp <-
    exp[(as.character(exp$Date) == "1/2/2007") |
        (as.character(exp$Date) == "2/2/2007"),  ]

png("plot1.png")

hist(exp$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
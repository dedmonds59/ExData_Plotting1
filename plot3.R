#plot 3
png("plot3.png", width = 480, height =480)
with(e, {
  plot(Sub_metering_1~dateTime, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime, col="red")
  lines(Sub_metering_3~dateTime, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
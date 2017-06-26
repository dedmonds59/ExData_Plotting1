#plot 2
png("plot2.png", width =480, height = 480)
with(e,{
  plot(Global_active_power~t$dateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")})
dev.off()
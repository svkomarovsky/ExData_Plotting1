create_plot3 = function(){
  # Load data
  source('load_hpc_data.R')
  
  #Read data
  df <- read_data()
  
  with(df,plot(Timestamp, Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))
  
  # Open png device
  png(filename="plot3.png",width = 480, height = 480)
  
  # Make plot
  with(df,{
    plot(Timestamp, Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
    lines(x=Timestamp, y=Sub_metering_2, col="red")
    lines(x=Timestamp, y=Sub_metering_3, col="blue")
    legend(x="topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red","blue"))
  })
  
  # Turn off device
  dev.off()
}
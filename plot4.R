create_plot4 = function(){
  # Load data
  source('load_hpc_data.R')
  
  #Read data
  df <- read_data()
  
  with(df,plot(Timestamp, Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))
  
  # Open png device
  png(filename="plot4.png",width = 480, height = 480)
  
  # Create matrix to fit 4 graphs 
  par(mfrow=c(2,2))
 
  
  with(df, {
    
    #1st graph
    plot(Timestamp, Global_active_power, type="l",xlab="", ylab="Global Active Power")
    
    #2nd graph
    plot(Timestamp, Voltage, type="l", ylim=c(234, 246), xlab="datetime", ylab="Voltage")
    
    # 3rd graph
    plot(Timestamp, Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
    lines(x=Timestamp, y=Sub_metering_2, col="red")
    lines(x=Timestamp, y=Sub_metering_3, col="blue")
    legend(x="topright", 
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lty=c(1,1), 
           lwd=c(2.5,2.5), 
           col=c("black","red","blue"), 
           bty="n"
    )
    
    #4th graph
    plot(Timestamp, Global_reactive_power, type="l",xlab="datetime")
    
  })
  
  # Turn off device
  dev.off()
}
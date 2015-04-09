create_plot2 = function(){
  # Load data
  source('load_hpc_data.R')
  
  #Read data
  df <- read_data()
  
  with(df,plot(Timestamp, Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))
  
  # Open png device
  png(filename="plot2.png",width = 480, height = 480)
  
  # Make plot
  with(df,plot(Timestamp, Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)"))
  
  # Turn off device
  dev.off()
}
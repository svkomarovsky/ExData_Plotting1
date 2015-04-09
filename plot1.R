create_plot1 = function(){
  # Load data
  source('load_hpc_data.R')
  #Read data
  df <- read_data()
  # Open png device
  png(filename="plot1.png",width = 480, height = 480)
  
  # Make plot
  with(df,hist(Global_active_power,  col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)"))
  
  
  # Turn off device
  dev.off()
}
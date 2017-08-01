pollutionmean <- function(directory,pollutant,id=1:32)
{
  ## directory to fetch the files 
  setwd(file.path(getwd(),directory))
  observations = 0
  total = 0
  
 
  
  ## csv file names 
  for (i in id)
  {
    i
    ## concatenate the filename with leading zeros and adding the .csv file to the format
    filename = paste(formatC(width=3,i,flag="0"),".csv",sep="")
  
    ## read the csv file 
    data = read.csv(filename,header = TRUE,na.strings = c("NA","NaN", " "))
    
    ## remove all the NA data from the 
    data = na.omit(data)
    
    ## Find the total number of observations in the table 
    observations = observations + nrow(data)
    
    ## Calculate the mean of the sulphate / nitrate
    if (pollutant == "sulfate") 
      {total = total + sum(data$sulfate)}
    
    else {total = total + sum(data$nitrate)}
  }
  
  setwd("~/Documents/WDtest")
  
  return(total/observations)
  
}
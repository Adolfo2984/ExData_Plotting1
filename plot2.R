plot2.R<-function(){
        
        ## Set Working Directory
        setwd("C:/Users/amora/OneDrive/Documents/R_Projects/Coursera/EDA/Project")
        
        ## Reading Table
        householdpower<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,blank.lines.skip = TRUE)
        
        ## Joining Date and Time                                                                        
        householdpower$DateTime<-as.POSIXct(paste(householdpower$Date,householdpower$Time),format="%d/%m/%Y %H:%M:%S")
        
        ## Turning Date into a Date format
        householdpower$Date<-as.Date(householdpower$Date,format="%d/%m/%Y")
        
        ## New Data frame only with 2007-02-01 and 2007-02-02
        householdpower_02<-householdpower[householdpower$Date=="2007-02-01" | householdpower$Date=="2007-02-02",]
        
        ## Change to Numeric
        householdpower_02$Global_active_power<-as.numeric(householdpower_02$Global_active_power)
        
        ## Make Histogram
        dev.copy(png,file="plot2.png",width=480,height=480)
        plot(x=householdpower_02$DateTime,
             y=householdpower_02$Global_active_power,
             type="l",
             ylab="Global Active Power (kilowatts)",
             xlab="")
        dev.off()
        
        
        
        
}
plot3.R<-function(){
        
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
        
        ## Make Chart
        dev.copy(png,file="plot3.png",width=480,height=480)
        plot(x=householdpower_02$DateTime,householdpower_02$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
        lines(x=householdpower_02$DateTime,householdpower_02$Sub_metering_2,type="l",col="red")
        lines(x=householdpower_02$DateTime,householdpower_02$Sub_metering_3,type="l",col="blue")
        legend("topright",lwd=1,lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        dev.off()
}
if(file.exists("./household_power_consumption.txt")){
        file <-"household_power_consumption.txt"
        library("sqldf", lib.loc="/usr/lib64/R/library")
        hpc<-read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep=";")
        png("plot3.png")
        hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
        with(hpc,{
                plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy and metering", col="antiquewhite4")
                lines(DateTime, Sub_metering_2, col="red")
                lines(DateTime, Sub_metering_3, col="blue")
                legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("antiquewhite4","red","blue"),lty=c(1,1,1),cex=0.7)
         }
        )
        dev.off()
        closeAllConnections()
}else{
        print("Input file is not there!!!")
}

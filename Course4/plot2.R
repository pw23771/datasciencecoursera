if(file.exists("./household_power_consumption.txt")){
        file <-"household_power_consumption.txt"
        library("sqldf", lib.loc="/usr/lib64/R/library")
        hpc<-read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep=";")
        png("plot2.png")
        hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
        plot(hpc$DateTime, hpc$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        dev.off()
        closeAllConnections()
}else{
                print("Input file is not there!!!")
        }
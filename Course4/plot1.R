if(file.exists("./household_power_consumption.txt")){
        file <-"household_power_consumption.txt"
        library("sqldf", lib.loc="/usr/lib64/R/library")
        hpc<-read.csv.sql("household_power_consumption.txt",sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep=";")
        png("plot1.png")
        hist(hpc$Global_active_power,breaks=24,freq=TRUE,main="Global Active Power",col="red",xlim=c(0,6),xlab="Global Active Power (kilowatts)",xaxp=c(0,6,3))
        dev.off()
        closeAllConnections()
}else{
        print("Input file is not there!!!")
}
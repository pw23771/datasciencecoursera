
if(file.exists("./UCI HAR Dataset")){
        library(plyr)
        datadirname<-"./UCI HAR Dataset"
        testdirname<-"./UCI HAR Dataset/test"
        traindirname <- "./UCI HAR Dataset/train"
        
        features <-read.table(paste(datadirname,"/features.txt",sep=""),header=F,sep="")
        activity_label <-read.table(paste(datadirname,"/activity_labels.txt",sep=""),header=F,sep="")
        train_x <-read.table(paste(traindirname,"/X_train.txt",sep=""),header=F,sep="")
        train_y <-read.table(paste(traindirname,"/y_train.txt",sep=""),header=F,sep="")
        train_y <-subset(join(train_y,activity_label,by="V1"), select=V2)
        train_subject <- read.table(paste(traindirname,"/subject_train.txt",sep=""),header=F,sep="")
        train_all <- cbind(train_x,train_y,train_subject)
        test_x <-read.table(paste(testdirname,"/X_test.txt",sep=""),header=F,sep="")
        test_y <-read.table(paste(testdirname,"/y_test.txt",sep=""),header=F,sep="")
        test_y <-subset(join(test_y,activity_label,by="V1"), select=V2)
        test_subject <- read.table(paste(testdirname,"/subject_test.txt",sep=""),header=F,sep="")
        test_all <- cbind(test_x,test_y,test_subject)
        rm(test_x, test_y, test_subject, train_x, train_y,train_subject)
        ## Merges the training and the test sets
        all <- rbind(train_all,test_all) 
        rm(train_all,test_all)
        ##Labels the data set with descriptive variable names
        names(all) <- c(as.vector(features$V2),"activity","subject") 
        meanstd<-subset(features, grepl("mean\\(\\)|std\\(\\)",V2))
        ## Extracts only the measurements on columns with mean or std or subject or dactivity
        all_meanstd<-all[,c(as.vector(meanstd$V1),562,563)]
        ## The tidy data set with the average of each variable for each activity and each subject.
        all_tidy<-ddply(all_meanstd,.(subject,activity),colwise(mean))
        write.table(all_tidy,file="Tidy_dataset.txt",row.names=FALSE)
}else{
        print("Input data are not there!!!")
}


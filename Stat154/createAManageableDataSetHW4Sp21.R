

myData<-read.csv("bf4024f5c75fc062.csv", header = T)
names(myData)
# [1] "PERMNO"  "date"    "TICKER"  "COMNAM"  "BIDLO"   "ASKHI"   "PRC"     "VOL"     "OPENPRC"
# [10] "NUMTRD" 
myReducedData<-myData[,c(2,3,7)]
names(myReducedData)
#[1] "date"   "TICKER" "PRC" 

test<-unstack(myReducedData,PRC~TICKER)
length(test)
#530

test.matrix<-matrix(test)

myMatrix<-matrix(test[[1]],nrow=1342)
vecNames<-names(test[1])
for(k in 2:530){
  if (length(test[[k]])==1342){
    myMatrix<-cbind(myMatrix,test[[k]])
    vecNames<-cbind(vecNames,names(test[k]))
  }
}

#myMatrix is 1342*449
#each column contains the value of the stock price of the corresponding stock
#name of stock is in vecNames





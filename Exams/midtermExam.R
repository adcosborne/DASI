## DASI Midterm Exam

## Michael Hunt

## October 2015

## Part One

# Q1

pnorm(-0.6,lower.tail=FALSE)
pnorm(-0.6,lower.tail=TRUE)
pnorm(1.96,lower.tail=FALSE)
pnorm(1.96,lower.tail=TRUE)

# Q 7 - 12

calcium=c(-5,-4,-3,-2,1,7,10,11,17,18)
placebo<-c(-11,-5,-3,-3,-1,-1,-1,2,3,5,12)
median(calcium)
median(placebo)

ic<-as.integer(runif(1,1,10))
ip<-as.integer(runif(1,1,11))


all<-c(-5,-4,-3,-2,1,7,10,11,17,18,-11,-5,-3,-3,-1,-1,-1,2,3,5,12)

ntrial<-100
meddiff<- vector(mode="numeric", length=ntrial)

for (i in 1 : ntrial){
    cind<-sample(length(all),10)
    cind<-sort(cind)
    csamp<-all[cind]
    psamp<-all[-cind]
    
    meddiff[i]<-median(csamp)-median(psamp)
    
}

stripchart(meddiff,method="stack",at=0,pch=16,col="blue")

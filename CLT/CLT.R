
# read in wind speed map of Cornwall taken from the UK NOABL wind speed atlas.
# wind speeds are given for 10 m, 25m and 45 m heights with 1 km2 resolution

callywith2010<-read.csv("callywith2010.csv",stringsAsFactors=FALSE)
hist(callywith2010$v20)
windSpeeds<-read.csv("windspeeds.csv",stringsAsFactors=FALSE)

boxplot(callywith2010$v46)

summary(callywith2010)
hist(windSpeeds$ws10)
hist(windSpeeds$ws25)
hist(windSpeeds$ws45)



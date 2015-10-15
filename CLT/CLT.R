
# read in wind speed map of Cornwall taken from the UK NOABL wind speed atlas.
# wind speeds are given for 10 m, 25m and 45 m heights with 1 km2 resolution
windSpeeds<-read.csv("windspeeds.csv",stringsAsFactors=FALSE)
hist(windSpeeds$ws10)
hist(windSpeeds$ws25)
hist(windSpeeds$ws45)

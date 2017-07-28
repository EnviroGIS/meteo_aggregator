#### Preload ####

rm(list = ls()) # Reset R`s brain

setwd("<location of your dataset>") # set your working directory

weather <- read.csv('weather_1.csv', sep = ',') # load raw dataframe from source .csv

weather[,1] <- as.Date(weather[,1], format = "%d.%m.%Y %M:%S") # set appropriate date format

colnames(weather) [1] <- 'date' # change name for "Date" variable

weather$RRR <- as.numeric(weather$RRR)

#### Daily aggregarion ####

Temp <- aggregate(T ~ date, weather, mean) # air temperature

Po <- aggregate(Po ~ date, weather, mean) # station pressure

U <- aggregate(U ~ date, weather, mean) # air humidity

Ff <- aggregate(Ff ~ date, weather, mean) # speed of wind

# beware NA in Tn, Tx and RRR below!

Tn <- aggregate(Tn ~ date, weather, mean, na.action = na.pass, na.rm = T) # minimal air temperature

Tx <- aggregate(Tx ~ date, weather, mean, na.action = na.pass, na.rm = T) # maximum air temperature

Td <- aggregate(Td ~ date, weather, mean) # dew-point temperature

RRR <- aggregate(RRR ~ date, weather, sum, na.action = na.pass, na.rm = T) # precipitation

sss <- aggregate(sss ~ date, weather, mean, na.action = na.pass, na.rm = T) # snow cover depth

sss$sss[is.nan(sss$sss)] <- NA # Change NaN to NA

## Merge and name variables

day_weath <- cbind(Temp, Po$Po, U$U, Ff$Ff, Td$Td, RRR$RRR, sss$sss)

colnames(day_weath) <- c("date","Temp","Po","U","Ff","Td","RRR","sss")

# write.csv(day_weath, "day_weath.csv") # export as .csv (optionally)

rm(df,Ff,Po,RRR,sss,Td,Temp,U,Tn,Tx,specimens,weather) # remove unusual objects


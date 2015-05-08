#Creates the required data set for the analysis
#whole data set is read in variable electrical, date1 and date2 corresponds to the dates of interest
#which is used to extract the indices of dates from whole data set to subset the dataset
electrical <- read.table('household_power_consumption.txt',header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE)
date1 <- which(electrical$Date == '2/1/2007')
date2 <- which(electrical$Date == '2/2/2007')
dates <- c(date1,date2)
sub_elec <- electrical[dates,]

#graphics device png is opened
png(filename='plot4.png') 

#panel is subdivided into 4 parts, filled by rows
par(mfrow=c(2,2))

#plot 1 between global active power and time
with(sub_elec, plot(as.POSIXlt(dt),Global_active_power, type='n', xlab =''))
with(sub_elec, lines(as.POSIXlt(dt),Global_active_power))

#plot 2 between voltage and date time
with(sub_elec, plot(as.POSIXlt(dt),Voltage, type='n', xlab ='datetime', ylab='Voltage'))
with(sub_elec, lines(as.POSIXlt(dt),Voltage))

#plot 3 between sub_metering and datetime
with(sub_elec, plot(as.POSIXlt(dt), Sub_metering_3, xlab='', ylab='Energy sub metering', ylim=c(0,40), type='n'))    
with(sub_elec, lines(as.POSIXlt(dt), Sub_metering_3, col='blue'))
with(sub_elec, lines(as.POSIXlt(dt), Sub_metering_2, col='red'))
with(sub_elec, lines(as.POSIXlt(dt), Sub_metering_1, col='black'))
legend('topright',col=c('black','red','blue'),lty = 1,legend = c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'))

#plot 4 between global reactive power and date time
with(sub_elec, plot(as.POSIXlt(dt),Global_reactive_power, type='n', xlab ='datetime', ylab='Global reactive power'))
with(sub_elec, lines(as.POSIXlt(dt),Global_reactive_power))

dev.off()
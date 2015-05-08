#Creates the required data set for the analysis
#whole data set is read in variable electrical, date1 and date2 corresponds to the dates of interest
#which is used to extract the indices of dates from whole data set to subset the dataset
electrical <- read.table('household_power_consumption.txt',header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE)
date1 <- which(electrical$Date == '2/1/2007')
date2 <- which(electrical$Date == '2/2/2007')
dates <- c(date1,date2)
sub_elec <- electrical[dates,]

#graphics device png is opened
png(filename='plot1.png')

hist(sub_elec$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power(kilowatts)', ylab='Frequency')

dev.off()
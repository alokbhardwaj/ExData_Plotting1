#Creates the required data set for the analysis
#whole data set is read in variable electrical, date1 and date2 corresponds to the dates of interest
#which is used to extract the indices of dates from whole data set to subset the dataset
electrical <- read.table('household_power_consumption.txt',header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE)
date1 <- which(electrical$Date == '2/1/2007')
date2 <- which(electrical$Date == '2/2/2007')
dates <- c(date1,date2)
sub_elec <- electrical[dates,]

#graphics device png is opened
png(filename='plot2.png') 

#first paste function is used to get Date and Time columns together
# strptime is used to convert the pasted Date and Time columns into standard format
#using plot function, first a blank graph is drawn
#then lines are drawn between the two variables
d <- paste(sub_elec$Date, sub_elec$Time)
dt <- strptime(d, "%m/%d/%Y %H:%M:%S")
with(sub_elec, plot(as.POSIXct(dt),Global_active_power, type='n', xlab ='',ylab='Global Active Power(kilowatts)' ))
with(sub_elec, lines(as.POSIXct(dt),Global_active_power))

dev.off()
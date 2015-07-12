###############################################################################################################################
# Loading the Data
# When loading the dataset into R, please consider the following:
# - The dataset has 2,075,259 rows and 9 columns. 
#   First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. 
# - We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#   One alternative is to read the data from just those dates rather than reading in the entire dataset 
#   and subsetting to those dates.
# - You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
# - Note that in this dataset missing values are coded as ?.
#
# #############################################################################################################################

# Step 1: Read in a snippet of data; check the data type; get ready for read.table fast reading

sub.tab<-read.csv2('./household_power_consumption.txt',dec='.',
               na.strings = "\\?", stringsAsFactors=F,
               skip=66637,header=F,nrows=2880)
names(sub.tab)=names(read.csv2('./household_power_consumption.txt',
                            header=T,nrows=1) )

# Step2: Combine col "Date" and "Time" and create a weekday col
temp<-names(sub.tab)
temp<-tolower(make.names(temp,unique=T,allow_=F))
names(sub.tab)<-temp
sub.tab$time=strptime(with(sub.tab,paste(date,time)),format='%d/%m/%Y %H:%M:%S')

#####################################################################################################################
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
# - First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1
# - For each plot you should
#   Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#   Name each of the plot files as plot1.png, plot2.png, etc.
#   Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, 
#   i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data 
#   so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
#   Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
#######################################################################################################################

# Plot2
png('plot2.png',width = 480, height = 480)
plot(sub.tab$time,sub.tab$global.active.power,type='l',
     xlab="",ylab="Global Active Power (kilowatts)" )
dev.off()


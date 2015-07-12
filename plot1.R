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

library("data.table")
tab5rows<-fread("./household_power_consumption.txt",nrows=5) 
classes<-sapply(tab5rows,class)
tab<-fread("./household_power_consumption.txt",colClasses=classes,na.strings=c("NA","?",""))
object.size(tab)
head(tab)

# Step 2: Subset the data from dates 2007-02-01 to 2007-02-02
library("lubridate")
library("dplyr")
sub.tab<-filter(tab,Date=="2/2/2007" | Date=="1/2/2007")

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

#Plot 1
png(file="plot1.png")
library(ggplot2)
colnames(sub.tab)
plot1<-qplot(as.numeric(Global_active_power),data=sub.tab,geom="histogram",xlim=c(0,6),binwidth=0.5,fill=I("red"),col=I("black"), main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
plot1 + theme(legend.position="none")+theme_bw() + theme(panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))
dev.off()
#################################################################################################################
#Note:
#1.variable in histogram must be numeric, not character
#2.manually set the aesthetics using I(), e.g., colour = I("red") or size = I(2).
#3.theme(legend.position="none") removes all legends
#4.theme_bw() sets background white
#5.theme(panel.border = element_blank()) removes border lines
#6.theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank()) removes grid
#7.theme(axis.line = element_line(colour = "black")) adds axis lines
#8.to explot the plot in png: 1) png(file="plot1.png") create an empty png file in dir,launch the png device
#                             2) library..plot1+theme()...   call a plotting function to make a plot
#                             3) dev.off()    explicitely close the device
##################################################################################################################



#Q1: Print name with prefix "Plotting Basics:"
print("Plotting Basics: Devi Somalinga Bhuvanesh") #to print the text with prefix


#Q2: Import libraries including: 
#plyr, FSA, FSAdata, magrittr, dplyr, plotrix, ggplot2, and moments
install.packages("plyr")  #to install new package 
library(plyr)             #to import the new package in the library

install.packages("FSA")
library(FSA)

install.packages("FSAdata")
library(FSAdata)

install.packages("magrittr")
library(magrittr)

install.packages("dplyr")
library(dplyr)

install.packages("plotrix")
library(plotrix)

install.packages("ggplot2")
library(ggplot2)

install.packages("moments")
library(moments)

#Q3: Load the BullTroutRML2 dataset
dataset <- read.csv('/Users/devi/Documents/Devi/MPS Analytics/Introduction to Analytics/Module 2/BullTroutRML2.csv', header=TRUE, sep=",") #to read the file from the directory
dataset  #to view the loaded dataset for verification

#Q4: Print the first and last 3 records from the dataset
#Method1 - The row number does not get changed
dataset               #to view the dataset       
head(dataset,n=3)     #to view first n records of dataset
tail(dataset,n=3)     #to view last n records of dataset
headtail(dataset,n=3) #to view first and last n records of dataset

#Method2 - The row number is continuous
dataset                 #to view the dataset
new1<-dataset[1:3, ]    #assigning the range of 1st three records of dataset to new1
new1                    #check output of new1
new2<-dataset[94:96, ]  #assigning the range of last three records of dataset to new2
new2                    #check output of new2
combine(new1,new2)      #combine new1 and new2 

#Q5:Filter out all records except those from Harrison Lake
harrisondata<-dataset[dataset$lake == "Harrison",] #From the dataset, extracting "Harrison" data from lake column
harrisondata           #to view the extracted data in the assigned variable

#Q6 Display the first and last 3 records from the filtered dataset
headtail(harrisondata,n=3)   #filter out first n and last n data's from harrisondata

#Q7 Display the structure of the filtered dataset
str(harrisondata)  #to view the structure of Harrison dataset - class, variables, observations, values

#Q8 Display the summary of the filtered dataset and save it as <t>
t<-summary(harrisondata)  #assigning summary of Harrison dataset to t - Min, Max, Mean, Median, 1st and 3rd Quartile, Length, Class
t

#Q9 Create a scatterplot for “age” and “fl”
harrisondata     #to view harrisondata 
plot(harrisondata$fl,harrisondata$age, 
     main="Plot 1: Harrison Lake Trout", 
     ylab="Age (yrs)", xlab="Fork Length (mm)", 
     xlim=c(0,500), ylim=c(0,15),
     pch=20)  

#plotted fl in X axis and Age in Y axis from harrisondata, 
#use main to provide title, 
#use xlab and ylab too provide labels
#use xlim and ylim to set x and y axis limits 
#pch=20 is the value to set the shape of plotted points - small filled circle


#Q10 Plot an “Age” histogram with the following specifications
harrisondata        #to view harrisondata 
hist(harrisondata$age,
     main = "Plot 2: Harrison Fish Age Distribution",
     col.main="cadetblue",col="cadetblue", 
     ylab="Frequency", xlab="Age(yrs)")

#an histogram of age data from harrisondata is plotted
#main is used to provide title for the graph
#col.main is used to assign color to the title
#col is used to assign color to the histogram 
#xlab and ylab is used to provide labels 

#Q11 Create an overdense plot
harrisondata   #to view harrisondata
twoshade <- c("pink", "yellow")  #two colors are chosen to plot in the graph
harrisondata$era <- as.factor(harrisondata$era)  #values in Era column are converted to factor to store the unique values which will help to associate with other variables
harrisondata$era
twoshade[harrisondata$era] #the two colors are assigned to the two unique values under Era column in harrison data
smoothScatter(harrisondata$fl,harrisondata$age, 
              main="Plot 3: Harrison Density Shaded by Era", 
              ylab="Age (yrs)", xlab="Fork Length (mm)", 
              xlim=c(0,500), ylim=c(0,15),
              pch=20, col=twoshade[harrisondata$era])

#smoothScatter is used to show the two-dimensional kernel density estimate
#plotted fl in X axis and Age in Y axis from harrisondata, 
#use main to provide title, 
#use xlab and ylab too provide labels
#use xlim and ylim to set x and y axis limits 
#pch=20 is the value to set the shape of plotted points - small filled circle
#col is used to assign two colors to the values in Era column in Harrison data


#Q12 New object “tmp” that includes the first 3 and last 3 records of the whole data set.
dataset        #to view whole dataset
tmp <-headtail(dataset,n=3)  #extract first and last n records from dataset and assign to tmp
tmp #to view tmp output

#Q13 Display the “era” column in the new “tmp” object
#Method1 - prints the values in Era column in column format - 4th column in tmp
print(tmp[4])

#Method2 - prints the values in Era column horizontally
print(tmp[ ,"era"]) 

#Method3 - prints the values in Era column horizontally
print(tmp$era)


#Q14 Create a pchs vector with the argument values for + and x. 
#Then create a cols vector with the two elements “red” and “gray60”
pchs <- c(3,4)    #pch argument for + and X is represented by 3 and 4 which is assigned to pchs
pchs              #to view output of pchs
cols <- c("red","gray60")  #to assign two colors to cols
cols            #to view assigned values in cols


#Q15 Convert the tmp object values to numeric values. 
#Then create a numeric numEra object from the tmp$era object
tmp <-headtail(dataset,n=3)      #to extract first and last n data from dataset
tmp                              #to view the extracted data which is assigned in tmp
is.numeric(tmp$age)              #to check whether the values in age column in tmp is numeric
is.numeric(tmp$fl)               #to check whether the values in fl column in tmp is numeric             
tmp$lake <- as.factor(tmp$lake)  #to convert lake from character to factor to create levels for unique data
tmp$lake                         #to view the levels in lake column
tmp$lake <- as.numeric(tmp$lake) #to assign numeric values to each level in the lake column
tmp$lake                         #to view the numeric values assigned in lake column
is.numeric(tmp$lake)             #to check whether the values in lake is numeric
tmp$era <- as.factor(tmp$era)    #to convert era values from date to factor to create levels for unique data
tmp$era                          #to view the levels in era column
tmp$era <- as.numeric(tmp$era)   #to assign numeric values to each level in the era column
tmp$era                          #to view the numeric values assigned in era column
is.numeric(tmp$era)              #to assign numeric values to each level in the era column


#Q16 Associate the cols vector with the tmp era values

#To assign cols with tmp era values
cols <- c("red","gray60")        #to assign two colors to cols
cols                             #to view assigned values in cols
tmp$era <- as.factor(tmp$era)    #to convert era values from date to factor to create levels for unique data
tmp$era                          #to view the levels/unique data in era column
cols[tmp$era]                    #to assign cols value to each level under era column

#Similarly, to ossign pchs symbols to tmp era values
pchs <- c(3,4)                   #pch argument for + and X is represented by 3 and 4 which is assigned to pchs
pchs                             #to view output of pchs
pchs[tmp$era]                    #to assign pchs symbol to each level under era column


#Q17 Create a plot of “Age (yrs)” (y variable) versus “Fork Length (mm)” (x variable) 
harrisondata                     #to view harrisondata
harrisondata$era <- as.factor(harrisondata$era)    #to convert the values in Era from Date to Factor to create unique levels
harrisondata$era                 #to view the output of Era column in Harrisondata as factors
cols[harrisondata$era]           #assigning the colours to the unique values in Era column of Harrison data
plot(harrisondata$fl,harrisondata$age, 
     main="Plot 4: Symbol & Color by Era", 
     ylab="Age (yrs)", xlab="Fork Length (mm)", 
     xlim=c(0,500), ylim=c(0,15),
     pch=pchs[harrisondata$era],col=cols[harrisondata$era])

#Plotting the graph of fl (x-axis) and Age (y-axis) from harrisondata
#Providing the title using main function
#Labels foor x and y axis are assigned using xlab and ylab
#X and Y axis limits are set through xlim and ylim
#Unique values under Era column are linked with the pch symbols and colors 



#Q18 Plot a regression line of the previous plot with a dashed line with width 2 and color “cadetblue”
harrisondata                    #to view harrisondata
plot(harrisondata$fl,harrisondata$age, 
     main="Plot 4: Symbol & Color by Era", 
     ylab="Age (yrs)", xlab="Fork Length (mm)", 
     xlim=c(0,500), ylim=c(0,15),
     pch=pchs[harrisondata$era],col=cols[harrisondata$era])
par(lty=2, lwd=2, col="cadetblue") #to set the parameters lty= Type of line, lwd= Width of line, col=Colour
agevsfl <- data.frame(harrisondata$age, harrisondata$fl)  #creating data frame to plot age with fl of harrison data
agevsfl                                                   #to view the dataframe of age and fl of harrison data
abline(lm(harrisondata$age~harrisondata$fl,data=agevsfl)) #to create a regression linear model for age and fl
lm(harrisondata$age~harrisondata$fl,data=agevsfl) #to know the slope and y-intercept


#Q19 Place a legend of levels by era with pchs symbols in the top left of the plot
# Inset of 0.05
# No box around the legend
# Font size: 75% of nominal

harrisondata                     #to view harrisondata
harrisondata$era <- as.factor(harrisondata$era)    #to convert the values in Era from Date to Factor to create unique levels
harrisondata$era                 #to view the output of Era column in Harrisondata as factors
cols[harrisondata$era]           #assigning the colours to the unique values in Era column of Harrison data
plot(harrisondata$fl,harrisondata$age, 
     main="Plot 4: Symbol & Color by Era", 
     ylab="Age (yrs)", xlab="Fork Length (mm)", 
     xlim=c(0,500), ylim=c(0,15),
     pch=pchs[harrisondata$era],col=cols[harrisondata$era])
par(lty=2, lwd=2, col="cadetblue") 
agevsfl <- data.frame(harrisondata$age, harrisondata$fl) 
agevsfl                                                  
abline(lm(harrisondata$age~harrisondata$fl,data=agevsfl)) 
lm(harrisondata$age~harrisondata$fl,data=agevsfl) 
legend("topleft", inset=.05, title="Type of Era", c("1977-80","1997-01"),
       pch=pchs, col=c("red", "gray60"), cex = 0.75, bty="n")

#To include legend - placement of the legent, inset- space to be given from borders,
#title of legend
#c is values in the legend
#pch is the symbols used in the plot
#col is the colors used in the plot
#cex is the font size
#bty is the type of box and n is no box


#Key Findings

#1. Descriptive analysis

#1.1 Descriptive analysis of entire dataset of BullTroutRML2
dataset <- read.csv('/Users/devi/Documents/Devi/MPS Analytics/Introduction to Analytics/Module 2/BullTroutRML2.csv', header=TRUE, sep=",") #to read the file from the directory
dataset  #to view the loaded dataset for verification
summary(dataset)  #to check summary of dataset which includes Min, Max, Mean, Median, 1st and 3rd Quartile
str(dataset)      #to check structure of dataset
var(dataset$age)  #Variance of age in dataset
sd(dataset$age)   #Standard Deviation of age in dataset
var(dataset$fl)   #Variance of fl in dataset
sd(dataset$fl)    #Standard Deviation of fl in dataset
skewness(dataset$age)  #Skewness of age in dataset
skewness(dataset$fl)   #Skewness of fl in dataset
kurtosis(dataset$age)  #Kurtosis of age in dataset
kurtosis(dataset$fl)   #Kurtosis of fl in dataset

#1.2 Descriptive analysis of only Harrison Lake Data
harrisondata<-dataset[dataset$lake == "Harrison",] #Extracting only Harrison Lake data from Dataset
harrisondata      #To view Harrison lake data
summary(harrisondata) 
str(harrisondata)
var(harrisondata$age)
sd(harrisondata$age)
var(harrisondata$fl)
sd(harrisondata$fl)
skewness(harrisondata$age,na.rm = FALSE)
skewness(harrisondata$fl,na.rm = FALSE)
kurtosis(harrisondata$age,na.rm = FALSE)
kurtosis(harrisondata$fl,na.rm = FALSE)

#1.3 Descriptive analysis of only Osprey Lake Data
ospreydata<-dataset[dataset$lake == "Osprey",]  #Extracting only Osprey lake data from Dataset
ospreydata      #To view Osprey Lake data
summary(ospreydata)
str(ospreydata)
var(ospreydata$age)
sd(ospreydata$age)
var(ospreydata$fl)
sd(ospreydata$fl)
skewness(ospreydata$age,na.rm = FALSE)
skewness(ospreydata$fl,na.rm = FALSE)
kurtosis(ospreydata$age,na.rm = FALSE)
kurtosis(ospreydata$fl,na.rm = FALSE)



#2 Visualization 

#Visualization 1 - Bar Plot - Harrison lake vs Osprey lake
plot(factor(dataset$lake), col = c("lightblue","gray"), ylim=c(0,80), ylab="Number of BullTrout Fish", main="BullTrout Fish Distrubution based on Lake", col.main="darkblue")

#Out of 96 fishes, 61 are in Harrison Lake and 35 in Osprey lake. 


#Visualization 2 - Histogram - Fish Age Distribution
# 2.1 Harrison Lake 
harrisondata
hist(harrisondata$age,main = "Harrison Fish Age Distribution",col.main="darkblue",col="lightblue", ylab="Frequency", xlab="Age(yrs)", ylim=c(0,14),xlim=c(0,14))

#2.2 Osprey Lake
ospreydata
hist(ospreydata$age,main = "Osprey Fish Age Distribution",col.main="darkblue",col="gray", ylab="Frequency", xlab="Age(yrs)", ylim=c(0,14),xlim=c(0,14))


#Visualization 3- Scatterplot - Age Versus Fork Length of Fish
#3.1 Harrison Lake
harrisondata
plot(harrisondata$fl,harrisondata$age, main="Impact of Age on Fork Length of Harrison Lake Fish", col.main="darkblue", ylab="Age (yrs)", xlab="Fork Length (mm)", xlim=c(0,700), ylim=c(0,15),pch=20, col="lightblue")

#3.2 Osprey Lake
ospreydata
plot(ospreydata$fl,ospreydata$age, main="Impact of Age on Fork Length of Osprey Lake Fish", col.main="darkblue", ylab="Age (yrs)", xlab="Fork Length (mm)", xlim=c(0,700), ylim=c(0,15),pch=20, col="gray")

#Visualization 4- Boxplot 
#.4.1 - Comparison of Fork Length of fishes in both the lakes
boxplot(harrisondata$fl,ospreydata$fl, main="Fork Length(mm) of Harrison vs Osprey Lake Fish", col = c("lightblue","gray"), col.main="darkblue", names=c("Harrison","Osprey"))

#4.2 Comparison of Age of fishes in both the lakes
boxplot(harrisondata$age,ospreydata$age, main="Age (yrs) of Harrison vs Osprey Lake Fish", col = c("lightblue","gray"), col.main="darkblue", names=c("Harrison","Osprey"))


#Visualization 5 - Density Plot 
#5.1 Density for Fork Length(mm) of Harrison Lake Fish
plot(density(harrisondata$fl),xlim=c(0,800), main="Density for Fork Length of Harrison Lake Fish")
polygon(density(harrisondata$fl), col="lightblue", border="black")
abline(v=mean(harrisondata$fl),col="red", lwd = 3)
abline(v=median(harrisondata$fl),col="blue", lwd=2)


#5.2 Density for Fork Length(mm) of Osprey Lake Fish
plot(density(ospreydata$fl),xlim=c(0,800), main="Density for Fork Length of Osprey Lake Fish")
polygon(density(ospreydata$fl), col="gray", border="black")
abline(v=mean(ospreydata$fl),col="red", lwd=3)
abline(v=median(ospreydata$fl),col="blue", lwd=2)


#5.3 Density for Age(yrs) of Harrison Lake Fish
plot(density(harrisondata$age),xlim=c(0,20), main="Density for Age(yrs) of Harrison Lake Fish")
polygon(density(harrisondata$age), col="lightblue", border="black")
abline(v=mean(harrisondata$age),col="red", lwd = 3)
abline(v=median(harrisondata$age),col="blue", lwd=2)


#5.4 Density for Age(yrs) of Osprey Lake Fish
plot(density(ospreydata$age),xlim=c(0,20), main="Density for Age(yrs) of Osprey Lake Fish")
polygon(density(ospreydata$age), col="gray", border="black")
abline(v=mean(ospreydata$age),col="red", lwd=3)
abline(v=median(ospreydata$age),col="blue", lwd=2)


#Visualization 6 - Period
#6.1 Harrison Data by Period
harrisondata                     
harrisondata$era <- as.factor(harrisondata$era)    
harrisondata$era                  
cols[harrisondata$era]          
plot(harrisondata$fl,harrisondata$age, 
     main="Harrison Lake: Symbol & Color by Era", col.main="darkblue",
     ylab="Age (yrs)", xlab="Fork Length (mm)", 
     xlim=c(0,700), ylim=c(0,15),
     pch=pchs[harrisondata$era],col=cols[harrisondata$era])
par(lty=2, lwd=2, col="black") 
agevsfl <- data.frame(harrisondata$age, harrisondata$fl) 
agevsfl                                                  
abline(lm(harrisondata$age~harrisondata$fl,data=agevsfl)) 
lm(harrisondata$age~harrisondata$fl,data=agevsfl) 
legend("topleft", inset=.05, title="Type of Era", c("1977-80","1997-01"),
       pch=pchs, col=c("red", "gray60"), cex = 0.75, bty="n")


#6.2 Osprey Data by Period
ospreydata
ospreydata$era <- as.factor(ospreydata$era)    
ospreydata$era                 
cols[ospreydata$era]           
plot(ospreydata$fl,ospreydata$age, 
     main="Osprey Lake: Symbol & Color by Era", col.main="darkblue",
     ylab="Age (yrs)", xlab="Fork Length (mm)", 
     xlim=c(0,700), ylim=c(0,15),
     pch=pchs[ospreydata$era],col=cols[ospreydata$era])
par(lty=2, lwd=2, col="black") 
agevsfl <- data.frame(ospreydata$age, ospreydata$fl) 
agevsfl                                                  
abline(lm(ospreydata$age~ospreydata$fl,data=agevsfl)) 
lm(ospreydata$age~ospreydata$fl,data=agevsfl) 
legend("topleft", inset=.05, title="Type of Era", c("1977-80","1997-01"),
       pch=pchs, col=c("red", "gray60"), cex = 0.75, bty="n")



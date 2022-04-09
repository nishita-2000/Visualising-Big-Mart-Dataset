getwd()
setwd("C:/Users/Parag/Desktop/R")
##### plot function : ggplot2 #####

#install.packages("ggplot2")
# Library Call (for use)
library("ggplot2")

################### Data Visualization techniques ################

# data_mart=read.csv("C:/Users/Parag/Desktop/R/Big_Mart_Dataset.csv")
data_mart = read.csv("C:/Users/Parag/Desktop/R/Big_Mart_Dataset.csv")
print(data_mart) # Read and Print BigMart dataset

library(ggplot2) # Scatter Plot of Item_Visibility & Item_MRP 
print(ggplot(data_mart, aes(Item_Visibility, Item_MRP)) + geom_point() +
        scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+
        scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ theme_bw())


# Now, we can view a third variable also in same chart, say a categorical variable (Item_Type) which will give the characteristic (item_type)
# of each data set. Different categories are depicted by way of different color for
# item_type in below chart. Another scatter plot using function ggplot() with geom_point().


print(ggplot(data_mart, aes(Item_Visibility, Item_MRP)) + 
        geom_point(aes(color = Item_Type)) + scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05)) + 
        scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ theme_bw() + 
        labs(title="Scatterplot"))

# We can even make it more visually clear by creating separate
# scatter plots for each separate Item_Type as shown below.
# Another scatter plot using function ggplot() with geom_point().

print(ggplot(data_mart, aes(Item_Visibility, Item_MRP)) + 
        geom_point(aes(color = Item_Type)) + 
        scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05)) + 
        scale_y_continuous("Item MRP", breaks = seq(0,270, by = 30))+ 
        theme_bw() + labs(title="Scatterplot") + facet_wrap( ~ Item_Type))

########## Histogram Plot ########################

# For Big_Mart_Dataset, if we want to know the count of items on basis of their
# cost, then we can plot histogram using continuous variable Item_MRP as shown below.
# Histogram plot using function ggplot() with geom_ histogram()

print(ggplot(data_mart, aes(Item_MRP)) + geom_histogram(binwidth = 2)+
        scale_x_continuous("Item MRP", breaks = seq(0,270,by = 30))+
        scale_y_continuous("Count", breaks = seq(0,200,by = 20))+ labs(title = "Histogram"))


##############  Bar Chart Plot ###############################

# For Big_Mart_Dataset, if we want to know item weights (continuous variable)
# on basis of Outlet Type (categorical variable) on single bar chart as shown below.
# Vertical Bar plot using function ggplot()

print(ggplot(data_mart, aes(Item_Type, Item_Weight)) + geom_bar(stat = "identity", fill =
                                                                  "darkblue") + scale_x_discrete("Outlet Type")+ 
        scale_y_continuous("Item Weight", breaks = seq(0,15000, by = 500))+ 
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) + 
        labs(title = "Bar Chart"))

##################  Stack Bar Chart #########################

# For Big_Mart_Dataset, if we want to know the count of outlets on basis of
# categorical variables like its type (Outlet Type) and location (Outlet Location
# Type) both, stack chart will visualize the scenario in most useful manner.
# Stack Bar Chart using function ggplot()

print(ggplot(data_mart, aes(Outlet_Location_Type, fill = Outlet_Type)) +
        geom_bar()+labs(title = "Stacked Bar Chart", x = "Outlet Location Type", y =
                          "Count of Outlets"))

############ Box Plot  ##########################################

# For Big_Mart_Dataset, if we want to identify each outlet's detailed item sales
# including minimum, maximum & median numbers, box plot can be helpful. In
# addition, it also gives values of outlier of item sales for each outlet as shown
# in below chart.

print(ggplot(data_mart, aes(Outlet_Identifier, Item_Outlet_Sales)) + 
        geom_boxplot(fill = "red")+ 
        scale_y_continuous("Item Outlet Sales", breaks= seq(0,15000, by=500))+
        labs(title = "Box Plot", x = "Outlet Identifier"))

### To save these charts, click on Export - Save as ... ###

##################### Area Chart ####################################

# For Big_Mart_Data set, when we want to analyze the trend of item outlet sales,
# area chart can be plotted as shown below. It shows count of outlets on basis of sales.

print(ggplot(data_mart, aes(Item_Outlet_Sales)) + 
        geom_area(stat = "bin", bins = 30, fill = "steelblue") + 
        scale_x_continuous(breaks = seq(0,11000,1000))+ 
        labs(title = "Area Chart", x = "Item Outlet Sales", y = "Count"))

# Area chart shows continuity of Item Outlet Sales.


######################  Heat Map: ############################################

# For Big_Mart_Dataset, if we want to know cost of each item on every outlet,
# we can plot heatmap as shown below using three variables Item MRP, Outlet
# Identifier & Item Type from our mart dataset

print(ggplot(data_mart, aes(Outlet_Identifier, Item_Type))+ 
        geom_raster(aes(fill = Item_MRP))+ 
        labs(title ="Heat Map", x = "Outlet Identifier", y = "Item Type")+
        scale_fill_continuous(name = "Item MRP"))

# The dark portion indicates Item MRP is close 50. The brighter portion indicates
# Item MRP is close to 250.

##################### Correlogram  ##########################

# For Big_Mart_Dataset, check co-relation between Item cost, weight, visibility
# along with Outlet establishment year and Outlet sales from below plot.
# install.packages("corrgram")

install.packages("corrgram")
library(corrgram)
print(corrgram(data_mart, order=NULL, panel=panel.shade, text.panel=panel.txt,
               main="Correlogram"))

# Darker the color, higher the co-relation between variables. Positive co-
# relations are displayed in blue and negative correlations in red color. Color
# intensity is proportional to the co-relation value.

# We can see that Item cost & Outlet sales are positively correlated while Item
# weight & its visibility are negatively correlated.


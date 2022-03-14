setwd("C:/Users/German/Desktop/Thesis/End Products")

library(raster)
library(rgdal)
library(caret)
library(snow)
library(tidyverse)
library(wvtool)
library(randomForest)
library(calecopal)
library(ggplot2)
library(ggsn)
library(ggspatial)

nov17 <- drop_na(as.data.frame(raster("Nov_class_2017.envi"), xy=TRUE))
jan18 <- drop_na(as.data.frame(raster("jan_18_clipped"), xy=TRUE))
nov18 <- drop_na(as.data.frame(raster("nov_18"), xy=TRUE))
nov20 <- drop_na(as.data.frame(raster("Nov_class_2020.envi"), xy=TRUE))

nov18 <- filter(nov18, nov_18_category != "Unclassified")
jan18 <- filter(jan18, jan_18_clipped_category != "Unclassified")

nov17 <-rename(nov17, "Landcover" = "Nov_class_2017_category")
jan18 <-rename(jan18, "Landcover" = "jan_18_clipped_category")
nov18 <-rename(nov18, "Landcover" = "nov_18_category")
nov20 <-rename(nov20, "Landcover" = "Nov_class_2020_category")
  

PreM <- ggplot()+
  geom_raster(data= nov17, aes(x=x, y=y, fill=Landcover))+
  labs(title="Pre: November 2017",y="",x="")+
  scale_fill_manual(values= rev(cal_palette("bigsur2", n=5, type = "continuous")))+
  coord_quickmap()+
  annotation_scale()
PreM 

DurM <- ggplot()+
  geom_raster(data= jan18, aes(x=x, y=y, fill=Landcover))+
  labs(title="During: January 2018",y="",x="")+
  scale_fill_manual(values= rev(cal_palette("bigsur2", n=5, type = "continuous")))+
  coord_quickmap()+
  annotation_scale()
DurM

RecM1 <- ggplot()+
  geom_raster(data= nov18, aes(x=x, y=y, fill=Landcover))+
  labs(title="Post: November 2018",y="",x="")+
  scale_fill_manual(values= rev(cal_palette("bigsur2", n=5, type = "continuous")))+
  coord_quickmap()+
  annotation_scale()
RecM1

RecM2 <- ggplot()+
  geom_raster(data= nov20, aes(x=x, y=y, fill=Landcover))+
  labs(title="Post: November 2020",y="",x="")+
  scale_fill_manual(values= rev(cal_palette("bigsur2", n=5, type = "continuous")))+
  coord_quickmap()+
  annotation_scale()
RecM2

gridExtra::grid.arrange(PreM, DurM, RecM1, RecM2, nrow=2)

#par(mfrow=c(2,2))
#plot(raster("Nov_class_2017.envi"), col= rev(cal_palette("bigsur2", n=5, type = "continuous")), main= "Pre: November 2017")
#plot(raster("jan_18.tif"), col= rev(cal_palette("bigsur2", n=5, type = "continuous")), main= "During: January 2018")
#plot(raster("nov_18_clipped.tif"), col= rev(cal_palette("bigsur2", n=5, type = "continuous")), main= "Post: November 2018")
#plot(raster("Nov_class_2020.envi"), col= rev(cal_palette("bigsur2", n=5, type = "continuous")), main= "Post: November 2020")


#legend("center",legend=c("Bare Soil", "High Marsh", "Mid Marsh", "Senesced Veg", "Subtidal/Water"), fill =rev(cal_palette("bigsur2", n=5, type = "continuous")))


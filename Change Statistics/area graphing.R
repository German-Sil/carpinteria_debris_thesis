setwd("//tsclient/D/UCSB/Masters_Thesis/Figures and Tables/Change Statistics")

library(tidyverse)
library(ggplot2)
library(gridExtra)
library(cowplot)
library(calecopal)


colors <- c(rev(cal_palette("bigsur2", n=5, type = "continuous")))
area <- read.csv("Area.csv")

area$Date<-factor(area$Date,levels=unique(area$Date)[order(area$ID,decreasing=F)])

graph <- ggplot(area, aes(fill=Landcover, y=Area, x=Date)) +
  geom_bar(position="dodge", stat="identity")+
  labs(title="Landcover Area",y="Area (ha)",x="Date")+
  scale_fill_manual(values = colors)

graph + theme(plot.title = element_text(size=20, face="bold", hjust=.5),axis.text.x=element_text(size=9,face="italic"))

area_diff <- read.csv("Area Difference.csv")

area_diff$Date<-factor(area_diff$Date,levels=unique(area_diff$Date)[order(area_diff$ID,decreasing=F)])

graph <- ggplot(area_diff, aes(fill=Landcover, y=Area_Difference, x=Date)) +
  geom_bar(position="dodge", stat="identity")+
  labs(title="Landcover Difference to Pre-flow Conditions",y="Area Difference (ha)",x="Date")+
  scale_fill_manual(values = colors)

graph + theme(plot.title = element_text(size=20, face="bold", hjust=.5),axis.text.x=element_text(size=9,face="italic"))


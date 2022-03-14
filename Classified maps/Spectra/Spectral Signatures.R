setwd("C:/Users/German/Desktop/Thesis/End Products/Spectra")

library(tidyverse)
library(ggplot2)
library(gridExtra)
library(cowplot)
library(calecopal)

Gv <- read.csv("GV.csv")
NPV <- read.csv("NPV.csv")
Soil <- read.csv("Soil.csv")
Subtidal <- read.csv("Subtidal.csv")


GV_graph <- ggplot(Gv, aes(x=Wavelength))+
  geom_line(aes(y=GV_1), color= "blue", size=1)+
  geom_line(aes(y=GV_2), color= "red", size=1)+
  geom_line(aes(y=GV_3), color= "green", size=1)+
  geom_line(aes(y=GV_4), color= "black", size=1)+
  labs(title="Green Vegetation Spectra",x="Wavelength",y="Refelectance", color= "Legend")+
  scale_color_manual(values = c("blue","red", "green", "black"))+
  theme(plot.title = element_text(size=15, face="bold", hjust=.5),axis.text.x=element_text(size=9,face="italic"))
  
GV_graph


NPV_graph <- ggplot(NPV, aes(x=Wavelength))+
  geom_line(aes(y=NPV_1), color= "blue", size=1)+
  geom_line(aes(y=NPV_2), color= "red", size=1)+
  geom_line(aes(y=NPV_3), color= "green", size=1)+
  geom_line(aes(y=NPV_4), color= "black", size=1)+
  labs(title="Non-Photosynthetic Vegetation Spectra",x="Wavelength",y="Refelectance", color= "Legend")+
  scale_color_manual(values = c("blue","red", "green", "black"))+
  theme(plot.title = element_text(size=15, face="bold", hjust=.5),axis.text.x=element_text(size=9,face="italic"))

NPV_graph


Soil_graph <- ggplot(Soil, aes(x=Wavelength))+
  geom_line(aes(y=Soil_1), color= "blue", size=1)+
  geom_line(aes(y=Soil_2), color= "red", size=1)+
  geom_line(aes(y=Soil_3), color= "green", size=1)+
  geom_line(aes(y=Soil_4), color= "black", size=1)+
  labs(title="Bare Soil Spectra",x="Wavelength",y="Refelectance", color= "Legend")+
  scale_color_manual(values = c("blue","red", "green", "black"))+
  theme(plot.title = element_text(size=15, face="bold", hjust=.5),axis.text.x=element_text(size=9,face="italic"))

Soil_graph

Subtidal_graph <- ggplot(Subtidal, aes(x=Wavelength))+
  geom_line(aes(y=Subtidal_1), color= "blue", size=1)+
  geom_line(aes(y=Subtidal_2), color= "red", size=1)+
  geom_line(aes(y=Subtidal_3), color= "green", size=1)+
  geom_line(aes(y=Subtidal_4), color= "black", size=1)+
  geom_line(aes(y=Subtidal_5), color= "aquamarine", size=1)+
  geom_line(aes(y=Subtidal_6), color= "lightsalmon", size=1)+
  geom_line(aes(y=Subtidal_7), color= "brown", size=1)+
  geom_line(aes(y=Subtidal_8), color= "yellow", size=1)+
  labs(title="Subtidal Spectra",x="Wavelength",y="Refelectance", color= "Legend")+
  scale_color_manual(values = c("blue","red", "green", "black", "aquamarine", "lightsalmon", "brown", "yellow"))+
  theme(plot.title = element_text(size=15, face="bold", hjust=.5),axis.text.x=element_text(size=9,face="italic"))


Subtidal_graph

gridExtra::grid.arrange(GV_graph, NPV_graph, Soil_graph, Subtidal_graph, nrow=2)

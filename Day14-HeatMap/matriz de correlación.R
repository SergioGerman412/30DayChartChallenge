
library(ggplot2)

library(corrplot)


#1. Importar el dataset 
dataset <- read.csv("https://raw.githubusercontent.com/SergioGerman412/Datasets/main/USA_Housing.csv", header = TRUE)

#Matriz de correlación
dataset <- subset(dataset, select = -c(Address))
matriz_correlacion <- cor(dataset)
par(mar = c(1, 1, 1, 1))
corrplot(matriz_correlacion, method = "color", type = "full", tl.col = "black", tl.srt = 45, addCoef.col = "black")
title(main = "Matriz de correlación de variables ")

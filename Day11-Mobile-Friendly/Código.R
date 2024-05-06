library(dplyr)
library(ggplot2)

url2 <- "https://raw.githubusercontent.com/SergioGerman412/30DayChartChallenge/main/Day11-Mobile-Friendly/Mobile%20phone%20price.csv"
datos3 <- read.csv(url2,sep = ",")
datos3 <- unique(datos3)
datos3$Price.... <-  as.integer(gsub("[\\$|,]", "", datos3$Price....)) 


# Filtrar solo las filas con precios válidos
datos3 <- datos3[!is.na(datos3$Price....), ]

precio_maximo_por_marca <- datos3 %>%
  group_by(Brand) %>%
  summarise(Max_Price = max(Price....), .groups = "drop")


grafica_dia11 <- ggplot(precio_maximo_por_marca, aes(x = reorder(Brand, Max_Price), y = Max_Price, fill = Brand)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_text(aes(label = paste("$", Max_Price)),  # Agregar "$" al precio
            position = position_stack(vjust = 0.5), 
            size = 3, 
            color = "black", 
            hjust = 0.4) +
  labs(x = "Marca", y = "Precio más alto", title = "Producto más alto en dólar por Marca móvil en el 2023") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_flip() 

# Cambiar el color de las barras utilizando una paleta de colores
grafica_dia11 <- grafica_dia11 + scale_fill_viridis_d()
print(grafica_dia11)
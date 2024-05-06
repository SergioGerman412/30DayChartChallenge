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


colores <- c( "#f68e26" ,"#74c476", "#ffd430", "#f9f9f9", "#4ec7ff", "#9582c1ee" , "#948072", "#cccccc", "#cccccc", "#cccccc", "#569ed3", "#9582c1ee", "#ee665b", "#569ed6", "#948072", "#74c476", "#ee665b")

# Graficar utilizando los colores personalizados
grafica_dia12 <- ggplot(precio_maximo_por_marca, aes(x = reorder(Brand, Max_Price), y = Max_Price, fill = Brand)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste("$", Max_Price)),  # Agregar "$" al precio
            position = position_stack(vjust = 0.5), 
            size = 3, 
            color = "black", 
            hjust = 0.4) +
  labs(x = "Marca", y = "Precio más alto", title = "Producto más alto de teléfonos móviles en dólar por Marca - Año 2023") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_flip() +
  scale_fill_manual(values = colores)  # Asignar los colores personalizados

# Imprimir la gráfica
print(grafica_dia12)

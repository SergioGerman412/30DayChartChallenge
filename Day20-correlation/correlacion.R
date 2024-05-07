library(readxl)
library(ggplot2)

url <- "https://github.com/SergioGerman412/30DayChartChallenge/raw/main/Day20-correlation/datos.xlsx"
data_sim <- read.xlsx(url)

# Calcular la correlación entre las ventas y el gasto en publicidad
correlacion <- cor(data_sim$ventas, data_sim$publicidad)


ggplot(data_sim, aes(x = year)) +
  geom_line(aes(y = ventas, color = "Ventas"), alpha = 0.8) +
  geom_line(aes(y = publicidad, color = "Publicidad")) +
  scale_color_manual(name = "Variable", 
                     values = c("Ventas" = "blue", "Publicidad" = "red")) +
  labs(x = "Año", y = "Valor", 
       title = paste("Correlación entre Ventas y Gasto en Publicidad\n",
                     "La correlación es:", round(correlacion, 2))) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )
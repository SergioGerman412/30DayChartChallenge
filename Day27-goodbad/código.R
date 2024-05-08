# Cargar paquetes necesarios
library(ggplot2)


url <- "https://raw.githubusercontent.com/SergioGerman412/30DayChartChallenge/main/Day27-goodbad/datos_excel.csv"
datos <- read.csv(url,sep = ",")

# Graficar la distribución de las experiencias
ggplot(datos, aes(x = Experiencia, fill = Calificacion)) +
  geom_histogram(binwidth = 1, alpha = 0.8) +
  labs(x = "Experiencia del Cliente", y = "Frecuencia", 
       title = "Distribución de la Experiencia del Cliente") +
  scale_fill_manual(values = c("Buena" = "green", "Mala" = "red")) +
  theme_minimal()

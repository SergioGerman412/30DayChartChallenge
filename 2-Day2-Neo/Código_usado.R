library(readr)
library(ggplot2)
library(treemapify)

url <- "https://raw.githubusercontent.com/SergioGerman412/30DayChartChallenge/main/Day2-Neo/fallecidos_covid.csv"
datos <- read.csv(url,sep = ";")
datos <- datos[!duplicated(datos$UUID), ]


conteo_departamentos <- table(datos$DEPARTAMENTO)
top_10 <- head(sort(conteo_departamentos, decreasing = TRUE), 10)
df_top_10 <- data.frame(DEPARTAMENTO = names(top_10), count = as.numeric(top_10))
df_top_10 <- df_top_10[order(df_top_10$count, decreasing = TRUE), ]
my_colors <- c("#FFB6C1", "#FF595E", "#FF595E", "#FFE5B4", "#8AC926", "#FFB6C1", "#6A4C93", "#8AC926", "#1982C4", "#6A4C93")
options(repr.plot.width=13, repr.plot.height=8)

# Gráfico de Treemap Futurista
ggplot(df_top_10, aes(area = count, fill = DEPARTAMENTO, label = paste(DEPARTAMENTO, "\n", count))) +
  geom_treemap() +
  geom_treemap_text(fontface = "bold", colour = "white", place = "centre", grow = T) +
  scale_fill_manual(values = my_colors) +
  theme(
    plot.title = element_text(color = "white", size = 13), 
    plot.subtitle = element_text(color = "white", size = 9), 
    plot.background = element_rect(fill = "#666666"),  
    panel.grid.major = element_blank(), 
    legend.position = "right",  
    legend.title = element_text(color = "#000000", size = 10),  
    legend.text = element_text(color = "#000000", size = 9),  
    axis.text.x = element_blank(),  
    axis.text.y = element_blank(), 
    axis.title.y = element_blank()  
  ) +
  labs(
    title = "Top 10 Departamentos con mayor fallecidos por Covid-19 en Perú",
    subtitle = "Datos del 2020-3 al 2024-3. Fuente: Minsa",
    fill = "Departamento"
  )

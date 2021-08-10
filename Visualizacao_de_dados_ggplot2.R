
# Bibliotecas -------------------------------------------------------------

#install.packages("ggplot2")
library(ggplot2)

# Conhecendo a estrutura do ggplot2 ---------------------------------------

# Tudo começa pela estrutura basica

data(iris)

ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point()

# aes: define a estetica do grafico

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length)) # tambem pode ser definido no geom

# # compreendendo um pouco mais sobre a estetica do gráfico # #

# cor dos pontos: colour

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, colour = "red"))

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, colour = Species))

# formato dos pontos: shape

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length), shape = 5)

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, shape = Species))

# misturando cores e formato de pontos

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, shape = Species, 
                 colour = Species))

# preenchendo com cores: fill

# os formatos dos pontos vao de 0 a 25
# podemos usar o fill entre 21 e 25

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, fill = Species), 
             shape = 25)

# brincando com o preenchimento e contorno

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, fill = Species), 
             shape = 22, colour = "purple")

# tamanho dos pontos: size

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, fill = Species), 
             shape = 21, size = 5)

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, fill = Species), 
             shape = 21, size = 2.5)

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, fill = Species,
                 size = Petal.Length),shape = 21)

# transparencia: alpha

ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Petal.Length, fill = Species), 
             shape = 21, size = 5, alpha = .5)


# Conhecendo outros geoms -------------------------------------------------

# X e Y continuos

# Ja vimos o geom_point() acima

data("Orange")

# geom_point()

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference))

# geom_smooth()

ggplot(data = Orange) +
  geom_smooth(aes(x = age, y = circumference))

# geom_point e geom_smooth

ggplot(data = Orange, aes(x = age, y = circumference)) +
  geom_point() +
  geom_smooth()

ggplot(data = Orange, aes(x = age, y = circumference)) +
  geom_point() +
  geom_smooth(method = "lm") # reta da regressao

ggplot(data = Orange, aes(x = age, y = circumference)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) # retirando intervalo de confianca

# geom_jitter()

ggplot(data = Orange) +
  geom_jitter(aes(x = age, y = circumference))

# geom_point() com estilo jitter

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference), position = "jitter")

# geom_rug()

ggplot(data = Orange) +
  geom_rug(aes(x = age, y = circumference)) +
  geom_point(aes(x = age, y = circumference))

# geom_quantile() --> regressao quantil

ggplot(data = Orange) +
  geom_quantile(aes(x = age, y = circumference))

ggplot(data = Orange) +
  geom_jitter(aes(x = age, y = circumference)) +
  geom_quantile(aes(x = age, y = circumference))

ggplot(data = Orange, aes(x = age, y = circumference)) +
  geom_jitter() +
  geom_quantile(quantiles = c(0.2,0.5,0.7))

# editando linhas

# tipo de linha: linetype
# tipos de linhas: "blank", "solid", "dashed", "dotted", "dotdash", "longdash", and "twodash"

ggplot(data = Orange, aes(x = age, y = circumference)) +
  geom_jitter() +
  geom_quantile(quantiles = c(0.2,0.5,0.7), 
                linetype = "dashed", colour = "red")

# X discreto e Y continuo

data("iris")

# grafico de caixas: geom_boxplot()

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot()

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(aes(fill = Species))

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(fill = "lightblue", colour = "blue")

# grafico violino

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin()

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin() +
  geom_jitter()

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin(aes(colour = Species))

# grafico de colunas: geom_col()

data("mpg")

ggplot(mpg, aes(class, hwy)) +
  geom_col()

ggplot(mpg, aes(class, hwy)) +
  geom_col(width = .5) # mudando a largura da barra

# brincando com as barras

ggplot(mpg, aes(class, hwy)) +
  geom_col(aes(fill = trans)) #stack

ggplot(mpg, aes(class, hwy)) +
  geom_col(aes(fill = trans), position = "dodge")

ggplot(mpg, aes(class, hwy)) +
  geom_col(aes(fill = trans), position = "fill")

# grafico de barras: geom_bar()

ggplot(mpg, aes(class, hwy)) +
  geom_bar(stat = "identity")

# X e Y discretos

data("diamonds")

ggplot(diamonds, aes(cut, color)) +
  geom_count()

# graficos de funcao continua

data("economics")

# grafico de area

ggplot(economics, aes(date, unemploy)) +
  geom_area()

ggplot(economics, aes(date, unemploy)) +
  geom_area(fill = "pink")

# grafico de linha

ggplot(economics, aes(date, unemploy)) +
  geom_line()

ggplot(economics, aes(date, unemploy)) +
  geom_line(colour = "red", linetype = "solid")

# graficos com apenas uma variavel continua

# histograma

ggplot(mpg, aes(hwy)) +
  geom_histogram(bins = 30) # bins define o número de intervalos

# poligono de frequencia

ggplot(mpg, aes(hwy)) +
  geom_freqpoly(bins = 30) # bins define o número de intervalos


ggplot(mpg, aes(hwy)) +
  geom_histogram(bins = 30, fill = "yellow", colour = "black") +
  geom_freqpoly(bins = 30, linetype = "dashed", colour = "red")

# grafico de area

ggplot(mpg, aes(hwy)) +
  geom_area(stat = "bin", bins = 20)

# grafico de densidade

ggplot(mpg, aes(hwy)) +
  geom_density()

# grafico Q-Q

ggplot(mpg)+
  geom_qq(aes(sample = hwy))

# graficos com 3 variaveis

# grafico de contorno

data("seals")
seals$z <- with(seals, sqrt(delta_long^2 + delta_lat^2))

ggplot(seals, aes(long, lat)) +
  geom_contour(aes(z = z))

# raster

ggplot(seals, aes(long, lat)) +
  geom_raster(aes(fill = z))

ggplot(seals, aes(long, lat)) +
  geom_tile(aes(fill = z))

ggplot(seals, aes(long, lat)) +
  geom_raster(aes(fill = z)) +
  geom_contour(aes(z = z))


# Sistemas de Coordenadas

data("mpg")

ggplot(mpg, aes(class, hwy)) +
  geom_col()

ggplot(mpg, aes(class, hwy)) +
  geom_col() +
  coord_flip() # muda a orientação da sua figura

ggplot(mpg, aes(class, hwy, fill = class)) +
  geom_col() +
  coord_polar()

# Facets ------------------------------------------------------------------

ggplot(mpg, aes(cty, hwy)) +
  geom_point()

# dividindo em colunas

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_grid(cols = vars(fl))

# dividindo em linhas

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_grid(rows = vars(year))

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_grid(cols = vars(year))

# dividindo em colunas e linhas

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_grid(rows = vars(year), cols = vars(fl))

# deixando as divisoes em um formato retangular

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_wrap(vars(fl))

# mudando a escala dos eixos no facets

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_wrap(vars(fl), scales = "free") # teste tambem free_x e free_y

# dica: deixe o facet sempre para o final

# Temas -------------------------------------------------------------------

# Agora vamos brincar com os nossos graficos

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") 

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  theme_classic()

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  theme_bw()

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  theme_minimal()

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  theme_grey() # tema default do ggplot

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  theme_test()

#install.packages("ggthemes")
library(ggthemes)

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  theme_fivethirtyeight()

# Editando o grafico ------------------------------------------------------

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  theme_bw()

# mudando o titulo dos eixos

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  xlab("Idade") + # testar ylab()
  theme_bw() 

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  labs(x = "Idade da arvore", y = "Grossura") +
  theme_bw() 

# acrescentando titulo ao grafico

ggplot(data = Orange) +
  geom_point(aes(x = age, y = circumference),
             position = "jitter") +
  labs(x = "Idade da arvore", y = "Grossura") +
  ggtitle("Grafico qualquer") +
  theme_bw() 

# posicao da legenda

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(aes(fill = Species))

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(aes(fill = Species)) +
  theme(legend.position = "top") # testar bottom, right, left

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(aes(fill = Species)) +
  theme(legend.position = c(.1,.7))

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(aes(fill = Species)) +
  theme(legend.position = c(.1,.7),
        legend.title = element_text(colour = "red", face = "bold"))

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(aes(fill = Species)) +
  theme(legend.text = element_text(size = 14))


g <- ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(aes(fill = Species))

# opcoes para a area do grafico

g + theme(
  panel.grid.major = element_line(colour="red"),
  panel.grid.minor = element_line(colour="red", linetype="dashed", size=0.2),
  panel.background = element_rect(fill="lightblue"),
  panel.border = element_rect(colour="blue", fill=NA, size=2))

# opcoes para o texto

g + ggtitle("Plot title here") +
  theme(
    axis.title.x = element_text(colour="grey", size=14),
    axis.text.x = element_text(colour="yellow"),
    axis.title.y = element_text(colour="green", size=14, angle = 90),
    axis.text.y = element_text(colour="orange"),
    plot.title = element_text(colour="red", size=20, face="bold"))

# ouras opcoes para a legenda

g + theme(
  legend.background = element_rect(fill="grey85", colour="red", size=1),
  legend.title = element_text(colour="blue", face="bold", size=14),
  legend.text = element_text(colour="red"),
  legend.key = element_rect(colour="blue", size=0.25),
  legend.position="top")

# editando facets

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_grid(rows = vars(year), cols = vars(fl))

p <- ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  facet_grid(rows = vars(year), cols = vars(fl)) +
  theme(
    strip.background = element_rect(fill="pink"),
    strip.text.y = element_text(size=14, angle=-90, face="bold"))

p


# Salvando o seu grafico --------------------------------------------------

# apresento-lhes o ggsave

ggsave(filename = ,
       plot = ,
       units = ,
       dpi = )

ggsave(filename = ,
       plot = ,
       units = ,
       dpi = ,
       width = ,
       height = )

# Exercitando -------------------------------------------------------------

data("CO2")







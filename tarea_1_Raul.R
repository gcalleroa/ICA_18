rm(list=ls()) 

########################
# Tarea 1 - B??sicos  ### 
########################

# El punto de esta tarea es que practiquen todo lo que aprendienron en la primera clase
# Pero tambi??n que, usando la misma l??gica, investiguen como hacer 2 cosas que no les ense????
# porque el 70% de saber usar R es saber googolear ayuda
# Obviamente la tarea es optativa, pero les recomiendo hacerla, trabarse, volverse a trabar - 

# B??sicos #


# 1) Calcula en el script pero SIN guardar el resultado la multiplicaci??n de la suma de dos n??meros que t?? eligas
# osea  x * (y + z) y escribelo aqu??:  
10 * (5 + 2) 


# 2) Crea un objeto que se llame "numero_1" que contenga el producto de 5 * 10

numero_1 = 5 * 10
numero_1

# 3) Crea un vector num??rico de 5 n??meros consecutivos, empezando en 5 y acabando en 9 y llamale vector_1
vector_1 <- c(5:9)
vector_1

# 4) Multiplica todos los elementos de tu vector por "numero_1" y guardalo en un objeto que se llame "vector_2"
vector_2 <- vector_1 * numero_1
vector_2

# 5) Transforma el vetor num??rico vector_2 en un vector de caracter; asegurate de que funcion?? con str() 
#    Hint: para reemplazar, solo tienes que guardarlo usando el mismo nombre
vector_2
str(vector_2)
vector_2 = factor(vector_2, labels = c("uno", "dos", "tres", "cuatro", "cinco"))
vector_2
str(vector_2)

# 6) Crea dos objetos, uno que sea tu apellido y otro tu nombre y p??galos en un objeto usando paste() y llamalo "minombre"
#  luego dile a R que te llame por tu nombre (que en la consola aparezca tu nombre, pues)
mi_nombre = "Raul"
mi_apellido <- "Castellanos"
minombre = paste(mi_nombre, mi_apellido, sep=" ")
minombre

# 7) Transforma minombre en un factor
#  Hint: si existe la funcion as.data.frame ??C??mo se llamar?? la funcion para volver algo factor/numerico/caracter/matriz?
minombre<- as.factor(minombre)
minombre

# 8) Transforma minombre en un vector num??rico, ve que pasa usando str() e imprimiendo todos sus elementos
minombre<- as.numeric(minombre)
str(minombre)
minombre


# 9) limpia tu espacio de trabajo (borra todos los objetos)
rm

# 10) crea una matriz de 20 renglones y 3 columnas y llenalo con n??meros aleatorios
#     Hint: necesitas o 20 * 3 = 60 n??meros para llenarla completamente
matrizcool<- 1:60
matrizcuadro<- matrix(matrizcool, nrow=20, ncol=3)
matrizcuadro

# 11) Vuelve esa matriz una base de datos llamada base_de_datos
base_de_datos = as.data.frame(matrizcuadro)
str(base_de_datos)
base_de_datos


# 12) genera un vector de caracter de 3 elementos, llama el vector "nombres_futuros"
# y a los elementos "primer_variable" , "segunda_variable", "tercera_variable"
nombres_futuros <- c("primer_variable", "segunda_variable", "tercera_variable")
nombres_futuros

# 13) usando la funci??n names() ve como se llaman todas las variables de base_de_datos
names(base_de_datos)

# 14) sustituye en un solo comando todos los nombres de base_de_datos por "nombres_futuros"
colnames(base_de_datos)<- nombres_futuros
names(base_de_datos)

# 15) tira segunda_variable de tu base
base_de_datos$V2 = NULL
str(base_de_datos)
base_de_datos

# 16) crea una variable que se llame "variable_nueva" que sea una variable l??gica y siempre sea TRUE
base_de_datos$nueva_variable = c(T,T,T,T,T,T,T,T,T,T,T,T,T,T,T,T,T,T,T,T)

# 17) haz un summary de la base completa y luego uno solo de la nueva variable 
summary(base_de_datos)
summary(base_de_datos$nueva_variable)

# 18) tabula una variable de tu base 
table(base_de_datos$tercera_variable)

# Les voy a pedir que exporten esa base despu??s, asi que no la tiren ni nada 
# ??Van super bien! R es horrible hasta que ya aprendes a hablarlo y entonces es increible


# Directorios e Importaci??n de Bases de Datos #
# Vayan a la carpeta de la clase 1


# 19) Creen un directorio que se llame input y lleve a la carpeta que se llama "datos" y creen 
#     otro directorio que lleve a una carpeta nueva (que ustedes creen) que se llame "tarea" 
input <-"/Users/rcastellanosg/Downloads/Intro a R/datos"
tarea <- "/Users/rcastellanosg/Downloads/Intro a R/Tarea"

# 20) importen a un objeto llamado base_stata la base de datos que se llama BaseMunFW.dta
#     Hint: el dta es un formato no nativo a R, por lo que necesitan prender el paquete foreign para importarla

install.packages("foreign")
library(foreign)
base_stata<- read.dta(paste(input, "BaseMunFW.dta", sep ="/"))


# 21) creen otro objeto que se llame base_excel donde importen snsp_mun_nm1517.xlsx
install.packages("readxl")
library(readxl)
base_excel = read_excel(paste(input, "snsp_mun_nm1517.xlsx", sep="/"))

# 22) quedense s??lo con los homicidios de esa base 
# Hint: acuerdense como funciona los [] para hablar de renglones-columnas y el s??mbolo de $ para variables
base_excel<-base_excel[base_excel$`Tipo de delito`=="Homicidio",]

# 23) exporten base_de_datos usando su directorio 'tarea' a un archivo de csv que se llame "mitarea.csv"

write.csv(base_excel, paste(tarea,"mitarea.csv", sep="/"), row.names = F)


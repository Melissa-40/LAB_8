Hecho con gusto por Ruth Melissa Cobos Ruíz 

# LABORATORIO - RELACIONAMIENTO "CASO HIPOTÉTICO" 

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, métrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotética de datos
# 2. Calcular co ocurrencias entre personas y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar

#######################################
#LABORATORIO: Relacionamiento (r)     #
#######################################

library (EconGeo)
install.packages("EconGeo")
M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
M
co_occurrence(M)
c=co_occurrence(t(M))
c
r=relatedness(c)
r
r[r<1] =0
r[r>1] =1

library (igraph)
g1=graph_from_adjacency_matrix(r,mode = "undirected")
plot(g1)
#exportar resultados de co ocurrencias
write.csv(r,file="relatedness,csv")
write.csv(c,file="cocurrences,csv")

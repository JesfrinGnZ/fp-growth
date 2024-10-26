install.packages("dplyr")
library(dplyr)
data_migration <-read.csv('/home/jesfrin/Documentos/maestria/4to trimestre/mineria-de-datos/tareas/tarea3/MIGRACION_BDP.csv', sep = ",")

reglas <- fim4r(data_migration, method ="fpgrowth", target = "rules", supp = .2, conf = .5)
reglasFrame <- as(reglas, "data.frame")

dataset_urbano <- subset(data_migration, AREA == 1)
dataset_urbano <- dataset_urbano %>% select(-AREA)
reglas_urbano <-  fim4r(dataset_urbano, method ="fpgrowth", target = "rules", supp = .2, conf = .5)
reglasUrbanoFrame <- as(reglas_urbano, "data.frame")

dataset_rural <- subset(data_migration, AREA == 2)
dataset_rural <- dataset_rural %>% select(-AREA)
reglas_rural <-  fim4r(dataset_rural, method ="fpgrowth", target = "rules", supp = .2, conf = .5)
reglasRuralFrame <- as(reglas_rural, "data.frame")

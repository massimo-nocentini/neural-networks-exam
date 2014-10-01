norm.fun <- function(x){(x - min(x))/(max(x) - min(x))}
inputs.matrix <- read.csv("inputs.txt", sep=" ", header=FALSE)
inputs.normalized <- apply (inputs.matrix, 2, norm.fun)
write.table (inputs.normalized, "inputs-normalized.txt")

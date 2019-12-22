library("ChemmineR")
library("igraph")

# ---- load molecules with ChemmineR
mols <- read.SDFset("fullereneC60.sdf")
molnum = 1

# ---- calculate bond matrix with ChemmineR
#      (The labels are defined as follows: 0 is no connection, 1 is a single bond, 2 is a double bond and 3 is a triple bond.)
mol1_BondMatrix <- conMA(mols[[molnum]], exclude=c("H"))
plot(mols[molnum], atomnum = TRUE, noHbonds=FALSE , no_print_atoms = "", atomcex=0.8)

# ---- from bond matrix to ajacency matrix
mol1_BondMatrix[mol1_BondMatrix > 1] <- 1

# ---- create graph with igraph
graph1 <- graph_from_adjacency_matrix(mol1_BondMatrix, mode = c("undirected"))

# ---- plot graph
igraph_options(vertex.size=5)
igraph_options(vertex.label=NA)

par(mfrow=c(1, 3))

# std
plot(graph1, main="SDF coordnates")

# Kamada-Kawai
plot(graph1, layout=layout_with_kk, main="Kamada-Kawai")

# Fruchterman-Reingold
plot(graph1, layout=layout_with_fr, main="Fruchterman-Reingold")

# Analysis for AE
## 
###### 
```Rcript
library(ANN2)
library(NeuralNetTools)
AE <- autoencoder(X, c(10,2,10), loss.type = 'pseudo-huber',
                  activ.functions = c('tanh','linear','tanh'),
                  batch.size = 8, optim.type = 'adam',
                  n.epochs = 1000, val.prop = 0)

# Plot loss during training
summary(AE)
compression_plot(AE,X)
plot(AE)
sort(recX$anomaly_scores, decreasing = TRUE)[1:5]
AE_df<-recX$reconstructed
rownames(AE_df)<-rownames(X)
scico_palette_show()
corrplot(cor(t(AE_df), method = 'spearman'), 
         method = 'color', col = scico(n=100,palette = "davos",direction = -1),
         number.cex = 0.3, tl.cex = 0.5, tl.col="black",
         order = 'hclust', hclust.method = 'ward.D', addrect =3)

AE_pca <- PCA(AE_df, graph = FALSE)
# Visualize
# Use habillage to specify groups for coloring
fviz_pca_ind(AE_pca,
            #label = "none", # hide individual labels
             habillage = dfcol$Group, # color by groups
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             addEllipses = TRUE # Concentration ellipses
)

km.res <- kmeans(scale(AE_df),2, nstart = 25)
fviz_cluster(km.res, data = AE_df,repel = T,labelsize = 4,
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             ggtheme = theme_minimal(),
             main = "Kmeans Clustering Plot"
)




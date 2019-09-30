load("mayo.cer.RData") #Load the expression data file downloaded from Synapse
tbl = as.data.frame(tbl)
data_exp = exp(tbl)
gene = data.frame(rownames(data_exp))
rowmeans_data_exp = data.frame(rowMeans(data_exp))
library("biomaRt")
ensembl = useMart("ensembl")
ensembl = useDataset("hsapiens_gene_ensembl", mart=ensembl)
mart=useMart(biomart="ensembl", dataset="hsapiens_gene_ensembl")
G_list <- getBM(filters= "hgnc_symbol", attributes= c("hgnc_symbol","ensembl_gene_id","entrezgene"),values=gene,mart= mart)
a = cbind(gene,data_exp)
metadata = merge(G_list, a, by.x = "hgnc_symbol", by.y = "rownames.data_exp.", all=F)
# Calculate Ubiquity Score for entire dataset
metadata_1 = metadata[,-c(1,2,3)]
median_metadata_1 = data.frame(apply(metadata_1, 1, median)) #rowmeans is skewing the data.That's why considering the median value
quantile_metadata = quantile(median_metadata_1[,1], prob = c(0.0, 0.10, 0.25, 0.5, 0.75))
quantile_metadata = as.data.frame(quantile_metadata)
# To find number of genes
#sum(median_metadata_1$apply.metadata_1..1..median. > quantile_metadata[1,1])
sum(median_metadata_1$apply.metadata_1..1..median. > quantile_metadata[2,1])
sum(median_metadata_1$apply.metadata_1..1..median. > quantile_metadata[3,1])
sum(median_metadata_1$apply.metadata_1..1..median. > quantile_metadata[4,1])
sum(median_metadata_1$apply.metadata_1..1..median. > quantile_metadata[5,1])
write.csv(quantile_metadata, "quantile_distribution_dataset.csv")
metadata_1[metadata_1 < quantile(median_metadata_1[,1], prob = 0.25)] = 0
metadata_1[metadata_1 > quantile(median_metadata_1[,1], prob = 0.25)] = 1
rowmeans_metadata_1 = data.frame(rowMeans(metadata_1))
gene_id = data.frame(metadata$entrezgene)
b = cbind(gene_id,rowmeans_metadata_1)
write.csv(b, "Frontal_cortex_ubiquity_score.csv")


# This code helps in selecting specific columns from files in a directory and later merging the files together


# Processing the reaction files to represent binary values
extension = "csv"
fileNames = Sys.glob(paste("tissuemodel*.", extension, sep = ""))
fileNumbers = seq(fileNames)
for (fileNumber in fileNumbers){
  newFileName <-  paste("binary-", sub(paste("\\.", extension, sep = ""), "", fileNames[fileNumber]), ".", extension, sep = "")
  sample = read.csv(fileNames[fileNumber], sep="\t", header = FALSE)
  sample_new = data.frame(sample, ifelse(sample[,3]==0 & sample[,4]==0, 0, 1))
  sample_new_final = data.frame(sample_new[,c(1,7)])
  names(sample_new_final)[2] = fileNames[fileNumber]
  write.csv(sample_new_final, newFileName, append = FALSE, quote = FALSE, sep = "\t", row.names = FALSE)
}

# merging the files
extension = "csv"
fileNames_reactions = Sys.glob(paste("binary-*.", extension, sep = "")) #fileNames_binary = Sys.glob(paste("binary-*.", extension, sep=""))
fileNumbers = seq(fileNames_reactions)
datalist = lapply(fileNames_reactions, function(x){read.csv(file=x,header=T)})
out <- Reduce(function(x,y) merge(x,y, by=1, all=TRUE), datalist)
out[is.na(out)] = 0
write.csv(out, "merged_binary_file_reactions.csv", row.names = FALSE, quote = FALSE)

#Correlates qPCR and RNASeq data to cross-validate methodologies. 

library(ggpubr)
library(tidyverse)


qpcr_input <- read_delim("qpcr_input.csv", ";", escape_double = FALSE, trim_ws = TRUE)

plot <- list()
genes <- unique(qpcr_input$Gene)
descrip <- unique(qpcr_input$descrip)

for (i in 1:length(genes)) {
  df <- qpcr_input %>% 
  filter(Gene == genes[i])
  p <- ggscatter(df, x="log2FC_qRT", y = "log2FC_rnaseq",
            add = "reg.line", conf.int = TRUE, 
            cor.coef = TRUE, cor.method = "pearson",
            title = paste(genes[i], " ", descrip[i]))
  plot[[i]] = p
}

plot[1:9]

#saves your plots to the working directory. 
for (i in 1:7) {
  file_name = paste("corr_plot_", genes[i], ".tiff", sep="")
  tiff(file_name)
  print(plot[[i]])
  dev.off()
}

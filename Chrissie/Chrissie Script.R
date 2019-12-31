library(tidyverse)
library(ggpubr)
#import qpcr_input_chrissie.csv here as an object called chrissie
#chrissie <- read_delim("qpcr_input_chrissie.csv", ";", escape_double = FALSE, trim_ws = TRUE)

plot_c <- list()
genes_c <- unique(chrissie$Gene)

for (i in 1:length(genes_c)) {
  df <- chrissie %>% 
    filter(Gene == genes_c[i])
  p <- ggscatter(df, x="log2FC_qRT", y = "log2FC_denovo",
                 add = "reg.line", conf.int = TRUE, 
                 cor.coef = TRUE, cor.method = "pearson",
                 title = genes_c[i])+
    theme_bw()
  plot_c[[i]] = p
}

plot_c[1:7] #prints your correlation graphs to the plots tab. 

#saves your plots to the working directory. If you don't know where this is, type getwd() in the console
for (i in 1:7) {
  file_name = paste("corr_plot_denovo", genes_c[i], ".tiff", sep="")
  tiff(file_name)
  print(plot_c[[i]])
  dev.off()
}

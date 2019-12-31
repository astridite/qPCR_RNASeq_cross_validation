## qPCR RNASeq cross validation in R

Validating your RNASeq experiment with a qPCR experiment and correlating the results. 

Creates individual correlation plots for genes (log2FC FPKM vs log2FC ΔΔCt relative to the same ctrl sample) and saves them to your project directory. 

Replace qpcr_input with your own data in long format.

Libraries required: ggpubr and tidyverse

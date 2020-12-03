## Run alevinQC inside of Galaxy

## Check that input files are formatted correctly
library(alevinQC)

## Check that all input files required are present in working directory
checkAlevinInputFiles(baseDir = ".")

## Read in alevin output files as alevin object
alevin <- readAlevinQC(baseDir = ".")

# ## Write table with statistics of run
summaryTable <- alevin$summaryTables$fullDataset

write.table(summaryTable,
            file ="./summaryTable.tab",
            sep = "\t",
            col.names = FALSE,
            row.names = TRUE,
            quote = FALSE)

## Plot knee plot
pdf(file = "./alevin_kneeplot.pdf")
plotAlevinKneeRaw(alevin$cbTable)
dev.off()

## Barcode collapse plot
pdf(file = "./alevin_barodeFrequency_quant.pdf", width = 12, height = 9)
plotAlevinQuant(alevin$cbTable)
dev.off()
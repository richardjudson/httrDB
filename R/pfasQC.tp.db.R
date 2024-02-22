library(openxlsx)
library(stringr)
library(stringi)
library(digest)
#--------------------------------------------------------------------------------------
#' BUild the mysql database for the httr data
#'
#--------------------------------------------------------------------------------------
pfasQC.tp.db <- function(do.clean=F,
                        do.init=F,
                        do.load.datasets=F,
                        do.load.pods=F,
                        sigcatalog="signatureDB_master_catalog 2021-09-29",
                        sigset="screen_large",
                        method="gsea",
                        hccut=0.9,
                        tccut=1) {
  printCurrentFunction(paste(sigset,method))
  db = "res_httr"
  dir = "../input/PFAC QC/"
  runQuery("delete from sample_qc",db)
  runQuery("delete from flags",db)
  file = paste0(dir,"QC flag definitions.xlsx")
  flags = read.xlsx(file)
  runInsertTable(flags,"flags",db=db,do.halt=T,verbose=F,get.id=T)

  file = paste0(dir,"PFAS wide sample qc.xlsx")
  qc = read.xlsx(file)
  qc = qc[,c("dtxsid","spid","value","flag")]
  names(qc) = c("dtxsid","sample_id","qc_score","flags")
  runInsertTable(qc,"sample_qc",db=db,do.halt=T,verbose=F,get.id=T)
}


#--------------------------------------------------------------------------------------
#' Add the PFAS QC data to the database
#'
#--------------------------------------------------------------------------------------
pfasQC.to.db <- function() {
  printCurrentFunction()
  db = "res_httr"
  dir = "../input/PFAS QC/"
  runQuery("delete from sample_qc",db)
  runQuery("delete from flags",db)
  browser()

  file = paste0(dir,"PFAS wide sample qc.xlsx")
  print(file)
  qc = read.xlsx(file)
  qc = qc[,c("dtxsid","spid","value","flag")]
  names(qc) = c("dtxsid","sample_id","qc_score","flags")
  runInsertTable(qc,"sample_qc",db=db,do.halt=T,verbose=F,get.id=T)

  file = paste0(dir,"QC flag definitions.xlsx")
  flags = read.xlsx(file)
  runInsertTable(flags,"flags",db=db,do.halt=T,verbose=F,get.id=T)
}


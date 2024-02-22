library(openxlsx)
library(stringr)
library(stringi)
library(digest)
#--------------------------------------------------------------------------------------
#' Export the chemicals with data
#'
#--------------------------------------------------------------------------------------
export.httr.chems <- function() {
  printCurrentFunction()
  query = paste0("
                 select a.dtxsid,a.casrn,a.name
                 from chemical a,
                 sample b,
                 concresp c
                 where b.dtxsid=a.dtxsid
                 and c.sample_id=b.sample_id")
  chems = unique(runQuery(query,db))
  file = paste0("../chemicals/HTTr chemicals ",Sys.Date(),".xlsx")
  write.xlsx(chems,file)
}


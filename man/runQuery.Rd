% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runQuery.R
\name{runQuery}
\alias{runQuery}
\title{Runs a database query and returns a result set}
\usage{
runQuery(query, db, do.halt = T, verbose = F)
}
\arguments{
\item{query}{a properly formatted SQL query as a string}

\item{db}{the name of the database}

\item{do.halt}{if TRUE, halt on errors or warnings}

\item{verbose}{if TRUE, print diagnostic information}
}
\description{
Runs a database query and returns a result set
}

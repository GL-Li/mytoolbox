% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/merge_two_datatable_row_by_row.R
\name{merge_dt}
\alias{merge_dt}
\title{Merge two data.tables}
\usage{
merge_dt(dt1, dt2, id1 = FALSE, id2 = FALSE)
}
\arguments{
\item{dt1}{first data.table}

\item{dt2}{second data.table}

\item{id1, id2}{add a id number for each row of dt1 or dt2 if TRUE. The
purpose of adding id is for future "by" operation based on rows}
}
\value{
data.table, which has n1 x n2 rows where n1 and n2 are number of rows
    of dt1 and dt2
}
\description{
Merge two data.tables to form a large data.table with all
combination of rows. It is similar to base::merge(df1, df2).
}
\examples{
# make up two data tables
library(data.table) # the examples are run in global environment
library(magrittr)
set.seed(123)
a <- data.table(xa = rnorm(5), ya = rnorm(5))
b <- data.table(xb = -1:1, yb = -1:1)

# merge them and create row id for the second data.table
c <- merge_dt(a, b, id2 = TRUE)

# application: select the point in a that is closest to the point in b
c[, dist := sqrt((xa - xb)^2 + (ya - yb)^2)] \%>\%
    .[, .SD[dist == min(dist)], by = id2] \%>\%
    print()

}

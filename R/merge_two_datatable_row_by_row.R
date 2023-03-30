#' Merge two data.tables
#'
#' @description Merge two data.tables to form a large data.table with all
#' combination of rows. It is similar to base::merge(df1, df2).
#'
#' @param dt1 first data.table
#' @param dt2 second data.table
#' @param id1,id2 add a id number for each row of dt1 or dt2 if TRUE. The
#'     purpose of adding id is for future "by" operation based on rows
#'
#' @return data.table, which has n1 x n2 rows where n1 and n2 are number of rows
#'     of dt1 and dt2
#'
#' @examples
#' # make up two data tables
#' library(data.table) # the examples are run in global environment
#' library(magrittr)
#' set.seed(123)
#' a <- data.table(xa = rnorm(5), ya = rnorm(5))
#' b <- data.table(xb = -1:1, yb = -1:1)
#'
#' # merge them and create row id for the second data.table
#' c <- merge_dt(a, b, id2 = TRUE)
#'
#' # application: select the point in a that is closest to the point in b
#' c[, dist := sqrt((xa - xb)^2 + (ya - yb)^2)] %>%
#'     .[, .SD[dist == min(dist)], by = id2] %>%
#'     print()
#'
#' @import data.table
#' @import magrittr
#'
#' @export

merge_dt <- function(dt1, dt2, id1 = FALSE, id2 = FALSE) {

    # mute no visible biding notes
    `.` <- `:=` <- `%>%` <- tmp <- NULL

    if (id1) {
        dt1[, id1 := seq_len(nrow(dt1))]
    }
    if (id2) {
        dt2[, id2 := seq_len(nrow(dt2))]
    }
    # add a tmp column of constant to each of the two data.tables so that
    # they can be joined on.
    dt1[, tmp := 1]
    dt2[, tmp := 1]
    merged <- dt1[dt2, on = .(tmp), allow.cartesian = TRUE] %>%
        .[, tmp := NULL]
    # remove added columns from dt1 and dt2
    dt1[, tmp := NULL]
    dt2[, tmp := NULL]
    if (id1) {
        dt1[, id1 := NULL]
    }
    if (id2) {
        dt2[, id2 := NULL]
    }

    return(merged)
}

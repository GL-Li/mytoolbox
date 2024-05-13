#' Stop the execution of an expression if the elapsed time exceed a limit
#'
#' @param expr R expression such as sum(1:5) and muli-line R code inside {}.
#' @param timeout numeric, time limit in second
#'
#' @return return of expr
#'
#' @examples
#' timeout(
#'   {
#'     for (i in 1:10) {
#'       print(i)
#'     }
#'   },
#'   timeout = 1
#' )
#'
#' @export
#'

timeout <- function(expr, timeout) {
  setTimeLimit(elapsed = timeout)
  on.exit(setTimeLimit(elapsed = Inf))
  expr
}

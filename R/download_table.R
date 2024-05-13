#' Download a online table
#'
#'
#'
#' @param url url of the webpage containing the table
#' @param xpath xpath of the table
#' @param save_as save table as "save_as.csv" file
#'
#' @details Inspect the webpage, highlight css code for table, right click then
#' copy --> copy XPath, and paste inside SINGLE quote ' ' as xpath contains
#' double quotes.
#'
#' Package xml2 is required for rvest. Need to import it explicitly in the
#' package.
#'
#' @import rvest xml2
#'
#' @return a data frame or a saved csv file
#'
#' @examples
#' \dontrun{
#' table_df <-  download_table(
#'     'https://en.wikipedia.org/wiki/Judgment_of_Paris_(wine)',
#'     '//*[@id="mw-content-text"]/div/table[5]',
#'     "wine.csv"
#' )
#' }
#' @export
#'

download_table <- function(url, xpath, save_as) {
    if (!file.exists(save_as)) {
        table <- url |>
            rvest::read_html() |>
            rvest::html_nodes(xpath = xpath) |>
            rvest::html_table(fill = TRUE)
        table <- table[[1]]
        utils::write.csv(table, file = save_as, row.names = FALSE)
        return(table)
    } else {
        table <- utils::read.csv(save_as, stringsAsFactors = FALSE)
    }
}

#' Convert state names among full, lowercase, and abbreviation
#'
#' Also include other areas such as Puerto Rico and Guam, and even United states
#' for dealing with census data. Examples of state names:
#' full      --  "District of Columbia", "Kentucky";
#' lowercase --  "district of columbia", "kentucky";
#' abbr      --  "DC", "KY".
#'
#'
#' @param states string, vector of state names to be converted.
#' @param to string, format after convertion, take values of "full",
#' "lowercase", and "abbr".
#'
#' @return a vector of converted state names
#'
#' @examples
#' convert_state_names(c("Alabama",  "California","Connecticut"), "abbr")
#'
#' # wrong names return NA and a warning
#' convert_state_names(c("DC", "AA","MA"), "full")
#'
#'
#' @import data.table
#'
#' @export

convert_state_names <- function(states, to) {
    # This function convert state names between full, lowercase, and abbr
    # args_______________
    # name_vector: vector of names to be converted
    # to: the desired format after conversion
    # returns___________
    # a vector of converted state names
    #
    # mutate no visible binding notes
    `.` <- NULL

    # database:
    full <- c(
        "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
        "Connecticut", "Delaware", "District of Columbia", "Florida",
        "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
        "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts",
        "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana",
        "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico",
        "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma",
        "Oregon", "Pennsylvania", "Rhode Island", "South Carolina",
        "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia",
        "Washington", "West Virginia", "Wisconsin", "Wyoming", "American Samoa",
        "Guam", "Northern Mariana Island", "Puerto Rico",
        "United States Virgin Islands", "United States"
    )

    lowercase <- c(
         "alabama", "alaska", "arizona", "arkansas", "california", "colorado",
         "connecticut", "delaware", "district of columbia", "florida",
         "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas",
         "kentucky", "louisiana", "maine", "maryland", "massachusetts",
         "michigan", "minnesota", "mississippi", "missouri", "montana",
         "nebraska", "nevada", "new hampshire", "new jersey", "new mexico",
         "new york", "north carolina", "north dakota", "ohio", "oklahoma",
         "oregon", "pennsylvania", "rhode island", "south carolina",
         "south dakota", "tennessee", "texas", "utah", "vermont", "virginia",
         "washington", "west virginia", "wisconsin", "wyoming",
         "american samoa", "guam", "northern mariana island", "puerto rico",
         "united states virgin islands", "united states"
    )

    abbr <- c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL",
              "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
              "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM",
              "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN",
              "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY", "AS", "GU", "MP",
              "PR", "VI", "US")

    # identify format of state names
    if (mean(nchar(states)) < 3) {
        states <- toupper(states)
        from <- "abbr"
    } else {
        states <- tolower(states)
        from <- "lowercase"
    }

    if (!all(states %in% c(full, lowercase, abbr))) {
        warning("One or more state names are wrong")
    }

    # conversion
    to_be_converted <- data.table::data.table(from = states)
    converter <- data.table::data.table(from = get(from),
                            to = get(to))
    result <- converter[to_be_converted, on = "from"] |>
        _[, to]

    return(result)
}

test_that("download wine.csv", {
    url <- "https://en.wikipedia.org/wiki/Judgment_of_Paris_(wine)"
    xpath <- '//*[@id="mw-content-text"]/div/table[5]'
    save_as <- "wine.csv"

    download_table(url, xpath, save_as)
    wine_expected <- structure(list(
        Rank = 1:10,
        Grade = c(14.14, 14.09, 13.64, 13.23, 12.14,
                  11.18, 10.36, 10.14, 9.95, 9.45),
        Wine = c("Stag's Leap Wine Cellars",
                 "Château Mouton-Rothschild",
                 "Château Montrose",
                 "Château Haut-Brion",
                 "Ridge Vineyards Monte Bello",
                 "Château Leoville Las Cases",
                 "Heitz Wine Cellars Martha's Vineyard",
                 "Clos Du Val Winery",
                 "Mayacamas Vineyards",
                 "Freemark Abbey Winery"),
        Vintage = c(1973L, 1970L, 1970L, 1970L, 1971L,
                    1971L, 1970L, 1972L, 1971L, 1969L),
        Origin = c("USA", "France", "France", "France", "USA",
                   "France", "USA", "USA", "USA", "USA")),
        class = "data.frame",
        row.names = c(NA, -10L))
    wine_saved <- utils::read.csv("wine.csv")

    expect_equal(wine_saved, wine_expected)

    file.remove("wine.csv")
})

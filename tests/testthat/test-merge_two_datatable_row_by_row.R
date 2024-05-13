test_that("find closest point", {
    a <- data.table(xa = 0:2, ya = 0:2)
    b <- data.table(xb = -1:1, yb = -1:1)

    # merge them and create row id for the second data.table
    c <- merge_dt(a, b, id1 = TRUE, id2 = TRUE)

    # application: select the point in a that is closest to the point in b
    d <- c[, dist := sqrt((xa - xb)^2 + (ya - yb)^2)] |>
        _[, .SD[dist == min(dist)], by = id2]

    expect_equal(d$id1, c(1, 1, 2))
    expect_equal(d$dist, c(sqrt(2), 0, 0))
})

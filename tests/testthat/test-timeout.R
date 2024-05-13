test_that("expect timeout", {
    expect_error({
        res <- timeout(
            {for (i in 1:1e8) {
                x <- log(i)
            }},
            timeout = 0.1
        )
    })
})



test_that("expect not timeout", {
    res <- timeout(
        3 + 3,
        timeout = 0.1
    )

    expect_equal(res, 6)
})

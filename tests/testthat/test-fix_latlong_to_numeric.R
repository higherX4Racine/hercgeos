test_that("lats and longs are converted to numbers", {
    ORIGINAL <- tibble::tibble(
        INTPTLAT = c("+1", "+2", "-3"),
        INTPTLON = c("-5", "-4", "+3")
    )
    REVISED <- ORIGINAL |> fix_latlong_to_numeric()
    expect_equal(REVISED$INTPTLAT,
                 c(1.0, 2.0, -3.0))
    expect_equal(REVISED$INTPTLON,
                 c(-5.0, -4.0, 3.0))
})

test_that("unconvertable INTPT* fields cause errors", {
    ORIGINAL <- tibble::tibble(
        INTPTEXT = c("Hi", "Mom")
    )
    expect_error(fix_latlong_to_numeric(ORIGINAL),
                 "Couldn't convert all of the field values to numeric values")
})

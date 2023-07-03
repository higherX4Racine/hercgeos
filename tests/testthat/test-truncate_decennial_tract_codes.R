test_that("only codes from 2000 are shortened", {
    TRACTS <- tibble::tribble(
        ~ Year, ~ Code,
        2000L,  "001001",
        2000L,  "002000",
        2010L,  "001001",
        2010L,  "002000"
    )
    TRUNCS <- truncate_decennial_tract_codes(TRACTS$Code,
                                             TRACTS$Year)
    expect_equal(TRUNCS,
                 c("001001", "0020", "001001", "002000"))
})

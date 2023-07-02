test_that("numbers are removed from the ends of column names", {
    RENAMED <- fix_old_year_suffixes(
        tibble::tibble(
            Zeros00 = NA,
            Ones11 = NA,
            Lots1234567890 = NA
        )
    )

    expect_equal(names(RENAMED),
                 c("Zeros",
                   "Ones",
                   "Lots"))
})

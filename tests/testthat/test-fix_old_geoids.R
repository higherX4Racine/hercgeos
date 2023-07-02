test_that("column names are changed from *IDFP* to GEOID", {
    RENAMED <- fix_old_geoids(
        tibble::tibble(
            ALLCAPSIDFP = NA,
            allloweridfp = NA,
            noFPID = NA
        )
    )

    expect_equal(names(RENAMED),
                 c("GEOID",
                   "allloweridfp",
                   "noFPID"))
})

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

test_that("when there is no 'IDFP' column, everything is fine.", {
    RENAMED <- fix_old_geoids(
        tibble::tibble(
            GEOID = NA,
            allloweridfp = NA,
            noFPID = NA
        )
    )

    expect_equal(names(RENAMED),
                 c("GEOID",
                   "allloweridfp",
                   "noFPID"))
})

test_that("multiple 'IDFP' columns cause a problem", {
    expect_snapshot(
        fix_old_geoids(
            tibble::tibble(
                GEOIDFP = NA,
                alllowerIDFP = NA,
                noIDFP = NA
            )
        ),
        error = TRUE
    )
})

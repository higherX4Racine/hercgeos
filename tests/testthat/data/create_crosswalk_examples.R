## Copyright (C) 2025 by Higher Expectations for Racine County

set.seed(42L)

## this is what I normally use "hiRx::input_path" for,
## but I'm trying to avoid dependencies
LOCAL_DATA_PATH <- file.path("~", "..", "..", "Documents", "Data")

CROSSWALK_PATH <- file.path(LOCAL_DATA_PATH,
                            "Downloads",
                            "Census Bureau",
                            "Crosswalks")

TEST_DATA_PATH <- file.path("tests",
                            "testthat",
                            "data")

crosswalk_name <- function(.newer_vintage) {
    file.path(TEST_DATA_PATH,
              paste0("crosswalk_from_",
                     .newer_vintage - 10L,
                     "_to_",
                     .newer_vintage,
                     ".txt")
    )
}

CROSSWALK_PATH |>
    file.path(
        "2000",
        "t9t255101.txt"
    ) |>
    readLines() |>
    sample(
        size = 100L,
        replace = FALSE
    ) |>
    writeLines(
        crosswalk_name(2000)
    )

purrr::iwalk(
    list(
        TAB2000_TAB2010_ST_55_v2 = 2010L,
        tab2010_tab2020_st55_wi = 2020L
    ),
    \(.vintage, .basename) {

        zcon <- CROSSWALK_PATH |>
            file.path(
                paste0(.basename, ".zip")
            ) |>
            unz(
                filename = paste0(.basename, ".txt")
            )

        lainz <- readLines(zcon)

        close(zcon)

        mini <- c(lainz[1], sample(tail(lainz, -1), 100, FALSE))

        writeLines(mini, con = crosswalk_name(.vintage))
    }
)

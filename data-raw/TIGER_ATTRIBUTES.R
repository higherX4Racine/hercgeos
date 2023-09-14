TIGER_ATTRIBUTES <- "extdata" |>
    system.file(
        "TIGER_ATTRIBUTES.csv",
        package = "hercgeos"
    ) |>
    readr::read_csv(
        col_types = "cc",
        show_col_types = FALSE
    )

TIGER_ATTRIBUTES <- rlang::set_names(
    TIGER_ATTRIBUTES$Attribute,
    nm = TIGER_ATTRIBUTES$Field
)

usethis::use_data(TIGER_ATTRIBUTES, overwrite = TRUE)

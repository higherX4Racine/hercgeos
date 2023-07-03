test_that("NAME and NAMELSAD coalesce", {
    BAD_NAMES <- tibble::tribble(
        ~ NAME,       ~ NAMELSAD,
        "Hi",         "Hello",
        "Mom",        NA,
        "Ignored :(", "World"
    )
    good_names <- BAD_NAMES |> fix_blank_names() |> dplyr::pull("Name")
    expect_equal(good_names,
                 c("Hello", "Mom", "World"))
})

test_that("absent NAME or NAMELSAD raises", {
    BAD_NAMES <- tibble::tribble(
        ~ nombre, ~ apellido,
        "Hello", "Hi",
        NA,      "Mom",
        "World", "Ignored :("
    )
    expect_error(fix_blank_names(BAD_NAMES),
                 "! Column `NAMELSAD` not found in `.data`")
})

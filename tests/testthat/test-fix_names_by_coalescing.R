test_that("NAME and NAMELSAD coalesce", {
    BAD_NAMES <- tibble::tribble(
        ~ NAME,       ~ NAMELSAD,
        "Hi",         "Hello",
        "Mom",        NA,
        "Ignored :(", "World"
    )
    GOOD_NAMES <- fix_names_by_coalescing(BAD_NAMES)
    expect_equal(names(GOOD_NAMES), "Name")
    expect_equal(GOOD_NAMES$Name,
                 c("Hello", "Mom", "World"))
})

test_that("absent NAME or NAMELSAD raises", {
    BAD_NAMES <- tibble::tribble(
        ~ nombre, ~ apellido,
        "Hello", "Hi",
        NA,      "Mom",
        "World", "Ignored :("
    )
    expect_error(fix_names_by_coalescing(BAD_NAMES),
                 "! Column `NAMELSAD` not found in `.data`")
})

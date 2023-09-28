## code to prepare `DECENNIAL_POPULATION_VARIABLE_FORMATS` dataset goes here
DECENNIAL_POPULATION_VARIABLE_FORMATS <- tibble::tribble(
    ~ Year, ~ Group, ~ Separator, ~ Suffix,
    2000L,  "PL00", "",          "",
    2010L,  "P00",  "",          "",
    2020L,  "P",    "_",         "N"
)


usethis::use_data(DECENNIAL_POPULATION_VARIABLE_FORMATS, overwrite = TRUE)

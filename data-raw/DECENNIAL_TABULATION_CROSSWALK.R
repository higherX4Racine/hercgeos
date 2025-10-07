## Copyright (C) 2025 by Higher Expectations for Racine County

DECENNIAL_TABULATION_CROSSWALK <- tibble::tribble(
    ~ Role, ~ Detail, ~ Datatype, ~ `In Older Vintage`, ~ `Pre 2000`, ~ `Field Description`,
    "FIPS", "State",  "c",        TRUE,                 TRUE,         "Tabulation state FIPS code",
    "FIPS", "County", "c",        TRUE,                 TRUE,         "Tabulation county FIPS code",
    "FIPS", "Tract",  "c",        TRUE,                 TRUE,         "Census tract number",
    "FIPS", "Block",  "c",        TRUE,                 TRUE,         "Tabulation block number",
    "FIPS", "Suffix", "c",        TRUE,                 FALSE,        "Tabulation block suffix",
    "Area", "Land",   "n",        TRUE,                 FALSE,        "Land Area",
    "Area", "Water",  "n",        TRUE,                 FALSE,        "Water Area",
    "Part", "Flag",   "c",        TRUE,                 TRUE,         "Tabulation block part flag; Blank = whole; P = part",
    "Part", "Land",   "n",        FALSE,                FALSE,        "Intersection Land Area shared by the Old and New blocks represented by the record",
    "Part", "Water",  "n",        FALSE,                FALSE,        "Intersection Water Area shared by the Old and New blocks represented by the record"
)

usethis::use_data(DECENNIAL_TABULATION_CROSSWALK, overwrite = TRUE)

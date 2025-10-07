## Copyright (C) 2025 by Higher Expectations for Racine County

DECENNIAL_TABULATION_CROSSWALK <- tibble::tribble(
    ~ Role, ~ Detail, ~ Datatype, ~ `Pre 2000`, ~ `Field Description`,
    "FIPS", "State",  "c",        TRUE,         "Tabulation state FIPS code",
    "FIPS", "County", "c",        TRUE,         "Tabulation county FIPS code",
    "FIPS", "Tract",  "c",        TRUE,         "Census tract number",
    "FIPS", "Block",  "c",        TRUE,         "Tabulation block number",
    "FIPS", "Suffix", "c",        FALSE,        "Tabulation block suffix",
    "Area", "Land",   "n",        FALSE,        "Land Area",
    "Area", "Water",  "n",        FALSE,        "Water Area",
    "Part", "Flag",   "c",        TRUE,         "Tabulation block part flag; Blank = whole; P = part",
    "Part", "Land",   "n",        FALSE,        "Intersection Land Area shared by the Old and New blocks represented by the record",
    "Part", "Water",  "n",        FALSE,        "Intersection Water Area shared by the Old and New blocks represented by the record"
)

usethis::use_data(DECENNIAL_TABULATION_CROSSWALK, overwrite = TRUE)

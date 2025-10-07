## Copyright (C) 2025 by Higher Expectations for Racine County

RELATE_BLOCKS_2000_TO_BLOCKS_2010 <- tibble::tribble(
    ~ `Field #`, ~ `Maximum Length`, ~ `Field Name`,        ~ `Field Description`,
             1L,                 2L, "STATE_2000",	        "2000 tabulation state FIPS code",
             2L,                 3L, "COUNTY_2000",	        "2000 tabulation county FIPS code",
             3L,                 6L, "TRACT_2000",	        "2000 census tract number",
             4L,                 4L, "BLK_2000",	        "2000 tabulation block number",
             5L,                 1L, "BLKSF_2000",	        "2000 tabulation block suffix",
             6L,                14L, "AREALAND_2000",	    "2000 Land Area",
             7L,                14L, "AREAWATER_2000",	    "2000 Water Area",
             8L,                 1L, "BLOCK_PART_FLAG_O",	"2000 tabulation block part flag; Blank = whole; P = part",
             9L,                 2L, "STATE_2010",	        "2010 tabulation state FIPS code",
            10L,                 3L, "COUNTY_2010",	        "2010 tabulation county FIPS code",
            11L,                 6L, "TRACT_2010",	        "2010 census tract number",
            12L,                 4L, "BLK_2010",	        "2010 tabulation block number",
            13L,                 1L, "BLKSF_2010",	        "2010 tabulation block suffix",
            14L,                14L, "AREALAND_2010",	    "2010 Land Area",
            15L,                14L, "AREAWATER_2010",	    "2010 Water Area",
            16L,                 1L, "BLOCK_PART_FLAG_R",	"2010 tabulation block part flag; Blank = whole; P = part",
            17L,                14L, "AREALAND_INT",	    "Intersection Land Area shared by the 2000 and 2010 blocks represented by the record",
            18L,                14L, "AREAWATER_INT",	    "Intersection Water Area shared by the 2000 and 2010 blocks represented by the record"
)
usethis::use_data(RELATE_BLOCKS_2000_TO_BLOCKS_2010, overwrite = TRUE)

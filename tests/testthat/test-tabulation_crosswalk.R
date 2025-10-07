test_that("FIPS patterns build correctly", {

    expect_equal(
        pattern_functions[["FIPS"]](2000, "State"),
        "state_2000"
    )
    expect_equal(
        pattern_functions[["FIPS"]](2010, "block"),
        "blk_2010"
    )
    expect_equal(
        pattern_functions[["FIPS"]](2020, "SUFFIX"),
        "blksf_2020"
    )

})

test_that("Area patterns build correctly", {

    expect_equal(
        pattern_functions[["Area"]](2000, "State"),
        "areaState_2000"
    )
    expect_equal(
        pattern_functions[["Area"]](2010, "block"),
        "areablock_2010"
    )
    expect_equal(
        pattern_functions[["Area"]](2020, "SUFFIX"),
        "areaSUFFIX_2020"
    )

})

test_that("Part patterns build correctly", {

    expect_equal(
        pattern_functions[["Part"]](2000, "Flag"),
        "block_part_flag_2000"
    )
    expect_equal(
        pattern_functions[["Part"]](2010, "land"),
        "arealand_int"
    )
    expect_equal(
        pattern_functions[["Part"]](2020, "WATER"),
        "areaWATER_int"
    )
})

test_that("years are built correctly", {

    expect_equal(set_year(2000L, "Flag", TRUE),
                 "o")

    expect_equal(set_year(2000L, "Flag", FALSE),
                 "r")

    expect_equal(set_year(2000L, "Land", TRUE),
                 1990L)

    expect_equal(set_year(2000L, "Block", FALSE),
                 2000L)
})

test_that("earlier censuses have shorter specs", {
    .xwalk <- DECENNIAL_TABULATION_CROSSWALK |>
        dplyr::filter(
            .data$`Pre 2000`
        )

    expect_equal(
        build_spec_for_vintage(.xwalk, 1900, TRUE),
        c(STATE_1890 = "c", COUNTY_1890 = "c", TRACT_1890 = "c", BLK_1890 = "c",
          BLOCK_PART_FLAG_O = "c")
    )

    expect_equal(
        build_spec_for_vintage(.xwalk, 1980, FALSE),
        c(STATE_1980 = "c", COUNTY_1980 = "c", TRACT_1980 = "c", BLK_1980 = "c",
          BLOCK_PART_FLAG_R = "c")
    )

})

test_that("later censuses have longer specs", {

    expect_equal(
        build_spec_for_vintage(DECENNIAL_TABULATION_CROSSWALK, 1900, TRUE),
        c(STATE_1890 = "c", COUNTY_1890 = "c", TRACT_1890 = "c", BLK_1890 = "c", BLKSF_1890 = "c",
          AREALAND_1890 = "n", AREAWATER_1890 = "n",
          BLOCK_PART_FLAG_O = "c", AREALAND_INT = "n", AREAWATER_INT = "n")
    )
    expect_equal(
        build_spec_for_vintage(DECENNIAL_TABULATION_CROSSWALK, 1980, FALSE),
        c(STATE_1980 = "c", COUNTY_1980 = "c", TRACT_1980 = "c", BLK_1980 = "c", BLKSF_1980 = "c",
          AREALAND_1980 = "n", AREAWATER_1980 = "n",
          BLOCK_PART_FLAG_R = "c", AREALAND_INT = "n", AREAWATER_INT = "n")
    )

})

test_that("building proceeds correctly from a single vintage input", {
    expect_equal(
        crosswalk_spec(1900L),
        c(STATE_1890 = "c", COUNTY_1890 = "c", TRACT_1890 = "c", BLK_1890 = "c", BLOCK_PART_FLAG_O = "c",
          STATE_1900 = "c", COUNTY_1900 = "c", TRACT_1900 = "c", BLK_1900 = "c", BLOCK_PART_FLAG_R = "c")
    )

    expect_equal(
        crosswalk_spec(2900L),
        c(STATE_2890 = "c", COUNTY_2890 = "c", TRACT_2890 = "c", BLK_2890 = "c", BLKSF_2890 = "c",
          AREALAND_2890 = "n", AREAWATER_2890 = "n", BLOCK_PART_FLAG_O = "c",
          STATE_2900 = "c", COUNTY_2900 = "c", TRACT_2900 = "c", BLK_2900 = "c", BLKSF_2900 = "c",
          AREALAND_2900 = "n", AREAWATER_2900 = "n", BLOCK_PART_FLAG_R = "c",
          AREALAND_INT = "n", AREAWATER_INT = "n")
    )

})

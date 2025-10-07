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

test_that("fewer fields are built for earlier censuses", {
    .xwalk <- DECENNIAL_TABULATION_CROSSWALK |>
        dplyr::filter(
            .data$`Pre 2000`
        )

    expect_equal(
        build_fields_for_vintage(.xwalk, 1900, TRUE),
        c("STATE_1890", "COUNTY_1890", "TRACT_1890", "BLK_1890", "BLOCK_PART_FLAG_O")
    )

    expect_equal(
        build_fields_for_vintage(.xwalk, 1980, FALSE),
        c("STATE_1980", "COUNTY_1980", "TRACT_1980", "BLK_1980", "BLOCK_PART_FLAG_R")
    )

})

test_that("more fields are built for later censuses", {

    expect_equal(
        build_fields_for_vintage(DECENNIAL_TABULATION_CROSSWALK, 1900, TRUE),
        c("STATE_1890", "COUNTY_1890", "TRACT_1890", "BLK_1890", "BLKSF_1890", "AREALAND_1890", "AREAWATER_1890", "BLOCK_PART_FLAG_O", "AREALAND_INT", "AREAWATER_INT")
    )
    expect_equal(
        build_fields_for_vintage(DECENNIAL_TABULATION_CROSSWALK, 1980, FALSE),
        c("STATE_1980", "COUNTY_1980", "TRACT_1980", "BLK_1980", "BLKSF_1980", "AREALAND_1980", "AREAWATER_1980", "BLOCK_PART_FLAG_R", "AREALAND_INT", "AREAWATER_INT")
    )

})

test_that("building proceeds correctly from a single vintage input", {
    expect_equal(
        crosswalk_field_names(1900L),
        c("STATE_1890", "COUNTY_1890", "TRACT_1890", "BLK_1890", "BLOCK_PART_FLAG_O",
          "STATE_1900", "COUNTY_1900", "TRACT_1900", "BLK_1900", "BLOCK_PART_FLAG_R")
    )

    expect_equal(
        crosswalk_field_names(2900L),
        c("STATE_2890", "COUNTY_2890", "TRACT_2890", "BLK_2890", "BLKSF_2890",
          "AREALAND_2890", "AREAWATER_2890", "BLOCK_PART_FLAG_O",
          "STATE_2900", "COUNTY_2900", "TRACT_2900", "BLK_2900", "BLKSF_2900",
          "AREALAND_2900", "AREAWATER_2900", "BLOCK_PART_FLAG_R",
          "AREALAND_INT", "AREAWATER_INT")
    )

})

test_that("years are correct", {
    expect_equal(tiger_name_for(1L, 2000L, "tract"),
                 "tl_2010_01_tract00")
})

test_that("endings are correct", {
    expect_equal(tiger_name_for(19L, 2010L, "tract"),
                 "tl_2010_19_tract10")
    expect_equal(tiger_name_for(22L, 2020L, "tract"),
                 "tl_2020_22_tract")
})

test_that("blocks always end in two digits", {
    expect_equal(tiger_name_for(42L, 1990L, "block"),
                 "tl_1990_42_tabblock90")
    expect_equal(tiger_name_for(1L, 2010L, "block"),
                 "tl_2010_01_tabblock10")
    expect_equal(tiger_name_for(30L, 2020L, "block"),
                 "tl_2020_30_tabblock20")
})

test_that("examples work", {
    expect_equal(tiger_name_for(55L, 2000L, "county subunit"),
                 "tl_2010_55_cousub00")
    expect_equal(tiger_name_for(25L, 2010L, "school district"),
                 "tl_2010_25_unsd10")
    expect_equal(tiger_name_for(10L, 2020L, "place"),
                 "tl_2020_10_place")
    expect_equal(tiger_name_for(2L, 2020L, "block"),
                 "tl_2020_02_tabblock20")

})

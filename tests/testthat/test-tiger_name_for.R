test_that("defaults work for tiger names", {
  expect_equal(tiger_name_for(55L, 2000L),
               "tl_2000_55_cousub00")
})

test_that("endings are correct", {
    expect_equal(tiger_name_for(19L, 2000L, "tracts"),
                 "tl_2000_19_tract00")
    expect_equal(tiger_name_for(22L, 2020L, "tracts"),
                 "tl_2020_22_tract")
})

test_that("blocks always end in two digits", {
    expect_equal(tiger_name_for(42L, 1990L, "blocks"),
                 "tl_1990_42_tabblock90")
    expect_equal(tiger_name_for(1L, 2010L, "blocks"),
                 "tl_2010_01_tabblock10")
    expect_equal(tiger_name_for(30L, 2020L, "blocks"),
                 "tl_2020_30_tabblock20")
})


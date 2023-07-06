test_that("block GEOIDs yield tract Ids", {
    GEOIDS <- c("551010009041008",
                "551010009001008",
                "551010017021010",
                "551010017001010",
                "551010024022045",
                "551010024002045")
    YEARS <- rep(c(2000,
                   2010,
                   2020),
                 each = 2)
    tracts <- geoid_to_tract_id(GEOIDS, YEARS)
  expect_equal(tracts,
               c("000904",
                 "0009",
                 "001702",
                 "001700",
                 "002402",
                 "002400"))
})

test_that("block group GEOIDs yield tract Ids", {
    GEOIDS <- c("551010017034",
                "551010017004",
                "551010005015",
                "551010005005",
                "551010005014",
                "551010005004")
    YEARS <- rep(c(2000,
                   2010,
                   2020),
                 each = 2)
    tracts <- geoid_to_tract_id(GEOIDS, YEARS)
    expect_equal(tracts,
                 c("001703",
                   "0017",
                   "000501",
                   "000500",
                   "000501",
                   "000500"))
})

test_that("tract GEOIDs yield tract Ids", {
    GEOIDS <- rep(c("55101001202",
                    "55101000800",
                    "55101980000"),
                  3)
    YEARS <- rep(c(2000,
                   2010,
                   2020),
                 each = 3)
    tracts <- geoid_to_tract_id(GEOIDS, YEARS)
    expect_equal(tracts,
                 c("001202",
                   "0008",
                   "9800",
                   "001202",
                   "000800",
                   "980000",
                   "001202",
                   "000800",
                   "980000"))
})

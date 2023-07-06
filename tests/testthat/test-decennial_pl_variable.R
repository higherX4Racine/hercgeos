test_that("decennial pl variables match the format for their vintage", {
  Layout <- tidyr::expand_grid(
      .year = 2000L + 10L * 0L:2L,
      .table = c(2L, 4L),
      .index = c(1L, 10L)
  )
  variables <- purrr::pmap_chr(Layout, decennial_pl_variable)

  expect_equal(
      variables,
      c(
          "PL002001",
          "PL002010",
          "PL004001",
          "PL004010",
          "P002001",
          "P002010",
          "P004001",
          "P004010",
          "P2_001N",
          "P2_010N",
          "P4_001N",
          "P4_010N"
      )
  )
})

test_that("decennial_pl_variable rejects illegal years", {
    expect_snapshot(
        decennial_pl_variable(2005, 1, 1),
        error = TRUE,
        cnd_class = TRUE
    )
})

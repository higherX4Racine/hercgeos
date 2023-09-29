#' @keywords internal
"_PACKAGE"

utils::globalVariables(c(
    ".data"
))

## usethis namespace: start
#' @importFrom cli cli_abort
#' @importFrom dplyr across
#' @importFrom dplyr case_when
#' @importFrom dplyr coalesce
#' @importFrom dplyr filter
#' @importFrom dplyr if_else
#' @importFrom dplyr mutate
#' @importFrom dplyr pick
#' @importFrom dplyr rename_with
#' @importFrom dplyr select
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_sf
#' @importFrom ggplot2 rel
#' @importFrom ggplot2 scale_fill_manual
#' @importFrom ggplot2 theme_minimal
#' @importFrom glue glue
#' @importFrom knitr kable
#' @importFrom purrr discard_at
#' @importFrom purrr imap
#' @importFrom purrr list_rbind
#' @importFrom purrr map
#' @importFrom purrr pmap_chr
#' @importFrom readr parse_number
#' @importFrom rlang abort
#' @importFrom rlang set_names
#' @importFrom sf read_sf
#' @importFrom sf st_as_sf
#' @importFrom sf st_crs
#' @importFrom sf st_drop_geometry
#' @importFrom sf st_set_agr
#' @importFrom sf st_transform
#' @importFrom stats median
#' @importFrom stringr str_remove
#' @importFrom stringr str_sub
#' @importFrom tibble enframe
#' @importFrom tibble tibble
#' @importFrom tibble tribble
#' @importFrom tidyr expand_grid
#' @importFrom tidyselect contains
#' @importFrom tidyselect everything
#' @importFrom tidyselect starts_with
## usethis namespace: end
NULL

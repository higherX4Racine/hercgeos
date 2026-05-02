# Plot census blocks by water or land use

Plot census blocks by water or land use

## Usage

``` r
geom_terrain(.blocks, .line_color = "#cccccc66", .scale_name = NULL)
```

## Arguments

- .blocks:

  a simple features table from the Census TIGER/Line database

- .line_color:

  optional, the color for block borders, defaults to light gray

- .scale_name:

  optional, a title for the fill scale, defaults to empty

## Value

an list of
[`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html)
commands, suitable for chaining

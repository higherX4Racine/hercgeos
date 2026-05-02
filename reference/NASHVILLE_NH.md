# Two 2020 Census tracts from the northern part of Nashua, NH.

The northern part of the city of Nashua, NH briefly seceded and become
its own town, Nashville. These tracts are roughly in that area. This set
of simple features was created by filtering, but otherwise not changing,
a file with every 2020 Census tract in New Hampshire.

## Usage

``` r
NASHVILLE_NH
```

## Format

`NASHVILLE_NH` A list of three tibbles of simple features

**blocks** : All census blocks within the `tracts`.

**tracts** : Tracts "33011010400" and "33011010500" from the 2020 US
Census.

**historic_district** : The registered national historic place that once
was Nashville, NH.

For `blocks` and `tracts`, the columns are verbatim what you find in
freshly-downloaded TIGER/Line shapefiles. For `historic_district`, the
columns are "RESNAME", "SRC_DAT", and "NR_PROP"

## Source

The National Register of Historic Places' database of shapefiles:
<https://irma.nps.gov/DataStore/Reference/Profile/2210280>

The US Censu Bureau's TIGER/Line shapefile database:
<https://www.census.gov/cgi-bin/geo/shapefiles/index.php>

# Package index

## Example data sets

Small collections of, for example, shapefiles that are useful for
testing or demonstrating the features of the package.

- [`NASHVILLE_NH`](https://higherx4racine.github.io/hercgeos/reference/NASHVILLE_NH.md)
  : Two 2020 Census tracts from the northern part of Nashua, NH.

- [`UNIT_PENTAGON`](https://higherx4racine.github.io/hercgeos/reference/unit_pentagon.md)
  :

  An `sfc` object that is a five-sided polygon with area 1.

## Metadata

Descriptions of the layout of data from TIGER/Line or other sources, as
well as various defaults, like colors for maps of terrain.

- [`DECENNIAL_POPULATION_VARIABLE_FORMATS`](https://higherx4racine.github.io/hercgeos/reference/DECENNIAL_POPULATION_VARIABLE_FORMATS.md)
  : Formats for decennial census variables of overall population.
- [`DECENNIAL_TABULATION_CROSSWALK`](https://higherx4racine.github.io/hercgeos/reference/DECENNIAL_TABULATION_CROSSWALK.md)
  : The layout for a crosswalk of tabulation blocks between decennial
  censuses
- [`TERRAIN_COLORS`](https://higherx4racine.github.io/hercgeos/reference/TERRAIN_COLORS.md)
  : A named character vector of hex-encoded colors for water, developed
  and undeveloped land.
- [`TIGER_ATTRIBUTES`](https://higherx4racine.github.io/hercgeos/reference/TIGER_ATTRIBUTES.md)
  : A named character vector of shapefile attributes for data from
  TIGER/Line

## Terrain

Categorize or display terrain, e.g. urban vs. rural, land vs. water

- [`geom_terrain()`](https://higherx4racine.github.io/hercgeos/reference/geom_terrain.md)
  : Plot census blocks by water or land use
- [`is_water()`](https://higherx4racine.github.io/hercgeos/reference/is_water.md)
  : Identify geographies that are all water
- [`terrain_factor()`](https://higherx4racine.github.io/hercgeos/reference/terrain_factor.md)
  : Create a factor of terrains based on census reporting of water area
  and land use.

## TIGER/Line functions

Read shapefiles that have been downloaded from the US Census Bureau’s
TIGER/Line shapefile database.

- [`fix_latlong_to_numeric()`](https://higherx4racine.github.io/hercgeos/reference/fix_latlong_to_numeric.md)
  : Convert interpreted latitude and longitude from text to numbers
- [`fix_names_by_coalescing()`](https://higherx4racine.github.io/hercgeos/reference/fix_names_by_coalescing.md)
  : Coalesce NAME and NAMELSAD fields to fix blank NAME entries
- [`fix_old_geoids()`](https://higherx4racine.github.io/hercgeos/reference/fix_old_geoids.md)
  : Replace ID fields with "GEOID"
- [`fix_old_year_suffixes()`](https://higherx4racine.github.io/hercgeos/reference/fix_old_year_suffixes.md)
  : Remove year numbers from the end of field names
- [`geoid_to_tract_id()`](https://higherx4racine.github.io/hercgeos/reference/geoid_to_tract_id.md)
  : Extract the 4- or 6-digit tract codes from full census GEOID values
- [`batch_read_tigershapes()`](https://higherx4racine.github.io/hercgeos/reference/batch_read_tigershapes.md)
  : Load geographies from many shapefiles into a tibble of simple
  features
- [`read_tigershapes()`](https://higherx4racine.github.io/hercgeos/reference/read_tigershapes.md)
  : Import data from US Census TIGER/Line shapefiles
- [`transform_tiger_to_utm()`](https://higherx4racine.github.io/hercgeos/reference/transform_tiger_to_utm.md)
  : Transform native TIGER/Line lat-long features to UTM features
- [`tiger_name_for()`](https://higherx4racine.github.io/hercgeos/reference/tiger_name_for.md)
  : Create a tigershape filename based upon state, year, and geography

## Decennial census functions

A major use-case for this package is to map American Community Survey
data from tracts to more concrete, real-world geographical places. One
way to do this is to use block populations from each decennial census.

- [`decennial_pl_variable()`](https://higherx4racine.github.io/hercgeos/reference/decennial_pl_variable.md)
  : Variable names for PL tables, per the idiosyncrasies of decennial
  censuses
- [`truncate_decennial_tract_codes()`](https://higherx4racine.github.io/hercgeos/reference/truncate_decennial_tract_codes.md)
  : Lop off trailing "00"s from census tract codes from 2000.
- [`crosswalk_spec()`](https://higherx4racine.github.io/hercgeos/reference/crosswalk_spec.md)
  : Compute the names of the columns in a tabulation crosswalk table
- [`read_crosswalk()`](https://higherx4racine.github.io/hercgeos/reference/read_crosswalk.md)
  : Read a file with crosswalk information between the blocks of two
  consecutive decennial censuses.
- [`perform_crosswalk()`](https://higherx4racine.github.io/hercgeos/reference/perform_crosswalk.md)
  : Join the blocks from consecutive decennial censuses by their
  crosswalks

## Geometric operations

Specialized functions that generally build upon more modularly-designed
functions from the [simple
features](https://higherx4racine.github.io/hercgeos/reference/%60sf%60)
package.

- [`geometry_filter()`](https://higherx4racine.github.io/hercgeos/reference/geometry_filter.md)
  : Filter one or more geometries by a reference geometry using a single
  geometric predicate.
- [`central_utm()`](https://higherx4racine.github.io/hercgeos/reference/central_utm.md)
  : Find the median UTM Zone from a vector of longitudes.
- [`utm_crs()`](https://higherx4racine.github.io/hercgeos/reference/utm_crs.md)
  : Create a coordinate reference system for a UTM Zone and datum.
- [`utm_zone_from_longitude()`](https://higherx4racine.github.io/hercgeos/reference/utm_zone_from_longitude.md)
  : Identify the UTM Zone that corresponds to a longitude

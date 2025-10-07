# multiple 'IDFP' columns cause a problem

    Code
      fix_old_geoids(tibble::tibble(GEOIDFP = NA, alllowerIDFP = NA, noIDFP = NA))
    Condition
      Error in `dplyr::rename_with()`:
      ! Names must be unique.
      x These names are duplicated:
        * "GEOID" at locations 1, 2, and 3.


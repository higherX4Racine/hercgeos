# multiple 'IDFP' columns cause a problem

    Code
      fix_old_geoids(tibble::tibble(GEOIDFP = NA, alllowerIDFP = NA, noIDFP = NA))
    Error <vctrs_error_names_must_be_unique>
      Names must be unique.
      x These names are duplicated:
        * "GEOID" at locations 1, 2, and 3.


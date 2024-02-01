## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
example_asset <- tempfile()
file.create(example_asset)

## -----------------------------------------------------------------------------
library(unifir)
script <- make_script(
  project = file.path(tempdir(), "unifir"),
  unity = waiver() # Makes it so make_script won't error if it can't find Unity
)

script <- import_asset(script, example_asset)

## -----------------------------------------------------------------------------
script <- instantiate_prefab(script,
                             prefab_path = file.path("Assets", 
                                                     basename(example_asset)))

## -----------------------------------------------------------------------------
if (interactive()) {
  script <- add_default_player(script)
  script <- add_default_tree(script, "tree_1")
}


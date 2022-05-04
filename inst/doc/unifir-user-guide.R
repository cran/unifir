## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
#  library(unifir)
#  find_unity()

## ----eval = FALSE-------------------------------------------------------------
#  script <- make_script(
#    project = file.path(tempdir(), "unifir")
#  )

## ----eval = FALSE-------------------------------------------------------------
#  script <- add_default_player(script)

## ----eval = FALSE-------------------------------------------------------------
#  script <- save_scene(script)

## ----eval=FALSE---------------------------------------------------------------
#  script <- set_active_scene(script)

## ----eval = FALSE-------------------------------------------------------------
#  action(script)

## ----eval = FALSE-------------------------------------------------------------
#  tree_script <- make_script(
#    project = file.path(tempdir(), "unifir", "random_trees")
#  )

## ----eval = FALSE-------------------------------------------------------------
#  library(terra)

## ----eval = FALSE-------------------------------------------------------------
#  library(terrainr)

## ----eval = FALSE-------------------------------------------------------------
#  terrain_size <- 4097
#  r <- terra::rast(
#    matrix(rnorm(terrain_size^2, 0, 0.2), terrain_size),
#    extent = terra::ext(0, terrain_size, 0, terrain_size)
#  )
#  
#  raster_file <- tempfile(fileext = ".tiff")
#  terra::writeRaster(r, raster_file)
#  
#  # I'm quieting the warnings down here, because they can be safely ignored:
#  raster_file <- suppressWarnings(
#    terrainr::transform_elevation(raster_file,
#                                  side_length = terrain_size,
#                                  output_prefix = tempfile())
#  )

## ----eval = FALSE-------------------------------------------------------------
#  tree_script <- create_terrain(
#    script = tree_script, # Our unifir_script
#    heightmap_path = raster_file, # The file path to our elevation raster
#    # Where should the "top-left" corner of the terrain sit?
#    # Note that Unity uses a left-handed Y-up coordinate system
#    # where Y is the vertical axis and X and Z define the "horizontal" plane.
#    # We want our terrain to center on the origin of the scene (that is, 0,0,0)
#    # so we'll set both to -2,050:
#    x_pos = -2050,
#    z_pos = -2050,
#    width = terrain_size, # The total width of the terrain tile (X axis)
#    length = terrain_size, # The total length of the terrain tile (Z axis)
#    height = as.numeric(terra::global(r, max)), # Max height of the terrain (Y axis)
#    # How many pixels are there in the raster along the total width/length?
#    heightmap_resolution = terrain_size
#  )

## ---- eval = FALSE------------------------------------------------------------
#  num_trees <- 100
#  pos <- data.frame(
#    x = runif(num_trees, -40, 40),
#    z = runif(num_trees, -40, 40)
#  )

## ----eval=FALSE---------------------------------------------------------------
#  tree_script <- add_default_tree(
#    tree_script,
#    "tree_1",
#    x_position = pos$x,
#    z_position = pos$z,
#    y_position = 0 # The average height of the terrain
#  )

## ----eval=FALSE---------------------------------------------------------------
#  tree_script <- add_default_player(tree_script)

## ----eval=FALSE---------------------------------------------------------------
#  tree_script <- add_light(tree_script)

## ----eval=FALSE---------------------------------------------------------------
#  tree_script <- tree_script |>
#    save_scene(scene_name = "trees") |>
#    set_active_scene(scene_name = "trees")

## ----eval=FALSE---------------------------------------------------------------
#  action(tree_script)

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("random_trees.png")


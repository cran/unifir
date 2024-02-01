## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
#  library(unifir)
#  make_script("example")

## ----echo = FALSE-------------------------------------------------------------
library(unifir)

## -----------------------------------------------------------------------------
waiver()

## -----------------------------------------------------------------------------
script <- make_script(
  project = file.path(tempdir(), "unifir"),
  unity = waiver() # Don't error if we can't find Unity
)
script

## -----------------------------------------------------------------------------
names(script)

## -----------------------------------------------------------------------------
all(
  is.null(script$initialize_project),
  is.null(script$scene_name),
  is.null(script$script_name)
)

## -----------------------------------------------------------------------------
prop_file <- tempfile()
file.create(prop_file)

prop <- unifir_prop(
  prop_file = prop_file,
  method_name = "ExampleName",
  method_type = "ExampleMethod",
  build = function(script, prop, debug) {},
  using = "ExampleDependencies",
  parameters = list()
)
prop

## -----------------------------------------------------------------------------
names(prop)

## -----------------------------------------------------------------------------
new_scene

## -----------------------------------------------------------------------------
readLines(system.file("NewScene.cs", package = "unifir"))

## -----------------------------------------------------------------------------
script <- new_scene(script)

script$props[[1]]$build(script, script$props[[1]])

## -----------------------------------------------------------------------------
add_prop

## -----------------------------------------------------------------------------
script$beats

## -----------------------------------------------------------------------------
script <- make_script(
  project = file.path(tempdir(), "unifir"),
  unity = waiver(), # Don't error if we can't find Unity
  initialize_project = FALSE, # Don't create the project -- so this runs on CRAN
  script_name = "example_script"
)
script <- new_scene(script)
exec_script <- action(
  script,
  exec = FALSE,
  write = TRUE
)

## -----------------------------------------------------------------------------
exec_script$props

## -----------------------------------------------------------------------------
readLines(
  file.path(tempdir(), "unifir", "Assets", "Editor", "example_script.cs")
  )

## ----eval=FALSE---------------------------------------------------------------
#  function() {
#    debug <- FALSE
#    if (Sys.getenv("unifir_debugmode") != "" ||
#        !is.null(options("unifir_debugmode")$unifir_debugmode)) {
#      debug <- TRUE
#    }
#    debug
#  }

## -----------------------------------------------------------------------------
x <- 2
x

## -----------------------------------------------------------------------------
y <- x
y == x

## -----------------------------------------------------------------------------
x <- 1
y == x

## -----------------------------------------------------------------------------
other_prop <- prop
other_prop$method_name <- "NewName"
prop$method_name

## -----------------------------------------------------------------------------
prop$method_name <- "AnotherName"
other_prop$method_name

## -----------------------------------------------------------------------------
disconnected_prop <- prop$clone()

## -----------------------------------------------------------------------------
disconnected_prop$method_name <- "OnlyIGetThisName"
prop$method_name


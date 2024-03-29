% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_terrain.R
\name{create_terrain}
\alias{create_terrain}
\title{Create a terrain tile with optional image overlay}
\usage{
create_terrain(
  script,
  method_name = NULL,
  heightmap_path,
  x_pos,
  z_pos,
  width,
  height,
  length,
  heightmap_resolution,
  texture_path = "",
  exec = TRUE
)
}
\arguments{
\item{script}{A \code{unifir_script} object, created by \link{make_script} or returned
by an \verb{add_prop_*} function.}

\item{method_name}{The internal name to use for the C# method created. Will
be randomly generated if not set.}

\item{heightmap_path}{The file path to the heightmap to import as terrain.}

\item{x_pos, z_pos}{The position of the corner of the terrain.}

\item{width, height, length}{The dimensions of the terrain tile,
in linear units.}

\item{heightmap_resolution}{The resolution of the heightmap image.}

\item{texture_path}{Optional: the file path to the image to use as a terrain
overlay.}

\item{exec}{Logical: Should the C# method be included in the set executed by
MainFunc?}
}
\description{
Create a terrain tile with optional image overlay
}
\examples{
if (requireNamespace("terra", quietly = TRUE)) {
  raster <- tempfile(fileext = ".tiff")
  r <- terra::rast(matrix(rnorm(1000^2, mean = 100, sd = 20), 1000),
    extent = terra::ext(0, 1000, 0, 1000)
  )
  terra::writeRaster(r, raster)

  script <- make_script("example_script",
    unity = waiver()
  )
  create_terrain(
    script,
    heightmap_path = raster,
    x_pos = 0,
    z_pos = 0,
    width = 1000,
    height = terra::minmax(r)[[2]],
    length = 1000,
    heightmap_resolution = 1000
  )
}
}
\seealso{
Other props: 
\code{\link{add_default_player}()},
\code{\link{add_light}()},
\code{\link{add_prop}()},
\code{\link{add_texture}()},
\code{\link{import_asset}()},
\code{\link{instantiate_prefab}()},
\code{\link{load_png}()},
\code{\link{load_scene}()},
\code{\link{new_scene}()},
\code{\link{read_raw}()},
\code{\link{save_scene}()},
\code{\link{set_active_scene}()},
\code{\link{validate_path}()}
}
\concept{props}

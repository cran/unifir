% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_raw.R
\name{read_raw}
\alias{read_raw}
\title{Read a RAW file in as a float array}
\usage{
read_raw(script, method_name = NULL, exec = FALSE)
}
\arguments{
\item{script}{A \code{unifir_script} object, created by \link{make_script} or returned
by an \verb{add_prop_*} function.}

\item{method_name}{The internal name to use for the C# method created. Will
be randomly generated if not set.}

\item{exec}{Logical: Should the C# method be included in the set executed by
MainFunc?}
}
\description{
This function adds a helper method, \code{ReadRaw}, to the
C# script. This function is typically used to bring in
heightmaps into a Unity scene, for instance by functions
like \link{create_terrain}. It requires some arguments be provided
at the C# level, and so is almost always called with \code{exec = FALSE}.
}
\examples{
# First, create a script object.
# CRAN doesn't have Unity installed, so pass
# a waiver object to skip the Unity-lookup stage:
script <- make_script("example_script", unity = waiver())

# Now add props:
script <- read_raw(script)

# Lastly, execute the script via the `action` function
}
\seealso{
Other props: 
\code{\link{add_default_player}()},
\code{\link{add_light}()},
\code{\link{add_prop}()},
\code{\link{add_texture}()},
\code{\link{create_terrain}()},
\code{\link{import_asset}()},
\code{\link{instantiate_prefab}()},
\code{\link{load_png}()},
\code{\link{load_scene}()},
\code{\link{new_scene}()},
\code{\link{save_scene}()},
\code{\link{set_active_scene}()},
\code{\link{validate_path}()}

Other utilities: 
\code{\link{add_default_player}()},
\code{\link{add_prop}()},
\code{\link{create_unity_project}()},
\code{\link{find_unity}()},
\code{\link{get_asset}()},
\code{\link{load_png}()},
\code{\link{load_scene}()},
\code{\link{new_scene}()},
\code{\link{save_scene}()},
\code{\link{set_active_scene}()},
\code{\link{validate_path}()},
\code{\link{waiver}()}
}
\concept{props}
\concept{utilities}

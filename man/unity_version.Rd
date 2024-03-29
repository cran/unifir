% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{unity_version}
\alias{unity_version}
\title{Print the version of the Unity Editor in use.}
\usage{
unity_version(unity = NULL)
}
\arguments{
\item{unity}{The path to the Unity executable on your system (importantly,
\emph{not} the UnityHub executable). If \code{NULL}, checks to see if the environment
variable or option \code{unifir_unity_path} is set; if so, uses that path
(preferring the environment variable over the option if the two disagree).}
}
\value{
A character vector of length 1
containing the version of Unity in use.
}
\description{
Print the version of the Unity Editor in use.
}
\examples{
try(
  unity_version()
)

}

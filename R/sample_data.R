#' Sample 3D Motion Capture Data for Chest Expansion Analysis
#'
#' This dataset contains 3D marker coordinate data collected from motion capture
#' systems for chest expansion analysis. It includes 2309 time frames and 31 markers.
#' Each marker has three coordinates: X, Y, and Z, representing its position in 3D space.
#'
#' @format A data frame with 2309 rows and 93 variables (31 markers, each with X, Y, Z coordinates):
#' \describe{
#'   \item{M01 X}{X-coordinate of marker M01}
#'   \item{M01 Y}{Y-coordinate of marker M01}
#'   \item{M01 Z}{Z-coordinate of marker M01}
#'   \item{M02 X}{X-coordinate of marker M02}
#'   \item{M02 Y}{Y-coordinate of marker M02}
#'   \item{M02 Z}{Z-coordinate of marker M02}
#'   \item{...}{Additional markers (up to M31), each with X, Y, Z coordinates}
#' }
#' @details This dataset can be used to analyze chest expansion and calculate
#' the volume of chest segments using convex hull methods. The markers are
#' placed around the chest, and the data tracks the chest wall motion over time.
#'
#' @source Collected using motion capture technology (e.g., Vicon system) for chest expansion studies.
#'
#' @examples
#' data(sample_data)
#' head(sample_data)
"sample_data"

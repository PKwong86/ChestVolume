#' Calculate Convex Hull Volume
#'
#' Calculates the volume of a convex hull formed by a set of 3D points.
#'
#' @param points A data frame or matrix with columns 'X', 'Y', and 'Z' representing point coordinates.
#'
#' @return Numeric value representing the volume of the convex hull.
#' @import geometry
#' @export
calculate_convex_hull_volume <- function(points) {
  hull <- geometry::convhulln(points, options = "FA")
  volume <- hull$vol
  return(volume)
}

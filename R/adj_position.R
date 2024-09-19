#' Adjust Marker Positions Towards Center
#'
#' Adjusts the position of markers by moving them towards the center by a specified distance.
#'
#' @param marker_coords Numeric vector of length 3 representing the marker coordinates (X, Y, Z).
#' @param center_coords Numeric vector of length 3 representing the center coordinates (X, Y, Z).
#' @param distance Numeric value indicating the distance to adjust towards the center (default is 1 cm).
#'
#' @return A numeric vector of length 3 representing the adjusted marker coordinates.
#' @export
adj_position <- function(marker_coords, center_coords, distance = 1) {
  direction_vector <- center_coords - marker_coords
  norm <- sqrt(sum(direction_vector ^ 2))
  unit_vector <- direction_vector / norm
  adjusted_coords <- marker_coords + distance * unit_vector
  return(adjusted_coords)
}

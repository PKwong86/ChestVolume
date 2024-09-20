#' Adjust Marker Positions Towards Center
#'
#' Adjusts the positions of markers by moving them towards the average center position by a specified distance.
#' This accounts for marker protrusion from the skin surface.
#'
#' @param markers_matrix A numeric matrix or data frame where each row represents a marker's coordinates (X, Y, Z).
#' @param distance Numeric value indicating the distance to adjust towards the center (default is 1 cm).
#'
#' @return A numeric matrix of the same dimensions as `markers_matrix`, containing the adjusted marker coordinates.
#' @details The function calculates the average center position of all markers and moves each marker towards the center
#' by the specified distance along the line connecting the marker to the center.
#'
#' @examples
#' # Original marker coordinates (3 markers)
#' markers <- matrix(c(10, 15, 20,
#'                     12, 18, 24,
#'                     14, 21, 28), ncol = 3, byrow = TRUE)
#' colnames(markers) <- c("X", "Y", "Z")
#'
#' # Adjust marker positions
#' adjusted_markers <- adj_position(markers, distance = 1)
#' print(adjusted_markers)
#'
#' @export
adj_position <- function(markers_matrix, distance = 1) {
  # Calculate the center (average position) of all markers
  center_coords <- colMeans(markers_matrix)

  # Function to adjust a single marker
  adjust_marker <- function(marker_coords) {
    direction_vector <- center_coords - marker_coords
    norm <- sqrt(sum(direction_vector ^ 2))
    unit_vector <- direction_vector / norm
    adjusted_coords <- marker_coords + distance * unit_vector
    return(adjusted_coords)
  }

  # Apply the adjustment to all markers
  adjusted_markers <- t(apply(markers_matrix, 1, adjust_marker))

  # Ensure the adjusted markers have the same column names
  colnames(adjusted_markers) <- colnames(markers_matrix)
  return(adjusted_markers)
}

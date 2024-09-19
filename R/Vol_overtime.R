#' Calculate Segment Volumes Over Time
#'
#' Calculates the volumes of specified segments over time using convex hulls.
#'
#' @param data A data frame containing marker coordinates over time.
#' @param segments A list of numeric vectors, each containing indices of markers defining a segment.
#' @param adjust_markers Logical value indicating whether to adjust markers for protrusion (default is TRUE).
#' @param adjustment_distance Numeric value for marker adjustment distance (default is 1 cm).
#'
#' @return A list of numeric vectors, each containing volumes for a segment over time.
#' @import geometry
#' @export
calculate_segment_volumes <- function(data, segments, adjust_markers = TRUE, adjustment_distance = 1) {
  n_frames <- nrow(data)
  n_markers <- ncol(data) / 3
  volumes_list <- vector("list", length(segments))

  for (h in seq_along(segments)) {
    volumes <- numeric(n_frames)
    segment_indices <- segments[[h]]

    for (k in 1:n_frames) {
      # Extract marker coordinates for the frame
      marker_coords <- matrix(unlist(data[k, ]), ncol = 3, byrow = TRUE)
      colnames(marker_coords) <- c("X", "Y", "Z")

      # Adjust marker positions if necessary
      if (adjust_markers) {
        center_coords <- colMeans(marker_coords)
        adjusted_coords <- t(apply(marker_coords, 1, adj_position, center_coords = center_coords, distance = adjustment_distance))
      } else {
        adjusted_coords <- marker_coords
      }

      # Select segment markers
      segment_coords <- adjusted_coords[segment_indices, ]

      # Calculate convex hull volume
      volumes[k] <- calculate_convex_hull_volume(segment_coords)
    }
    volumes_list[[h]] <- volumes
  }
  return(volumes_list)
}

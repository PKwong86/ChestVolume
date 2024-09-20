#' Calculate Segment Volumes Over Time with Unit Conversion
#'
#' Calculates the volumes of specified segments over time using convex hulls, with an option to convert coordinate units.
#'
#' @param data A data frame containing adjusted marker coordinates, with columns 'Timeframe', 'Marker', 'X', 'Y', 'Z'.
#' @param segments A list of character vectors, each containing marker names defining a segment.
#' @param unit_conversion Numeric value used to convert the units of the coordinates (default is 0.1, converting mm to cm).
#'
#' @return A data frame with columns 'Timeframe', 'Segment', 'Volume'.
#' @details The function multiplies the coordinates by `unit_conversion` to convert units (e.g., from mm to cm) before calculating volumes.
#' @examples
#' # Define segments (e.g., quadrants of the chest)
#' segments <- list(
#'   UL = c("M01", "M02", "M03", "M04"),
#'   UR = c("M05", "M06", "M07", "M08")
#' )
#'
#' # Assume 'adjusted_data' is the data frame with adjusted marker positions
#' # Coordinates are in mm; we'll convert to cm by default
#' volumes_df <- calculate_segment_volumes(adjusted_data, segments)
#' head(volumes_df)
#'
#' # If coordinates are already in cm, set unit_conversion to 1
#' volumes_df_cm <- calculate_segment_volumes(adjusted_data, segments, unit_conversion = 1)
#'
#' @import dplyr
#' @import geometry
#' @export
calculate_segment_volumes <- function(data, segments, unit_conversion = 0.1) {
  # Load necessary packages
  library(dplyr)

  # Apply unit conversion to coordinates
  data <- data %>%
    mutate(
      X = X * unit_conversion,
      Y = Y * unit_conversion,
      Z = Z * unit_conversion
    )

  # Initialize a list to store volume data frames
  volume_list <- list()

  # Loop over each segment
  for (segment_name in names(segments)) {
    segment_markers <- segments[[segment_name]]

    # Filter data for the markers in this segment
    segment_data <- data %>%
      filter(Marker %in% segment_markers)

    # Calculate volumes for each timeframe
    segment_volumes <- segment_data %>%
      group_by(Timeframe) %>%
      do({
        df <- .
        coords <- as.matrix(df[, c("X", "Y", "Z")])

        # Handle cases where convex hull cannot be formed
        if (nrow(coords) >= 4) {
          hull <- geometry::convhulln(coords, options = "FA")
          volume <- hull$vol
        } else {
          volume <- NA  # Not enough points to form a convex hull in 3D
        }

        data.frame(Volume = volume)
      }) %>%
      ungroup() %>%
      mutate(Segment = segment_name)

    # Append to the list
    volume_list[[segment_name]] <- segment_volumes
  }

  # Combine all volume data frames
  volumes_df <- bind_rows(volume_list)

  # Reorder columns
  volumes_df <- volumes_df[, c("Timeframe", "Segment", "Volume")]

  # Arrange data
  volumes_df <- volumes_df %>%
    arrange(Timeframe, Segment)

  return(volumes_df)
}

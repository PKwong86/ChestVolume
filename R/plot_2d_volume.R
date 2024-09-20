#' Plot Volume Changes by Segment Over Time
#'
#' This function generates a ggplot to display the volume changes by segment over time.
#' It creates a line plot with each segment's volume on the y-axis and the timeframe on the x-axis.
#'
#' @param volume_data A data frame with volume measurements, one column per segment, and a "frame" column for time.
#' @param segment_names A vector of names for each segment (must match the column names in volume_data).
#' @param title Optional plot title.
#' @return A ggplot object showing volume changes by segment over time.
#' @import ggplot2
#' @import tidyr
#' @examples
#' # Example usage with random volume data
#' set.seed(123)
#' time_frames <- 1:100
#' volume_data <- data.frame(
#'   frame = time_frames,
#'   UL = runif(100, min = 100, max = 150),
#'   UR = runif(100, min = 120, max = 160),
#'   LL = runif(100, min = 90, max = 140),
#'   LR = runif(100, min = 110, max = 170)
#' )
#' segment_names <- c("UL", "UR", "LL", "LR")
#' plot_volume_change_by_segment(volume_data, segment_names)
#'
plot_2d_volume <- function(volume_data, segment_names, title = "Volume Change by Segment") {

  # Ensure 'frame' column is present
  if (!"Timeframe" %in% names(volume_data)) {
    stop("The 'volume_data' must contain a 'Timeframe' column for time points.")
  }

  # Ensure segment names match column names in volume_data
  if (!all(segment_names %in% colnames(volume_data))) {
    stop("All provided segment names must match column names in 'volume_data'.")
  }

  # Create the ggplot
  ggplot(volume_data, aes(x = Timeframe, y = Volume, color = Segment)) +
    geom_line(size = 1) +
    labs(x = "Timeframe", y = "Volume") +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
      axis.title = element_text(size = 12),
      axis.text = element_text(size = 10)
    )
}

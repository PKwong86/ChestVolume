% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_chest_3d.R
\name{plot_chest_3d}
\alias{plot_chest_3d}
\title{Plot 3D Chest Markers with Highlighted Segment and Convex Hull}
\usage{
plot_chest_3d(
  data,
  segments,
  selected_segment,
  timeframe = NULL,
  point_size = 5,
  highlight_color = "red",
  marker_color = "blue"
)
}
\arguments{
\item{data}{A data frame containing adjusted marker coordinates, with columns 'Timeframe', 'Marker', 'X', 'Y', 'Z'.
Coordinates should be in consistent units (e.g., centimeters).}

\item{segments}{A named list where each element is a character vector of marker names defining a segment.}

\item{selected_segment}{A character string specifying the name of the segment to highlight.}

\item{timeframe}{A numeric value indicating the timeframe to plot. If NULL, the first timeframe is used.}

\item{point_size}{Numeric value specifying the size of the markers in the plot (default is 5).}

\item{highlight_color}{Color to use for the highlighted segment markers and mesh (default is 'red').}

\item{marker_color}{Color to use for the non-highlighted markers (default is 'blue').}
}
\value{
A \code{plotly} object representing the 3D plot.
}
\description{
Generates a 3D plot of chest markers with the selected segment highlighted,
including the convex hull mesh of the selected segment.
}
\details{
The function plots all markers at the specified timeframe, highlighting the markers in the selected segment
and overlaying the convex hull mesh of the selected segment. The plot is interactive, allowing for rotation and zooming.
}
\examples{
# Example input data (replace with your actual data)
data(sample_data)
df<-process_marker_data(head(sample_data))
df_a <- adj_position(df)
# Define segments
segments <- list(
  UL = c("M01", "M02", "M03", "M04")
)
# Plot the 'UL' segment at timeframe 1
plot <- plot_chest_3d(df_a, segments, selected_segment = "UL", timeframe = 1)
# Display the plot
plot
}

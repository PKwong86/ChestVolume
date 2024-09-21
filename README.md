# ChestVolume: An R Package for Analyzing Chest Expansion Using 3D Coordinate Data

## Overview

**ChestVolume** is an R package designed for analyzing chest expansion using 3D marker coordinate data collected from motion capture systems. The package allows users to process marker data, adjust marker positions, calculate convex hull volumes of chest segments, and visualize chest movements in both 2D and 3D.

This tool is particularly useful for respiratory health research, enabling detailed assessments of chest expansion and identifying potential asymmetries in breathing patterns.

## Key Features

- **Process 3D Marker Data**: Automatically reshapes wide-format marker data into long format, making it easier to analyze.
- **Adjust Marker Positions**: Corrects the position of motion capture markers by moving them toward the chest surface.
- **Calculate Chest Volumes**: Uses convex hull geometry to calculate chest segment volumes over time.
- **2D and 3D Visualization**: Visualize chest expansion in 2D plots or interact with the chest model in 3D.
- **Shiny App**: A graphical interface to allow non-programmers to interact with the data and analyses.

## Installation

To install **ChestVolume** from GitHub, use the following commands:

```r
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
devtools::install_github("PKwong86/ChestVolumeAnalysis")
```

## Getting Started
Here is a quick example demonstrating how to use ChestVolumeAnalysis to process 3D marker data, adjust marker positions, and calculate chest segment volumes.




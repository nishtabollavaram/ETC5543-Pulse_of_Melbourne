# Pulse of Melbourne

**ETC5543 – Business Analytics Project**  
Monash University | 2026

**Team Members:** Richa Anghan, Zhuo Zhang and Nishta Bollavaram

**GitHub Repository:** [Pulse of Melbourne](https://github.com/nishtabollavaram/ETC5543-Pulse_of_Melbourne)

## Project Overview

*Pulse of Melbourne* investigates how pedestrian activity across Melbourne changes over time and location, and how events, public holidays and weather conditions are associated with unusual pedestrian movements.

**Research Question:** How do people use Melbourne across time and space, how have pedestrian activity patterns changed over the years, and how are these patterns associated with major events, weather conditions and other disruptions?

**Research Objectives:** The project investigates daily, weekly, monthly and seasonal pedestrian rhythms; long-term changes, including the COVID-19 period; spatial differences across the city; and unusual pedestrian activity associated with public holidays, events and weather conditions.

## Data Sources

The project uses:

- City of Melbourne Pedestrian Counting System (2009–2026)
- Pedestrian sensor location information
- City of Melbourne event permit records
- Historical weather data from Open-Meteo
- Victorian public holiday information

## Project Files

- `report_final.qmd` – Main Quarto report containing the analysis and R code.
- `report_final.html` – Rendered HTML report with visualisations.
- `Data_pedestrians/` – Data files used in the analysis.
- `Presentation/` – Presentation materials and supporting figures.
- `README.md` – Project description and reproducibility instructions.

## Analytical Methods

The project uses exploratory data analysis, temporal comparisons, data cleaning and validation, before-and-after COVID-19 comparisons, anomaly detection and K-means clustering.

## Software Requirements

The analysis was developed using R, RStudio and Quarto.

Key R packages include `tidyverse`, `lubridate`, `janitor`, `fs`, `httr2`, `here`, `plotly`, `leaflet`, `slider`, `cluster`, `data.table` and `kableExtra`.

## Reproducing the Report

1. Clone or download the GitHub repository.
2. Open the project in RStudio.
3. Install the required R packages.
4. Ensure the historical pedestrian snapshots and supplementary data files are available in the paths referenced by the report.
5. Open `report_final.qmd` and render it using:

   `quarto render report_final.qmd --to html`

**Note:** Some historical data files were supplied directly by the City of Melbourne and may require separate access. The report also uses locally stored weather and public holiday datasets.

## Main Findings

The analysis identified recurring daily, weekly and seasonal pedestrian patterns, a 28.5% reduction in median daily activity across consistently monitored sensors between the pre-pandemic and recent comparison periods, and associations between pedestrian activity, public holidays, rainfall and events.

The findings highlight the importance of understanding how pedestrian movement varies by time, location and external conditions when informing urban planning and transport decisions.
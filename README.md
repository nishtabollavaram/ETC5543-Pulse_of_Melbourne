# Pulse of Melbourne

**ETC5543 — Business Analytics Project | Monash University | 2026**  
**Team:** Richa Anghan, Zhuo Zhang and Nishta Bollavaram

**Project repository:** https://github.com/nishtabollavaram/ETC5543-Pulse_of_Melbourne

## Project Overview

*Pulse of Melbourne* investigates how people use central Melbourne across time and space. Using the City of Melbourne's Pedestrian Counting System, we examine hourly, daily, weekly, monthly and seasonal patterns, long-term changes surrounding COVID-19, unusual pedestrian activity, events, public holidays, rainfall and differences between monitoring locations.

**Research question:** How does pedestrian activity in Melbourne vary across time and location, how has it changed over the years, and what factors are associated with departures from its usual rhythms?

The report uses historical hourly records, recent City of Melbourne data and annual snapshots supplied by the City, with supporting event, weather, public-holiday and sensor-location data. The analysis is descriptive; associations with weather and events should not be interpreted as proof of causation.

## Main Findings

- Melbourne has recognisable daily, weekly and seasonal pedestrian rhythms, although activity differs between monitored locations.
- Across **27 consistently monitored locations**, the pooled median daily pedestrian count was **28.5% lower in 2023–2025 than in 2017–2019**. The overall timing of hourly activity remained broadly similar.
- Spatial patterns varied. K-means clustering of **44 eligible locations** identified **two weekday/weekend activity profiles**: one with sharper weekday peaks and another with broader daytime activity and relatively stronger weekend patterns.
- Some substantial pedestrian surges coincided with recorded event permits. Public holidays and heavier rainfall were associated with more frequent substantial reductions in activity.

The report discusses how changing sensor coverage, differences between source datasets, data quality and aggregation choices affect interpretation. These findings describe monitored locations; they should not be generalised uncritically to all of Melbourne.

## Data Sources

The analysis draws on:

- [City of Melbourne Pedestrian Counting System](https://data.melbourne.vic.gov.au/explore/dataset/pedestrian-counting-system-monthly-counts-per-hour/) — hourly pedestrian activity.
- City-supplied annual pedestrian data snapshots for 2022–2025.
- City of Melbourne pedestrian sensor locations and metadata.
- City of Melbourne historical event-permit records.
- Open-Meteo daily weather extracts for Melbourne.
- Victorian public-holiday / important-date information.

The input files are described below. Citations to individual sources and software are recorded in `references.bib` and the report.

## Project Files

| Path | Description |
|---|---|
| `report_final.qmd` | Main Quarto report with analysis, explanatory text and R code. |
| `report_final.html` | Rendered report with figures, tables and interactive visualisations. |
| `references.bib` | Data-source and software references used by the project. |
| `Data_pedestrians/raw/` | Historical pedestrian data and City-supplied annual snapshots. |
| `Data_pedestrians/raw2/` | Recent pedestrian data, event permits, sensor metadata, weather and public-holiday data. |
| `Presentation/Pulse_of_Melbourne-presentation.qmd` | Final presentation source. |
| `Presentation/Pulse_of_Melbourne-presentation.html` | Rendered presentation. |
| `Presentation/figures/` | Figures and saved objects used in the presentation. |
| `notes/` | Project brainstorming and supervisor-meeting notes. |
| `analysis_drafts/` | Earlier exploratory work; not required to render the final report. |
| `README.md` | Project description and reproduction instructions. |
| `LICENSE` | MIT licence for the team's original code, subject to third-party rights. |

## Software Requirements

The project requires **R** and the **Quarto command-line interface**. RStudio is optional for editing and rendering. **Git LFS** is required to retrieve the historical pedestrian CSV stored in the repository through Git Large File Storage.

Install the R packages in the R console:

```r
install.packages(c(
  "tidyverse", "lubridate", "janitor", "fs",
  "httr2", "arrow", "here", "ggrepel",
  "plotly", "leaflet", "slider", "cluster",
  "data.table", "kableExtra", "curl", "knitr", "scales"
))
```

An internet connection may be required for data downloads, online map backgrounds and any remote requests executed when the report renders. Recorded results are tied to the input extracts used by the team.

## Required Data Files

The following paths are relative to the **repository root** (the folder containing `report_final.qmd` and `README.md`).

| Folder | Required file | Purpose / availability |
|---|---|---|
| `Data_pedestrians/raw/` | `Pedestrian_Counting_System_Monthly_counts_per_hour_may_2009_to_14_dec_2022.csv` | Historical pedestrian records; tracked through Git LFS. |
| `Data_pedestrians/raw/data_pedestrian/` | `2022_Pedestrian_Data.csv` | City-supplied 2022 snapshot; may need to be obtained from the project team. |
| `Data_pedestrians/raw/data_pedestrian/` | `2023_Pedestrian_Data.csv` | City-supplied 2023 snapshot; may need to be obtained from the project team. |
| `Data_pedestrians/raw/data_pedestrian/` | `2024_Pedestrian_Data.csv` | City-supplied 2024 snapshot; may need to be obtained from the project team. |
| `Data_pedestrians/raw/data_pedestrian/` | `2025_Pedestrian_Data.csv` | City-supplied 2025 snapshot; may need to be obtained from the project team. |
| `Data_pedestrians/raw2/` | `pedestrian_counts_raw.csv` | Recent hourly pedestrian extract from the City of Melbourne API. |
| `Data_pedestrians/raw2/` | `event_permits_2014_2018.csv` | Historical event-permit extract. |
| `Data_pedestrians/raw2/` | `sensor_locations.csv` | Sensor coordinates and metadata. |
| `Data_pedestrians/raw2/` | `melbourne_weather_daily.csv` | Daily Open-Meteo weather extract. |
| `Data_pedestrians/raw2/` | `important_dates_august_2026.csv` | Important-date records used for Victorian public holidays. |

**Important:** The City-supplied annual snapshots are not necessarily available from a fresh clone. If they are missing, request access from the project team, subject to any applicable sharing conditions. Full reproduction requires the original input extracts and the same processing decisions.

The report covers pedestrian records through **31 October 2026**. Weather and public-holiday comparisons use inputs through **6 September 2026**. Fresh API downloads can contain revised observations or later dates, so they may yield different results.

## Reproducing the Report

1. **Install Git LFS**, clone the repository and retrieve the tracked historical file. Run these commands in a terminal:

   ```bash
   git lfs install
   git clone https://github.com/nishtabollavaram/ETC5543-Pulse_of_Melbourne.git
   cd ETC5543-Pulse_of_Melbourne
   git lfs pull
   ```

2. **Install R and Quarto**, and install the R packages listed under Software Requirements.

3. **Check the required data files** against the table above. Run R and Quarto commands from the repository root. Ensure the privately supplied annual snapshots, weather and public-holiday extracts are present before attempting full reproduction.

4. **Restore missing public extracts if necessary.** The report contains chunks named `download-current-pedestrian-data` and `download-event-permits`; where these are set to `eval: false`, they are not executed in a standard render. Run the relevant R statements manually to retrieve the public extracts if they are absent. Check the current code and API availability before doing so.

5. **Check the sensor metadata.** The report may request sensor-location data while rendering; internet access may be required even when other CSV extracts already exist.

6. **Render** the HTML report from the repository root:

   ```bash
   quarto render report_final.qmd --to html
   ```

7. **Open** `report_final.html` and review the figures, tables and interactive maps. If Quarto has produced a `report_final_files/` resource folder, keep it alongside the HTML when sharing the report unless all resources have been embedded.

To document your environment, use `sessionInfo()` in R and `quarto --version` in the terminal.

## Interpretation and Reproducibility Notes

- Sensor locations and network coverage changed over time. Long-term comparisons use a more consistent subset of monitoring locations to reduce bias from network expansion.
- Event coincidences, public holidays and rainfall associations provide context; they do not by themselves demonstrate causal effects.
- Dates, extract versions, cleaning decisions and sensor-selection rules can alter the resulting summaries and graphs.
- Historical notes and exploratory files are retained for transparency but are not required to render the final report.

## Licence and Attribution

The team's **original project code and associated documentation** are released under the [MIT License](LICENSE), provided all contributors agree to this release. The licence does **not** grant rights over third-party datasets, maps, software or other externally sourced materials. Those remain subject to their respective terms and attribution requirements.

Credit for pedestrian data and related metadata belongs to the City of Melbourne. See the data source links above and the report references for acknowledgements. The City of Melbourne's published dataset pages should be consulted for the applicable data licences and reuse conditions.

# Pulse of Melbourne

**How does Melbourne move, and how has its rhythm changed?**

ETC5543 · Business Analytics Project · Monash University · 2026  
**Team:** Richa Anghan · Zhuo Zhang · Nishta Bollavaram

[Read the report](report_final.html) · [Report source](report_final.qmd) · [PDF Report](report_final.pdf) · [View presentation](Presentation/Pulse_of_Melbourne-presentation.html) · [GitHub repository](https://github.com/nishtabollavaram/ETC5543-Pulse_of_Melbourne)

---

## Project Overview

*Pulse of Melbourne* explores how people use central Melbourne across time and space. Using pedestrian-counting records alongside information about events, public holidays and weather, we examine the city's recurring movement patterns and how they have evolved through major disruptions, including COVID-19.

> **Research question**  
> How do people use Melbourne across time and space, how have pedestrian activity patterns changed over the years, and how are these patterns associated with major events, weather conditions and other disruptions?

The project focuses on four connected questions: **when** people walk through the city, **where** movement patterns differ, **how** those patterns have changed, and **which circumstances** coincide with unusually high or low pedestrian activity.

### Project at a Glance

| Measure | Scope |
|:--|:--|
| **Study period** | May 2009–October 2026 |
| **Long-term comparison** | 2017–2019 versus 2023–2025 |
| **Comparable locations** | 27 locations in the long-term comparison |
| **Spatial clustering** | 44 eligible locations, grouped into two activity profiles |
| **Core tools** | R, Quarto and Git LFS |

**In this README:** [Main Findings](#main-findings) · [Data Sources](#data-sources) · [Analytical Methods](#analytical-methods) · [Project Files](#project-files) · [Software Requirements](#software-requirements) · [Required Data Files](#required-data-files) · [Reproducing the Report](#reproducing-the-report) · [Licence](#licence-and-attribution)

## Main Findings

| Theme | Key finding |
|:--|:--|
| **Daily and seasonal rhythms** | Pedestrian activity follows recognisable daily, weekly and seasonal cycles, although their intensity and timing vary across locations. |
| **Long-term change** | Across **27 consistently monitored locations**, the pooled median of recorded daily pedestrian counts was **28.5% lower in 2023–2025** than in **2017–2019**, while the overall hourly timing pattern remained broadly similar. |
| **Spatial variation** | K-means clustering of **44 eligible locations** identified two weekday/weekend profiles: sharper weekday peaks at some locations and broader daytime activity with relatively stronger weekend activity at others. |
| **Events and unusual days** | Some unusually high pedestrian counts coincided with recorded event permits. |
| **Holidays and rainfall** | Public holidays and heavier rainfall were associated with more frequent substantial dips in pedestrian activity. |

These results describe the **monitored locations**, not every street or person in Melbourne. Associations with weather, holidays or events are **not evidence of causation**. Changing sensor coverage and data conventions also affect how comparisons should be interpreted.

## Data Sources

The analysis combines six sources:

| Source | Role in the analysis |
|:--|:--|
| **City of Melbourne Pedestrian Counting System** | Historical hourly counts and recent observations obtained from the City's open data API. |
| **City of Melbourne annual snapshots (2022–2025)** | City-supplied extracts used to address data gaps and validate overlapping records. |
| **Sensor-location metadata** | Coordinates and descriptive information for spatial comparisons. |
| **City of Melbourne event permits** | Context for investigating unusual pedestrian activity. |
| **Open-Meteo historical weather data** | Daily weather observations, including rainfall. |
| **Victorian public-holiday information** | Identification of public holidays in the calendar analysis. |

Data-source acknowledgements and supporting software references are documented in [`references.bib`](references.bib) and the report. Third-party datasets retain their own licences and attribution requirements.

## Analytical Methods

The report uses:

1. **Data preparation:** Cleaning, standardisation and validation of historical and recent sensor records.
2. **Temporal analysis:** Visualising hourly, daily, weekly, monthly and seasonal patterns.
3. **Period comparisons:** Comparing pre-pandemic, COVID-19 and recent activity using more consistently observed locations.
4. **Unusual-day analysis:** Investigating departures from expected calendar patterns and comparing them with events, holidays and weather.
5. **Spatial analysis:** Applying K-means clustering to normalised weekday/weekend profiles to identify similar rhythms independently of total pedestrian volume.

The methods and interpretation of the results are explained in [`report_final.qmd`](report_final.qmd).

## Project Files

| File or folder | Description |
|:--|:--|
| [`report_final.qmd`](report_final.qmd) | Main Quarto report: methodology, explanations, analysis and R code. |
| [`report_final.html`](report_final.html) | Rendered report with figures, tables and interactive visualisations. |
| [`report_final.pdf`](report_final.pdf) | PDF version of the final report for submission. |
| [`references.bib`](references.bib) | Bibliographic references for data, software and supporting materials. |
| `Data_pedestrians/raw/` | Historical pedestrian CSV, including the dataset tracked with Git LFS. |
| `Data_pedestrians/raw/data_pedestrian/` | City-supplied annual pedestrian snapshots for 2022–2025. |
| `Data_pedestrians/raw2/` | Recent pedestrian records and supporting event, sensor, weather and holiday data. |
| [`Presentation/Pulse_of_Melbourne-presentation.qmd`](Presentation/Pulse_of_Melbourne-presentation.qmd) | Source of the final Quarto presentation. |
| [`Presentation/Pulse_of_Melbourne-presentation.html`](Presentation/Pulse_of_Melbourne-presentation.html) | Rendered final presentation. |
| `Presentation/figures/` | Figures and supporting outputs used by the presentation. |
| `analysis_drafts/` | Earlier exploratory work; not necessary for a normal final-report render. |
| `README.md` | Project overview and instructions for reproduction. |

> **Data availability:** All ten input files required for the final report are supplied through this repository and Git LFS. Run `git lfs pull` after cloning to retrieve the historical and recent pedestrian files. The annual snapshots and supporting event, sensor, weather and public-holiday datasets are included.

The final analysis uses frozen input extracts. The recent pedestrian file contains 1,628,822 records covering 1 November 2024 to 31 October 2026. Together with the historical records and annual snapshots, the pedestrian analysis covers May 2009 to October 2026. Weather and public-holiday comparisons end on 6 September 2026.

For exact reproduction, use the supplied files. Optional downloads from the public APIs may contain revised or additional records and can produce different results.

## Software Requirements

To reproduce the analysis, install:

- **R** and the **Quarto command-line interface**.
- **Git LFS** to retrieve the historical and recent pedestrian CSV files.
- **RStudio** (optional, but convenient for editing and rendering).

The final-report analysis was tested in an isolated environment using R 4.4.2 and Quarto 1.7.33, with the saved input datasets and a local APA citation-style file.

Install the packages used by the report in the **R console**:

```r
install.packages(c(
  "tidyverse", "lubridate", "janitor", "fs",
  "httr2", "arrow", "here", "ggrepel",
  "plotly", "leaflet", "slider", "cluster",
  "data.table", "kableExtra", "curl", "knitr",
  "rmarkdown", "scales"
))
```

An internet connection is required for package installation, Git LFS downloads, optional data refreshes and online map backgrounds. If the APA citation style is referenced through its online URL, rendering also requires access to that service.

## Required Data Files

All paths are relative to the **repository root** (the folder containing `README.md` and `report_final.qmd`).

### Pedestrian observations

| Directory | Filename | Purpose |
|:--|:--|:--|
| `Data_pedestrians/raw/` | `Pedestrian_Counting_System_Monthly_counts_per_hour_may_2009_to_14_dec_2022.csv` | Historical records; retrieved with Git LFS. |
| `Data_pedestrians/raw/data_pedestrian/` | `2022_Pedestrian_Data.csv` | City-supplied 2022 snapshot. |
| `Data_pedestrians/raw/data_pedestrian/` | `2023_Pedestrian_Data.csv` | City-supplied 2023 snapshot. |
| `Data_pedestrians/raw/data_pedestrian/` | `2024_Pedestrian_Data.csv` | City-supplied 2024 snapshot. |
| `Data_pedestrians/raw/data_pedestrian/` | `2025_Pedestrian_Data.csv` | City-supplied 2025 snapshot. |
| `Data_pedestrians/raw2/` | `pedestrian_counts_raw.csv` | Recent pedestrian observations from the City of Melbourne API. |

### Supporting data

| Directory | Filename | Purpose |
|:--|:--|:--|
| `Data_pedestrians/raw2/` | `event_permits_2014_2018.csv` | Historical event permits. |
| `Data_pedestrians/raw2/` | `sensor_locations.csv` | Sensor locations and metadata. |
| `Data_pedestrians/raw2/` | `melbourne_weather_daily.csv` | Daily Open-Meteo weather extract. |
| `Data_pedestrians/raw2/` | `important_dates_august_2026.csv` | Calendar records used to identify public holidays. |

## Reproducing the Report

### 1. Clone the repository and retrieve the input data

Install Git LFS first, then run these commands in a **terminal**:

```bash
git lfs install
git clone https://github.com/nishtabollavaram/ETC5543-Pulse_of_Melbourne.git
cd ETC5543-Pulse_of_Melbourne
git lfs pull
```

### 2. Install R packages

Install R and Quarto, then execute the `install.packages(...)` command in [Software Requirements](#software-requirements).

### 3. Check the input files

Confirm that the files in [Required Data Files](#required-data-files) are present at their specified paths. In particular, check the City-supplied annual snapshots and the original weather and public-holiday extracts.

### 4. Use the supplied data extracts

Normal rendering uses the saved input files listed under Required Data Files. The API download chunks are disabled so that rendering does not replace these files with newer data.

If either LFS-managed pedestrian file is missing, run `git lfs pull` from the repository root. Confirm that all required input files are available before rendering.

### 5. Render the report

From the **repository root**, run:

```bash
quarto render report_final.qmd --to html
```

Open the generated `report_final.html` in a web browser to view the report, figures, tables and interactive visualisations.

The README’s report link opens the HTML file’s page on GitHub. To view the rendered report, download the file using GitHub’s download option and open it locally, or open the copy obtained by cloning the repository.

The final report uses embedded resources. Online map backgrounds still require an internet connection.

### 6. Record your software environment 

Run `sessionInfo()` in R and `quarto --version` in a terminal to document the software versions used.

## Optional Data Refresh

The report source retains API download code for obtaining updated pedestrian records and sensor metadata. These download chunks are disabled during ordinary rendering to preserve the input files used for the submitted analysis.

To obtain updated data, run the relevant download chunk manually after loading the required packages. Downloading replaces the corresponding local CSV, so preserve the original extract separately if it is still needed.

After refreshing any input, render the report again and check the figures, tables and written findings. Updated records or metadata may change the results. Use the supplied frozen extracts when reproducing the submitted report.

## Reproducibility and Interpretation Notes

- **Coverage:** The number and location of reporting sensors changed over time. Raw citywide totals are not directly comparable without considering that expansion.
- **Comparable locations:** The long-term comparison uses a more consistent set of monitoring locations to reduce distortions from changing coverage.
- **Observational evidence:** Associations involving events, public holidays and weather should not be interpreted as causal effects.
- **Exact reproduction:** Matching results requires the original input extracts, date cutoffs, data-cleaning decisions and sensor-selection rules.
- **Exploratory work:** The `analysis_drafts/` folder contains earlier exploratory analyses and is not required to render the final report.

## Licence and Attribution

The original code and documentation developed for this project
are licensed under the MIT License. See [LICENSE](LICENSE)
for details.

City of Melbourne data, Open-Meteo data, map backgrounds and
other third-party materials remain subject to their respective
licensing and attribution requirements.

See [references.bib](references.bib) and the report for
source acknowledgements.
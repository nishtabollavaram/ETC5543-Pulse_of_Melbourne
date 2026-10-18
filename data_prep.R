library(data.table)

hist <- fread("pedestrian_counts_processed.csv")
hist[, sensing_date := format(sensing_date, "%Y-%m-%d")]
setnames(hist, "pedestriancount", "pedestrian_count")
hist[, source := "historical"]
hist[, lat := NA_real_]
hist[, lon := NA_real_]
hist <- hist[, .(sensing_date, hourday, location_id, pedestrian_count,
                 lat, lon, covid_phase, mega_event, is_public_holiday, source)]

new_files <- sprintf("%d_Pedestrian_Data.csv", 2022:2025)
new <- rbindlist(lapply(new_files, fread), use.names = TRUE, fill = TRUE)
new[, sensing_date := format(as.Date(Sensing_Date), "%Y-%m-%d")]
setnames(new, c("Location_ID", "PedestrianCount"), c("location_id", "pedestrian_count"))
new[, source := "api"]
new[, covid_phase := NA_character_]
new[, mega_event := NA]
new[, is_public_holiday := NA]
new <- new[, .(sensing_date, hourday = HourDay, location_id, pedestrian_count,
               lat = Latitude, lon = Longitude, covid_phase, mega_event,
               is_public_holiday, source)]

pedestrian_full <- rbindlist(list(hist, new), use.names = TRUE, fill = TRUE)
setorder(pedestrian_full, sensing_date, location_id, hourday)
fwrite(pedestrian_full, "pedestrian_full.csv.gz")

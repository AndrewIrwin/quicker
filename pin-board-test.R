# pin-board-test.R

# 2022-06-23

# create a pin board with a csv, frictionless data, an arrow/feather version of same file.
# store on server
# read from server

library(tidyverse, quietly = TRUE)
library(arrow, quietly = TRUE)
library(frictionless)
library(pins)

daily_weather <- read_csv("~/Dropbox/Teaching/STAT 2430 Data Viz/Stats-data-visualization-2021/01-course-notes/not-for-git/selected_weather_day.csv",
                          show_col_types = FALSE)

td <- "/var/folders/0j/9nvn_dgd6x7254mn3yp4h9dc0000gp/T/RtmpqcZljU/pin-board"
fs::dir_create(td)
board <- board_folder(td, versioned= TRUE)
board |> pin_write(daily_weather, "daily_weather_qs", type="qs", 
                   description = "Environment Canada daily weather data for selected stations.")
board |> pin_write(daily_weather, "daily_weather_arrow", type="arrow", 
                   description = "Environment Canada daily weather data for selected stations.")

# use board_url to read

newboard <- board_url(c(daily_weather_qs="https://mathstat.dal.ca/~irwin/pin-board/daily_weather_qs",
                        daily_weather_arrow="https://mathstat.dal.ca/~irwin/pin-board/daily_weather_arrow"))
pin_meta(newboard, "daily_weather_qs")
pin_meta(newboard, "daily_weather_arrow")
cache_info()

dwq <- pin_download(newboard, "daily_weather_qs")
dwq |> head()
newboard |> pin_read("daily_weather_arrow")

# not working as expected

# read qs file directly # fails
dwq <- qs::qread("https://mathstat.dal.ca/~irwin/pin-board/daily_weather_qs/20220624T002756Z-6b8cf/daily_weathe_qs.qs")

# read feather file directly  # fails
dwf <- arrow::read_feather("https://mathstat.dal.ca/~irwin/pin-board/daily_weather_arrow/20220624T002757Z-51227/daily_weather_arrow.arrow")

qs::qread(file("https://mathstat.dal.ca/~irwin/pin-board/daily_weather_qs/20220624T002756Z-6b8cf/daily_weather_qs.qs"))

# read thomas mock's slide again . clearly I didn't understand somethig important!

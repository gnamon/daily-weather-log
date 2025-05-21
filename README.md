# daily-weather-log
This Bash script is part of my personal journey in practicing shell scripting and task automation.
It fetches the current temperature and tomorrow morning's forecast for a specified city (default: **Bangkok**) using [wttr.in](https://wttr.in). The data is recorded daily to a log file, making it easy to track how the wether changes over time.

## What This Script Does

- Retrieves current observed temperature and forecast (obs_temp and fc_temp)
- Saves the output in record.log
- Can be scheduled to run daily using `cron`

  ## Tech Used

  - Bash
  - `curl` - to feetch weather data
  - `sed`, `grep`, `cut` - for parsing and extracting data
  - `date` - to format current date
  - `cron` - to automate the script daily

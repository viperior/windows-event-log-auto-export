# windows-event-log-auto-export
This PowerShell script automatically exports Windows event logs to CSV files that can be easily consumed by external programs.

## Usage
1. Download `export_log.ps1`.
2. Edit `export_log.ps1` by setting the target directory for the exported log data.
3. Customize the types of events you want to export to CSV using `$EventTypesToExport`, depending on your requirements.
4. At this point, you can either perform a one-time export by executing the script via PowerShell. Alternatively, you can create a scheduled task to do this daily.

## Example Output Files
![Example Output Files](https://raw.githubusercontent.com/viperior/windows-event-log-auto-export/master/images/example-output-files.png?sanitize=true)

## Example Dashboard Using Exported Data
![Example Event Analytics](https://raw.githubusercontent.com/viperior/windows-event-log-auto-export/master/images/example-event-analytics.png?sanitize=true)

The visualization above was created using Qlik Sense Desktop. Using a platform like this, you can easily see trends in your event data, such as spikes or errors or re-occurring errors. You can also monitor a specific type of error to determine if a fix was successful or not. These abilities are especially useful for intermittent errors.

## Notes
Before executing this script, be sure you understand the volume of events logged on your system. Higher event volumes may result in a long script execution time and elevated disk usage.

If you schedule this script to run daily, consider also automating the cleanup of old log data.

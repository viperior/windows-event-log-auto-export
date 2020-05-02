# Capture the script start time
$ScriptStartTime = Get-Date

# Build the file path for the current log topic.
$CurrentLogTopic = 'System'
$LogOutputDirectory = 'Q:\data\Windows Event Log Export'
$LogOutputTopic = "Windows Event Log - $CurrentLogTopic"
$CurrentTimeUTC = Get-Date -Format FileDateTimeUniversal
$LogOutputFileName = "$CurrentTimeUTC-$LogOutputTopic"
$LogOutputFileExtension = '.evtx'
$LogOutputFilePath = "$LogOutputDirectory\$LogOutputFileName$LogOutputFileExtension"
$LogOutputCSVFilePath = "$LogOutputDirectory\$LogOutputFileName.csv"

# Export the current log topic as an .evtx file.
Write-Output "Exporting Windows event log of type $CurrentLogTopic to:"
Write-Output "$LogOutputFilePath"
wevtutil export-log $($CurrentLogTopic) "$LogOutputFilePath"
Write-Output 'Finished exporting log to evtx file.'

# Create a CSV version of the log data.
Write-Output "Creating CSV version of Windows event log of type $CurrentLogTopic."
Write-Output 'Target CSV file path:'
Write-Output "$LogOutputCSVFilePath"
Get-WinEvent -Path "$LogOutputFilePath" | Export-CSV "$LogOutputCSVFilePath"
Write-Output 'Finished creating CSV file.'

# Calculate script run time.
$ScriptEndTime = Get-Date
$ScriptDuration = New-Timespan -Start $ScriptStartTime -End $ScriptEndTime
Write-Output "Log export process execution time: $ScriptDuration."

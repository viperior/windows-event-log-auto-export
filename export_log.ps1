# Capture the script start time
$ScriptStartTime = Get-Date

# Set output location for CSV files.
$LogOutputDirectory = 'C:\data\Windows Event Log Export'

# Define Windows event log types to export.
$EventTypesToExport = @('Application', 'Security', 'Setup', 'System', 'ForwardedEvents')

foreach ($EventType in $EventTypesToExport)
{
    # Build the file path for the current log topic.
    $LogOutputTopic = "Windows Event Log - $EventType"
    $CurrentTimeUTC = Get-Date -Format FileDateTimeUniversal
    $LogOutputFileName = "$CurrentTimeUTC - $LogOutputTopic"
    $LogOutputCSVFilePath = "$LogOutputDirectory\$LogOutputFileName.csv"

    # Create a CSV version of the log data.
    Write-Output "Creating CSV version of Windows event log of type $EventType."
    Write-Output 'Target CSV file path:'
    Write-Output "$LogOutputCSVFilePath"
    Get-WinEvent -LogName $($EventType) | Export-CSV "$LogOutputCSVFilePath"
    Write-Output 'Finished creating CSV file.'
}

# Calculate script run time.
$ScriptEndTime = Get-Date
$ScriptDuration = New-Timespan -Start $ScriptStartTime -End $ScriptEndTime
Write-Output "Log export process execution time: $ScriptDuration."

# Description: Scan for recent persistence mechanism activity instead of looking at everything at once!
#
# Adjust the "AddMinutes" value to your liking
$thresholdTime = (Get-Date).AddMinutes(-15)
Write-Host "Scanning for new persistence as of $thresholdTime."
Write-Host "..."
Write-Host "Beginning scan!"
Write-Host ""

# TO DO
# Use these for runkeys
# Can scan each one listing out the entries or some other method perhaps
$runKeys = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
)

# Other possible TO DOs
# Services, Tasks?

# Check 1 - look within startup folders for recently changed files or folders
function ScanStartupFolders {
    Write-Host "CHECKING STARTUP FOLDERS!"
    $currentUser = $env:USERNAME
    $startupFolders = @(
        "C:\Users\$currentUser\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup",
        "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
    )

    foreach ($folder in $startupFolders) {
        Write-Host "Checking folder... $folder"
        $changes = Get-ChildItem $folder -Recurse | Where-Object { $_.LastWriteTime -gt $thresholdTime }

        if ($changes.Count -gt 0) {
            Write-Host "Changes detected!"
            foreach ($change in $changes) {
                Write-Host "Modified item: $($change.FullName) at $($change.LastWriteTime)"
            }
        } else {
            Write-Host "No changes detected."
        }
        Write-Host ""
    }
    Write-Host ""
}


# Check 2 - look within the runkeys
function ScanRegistryRunKeys {
    # Insert code here!
}

# Call the functions!
ScanStartupFolders

# Remove the "#" 
# ScanRegistryRunKeys



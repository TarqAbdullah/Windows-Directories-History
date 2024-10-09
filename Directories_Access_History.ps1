# Define the base directory where you want to start scanning
$baseDirectory = "WRITE THE SCANNING DIRECTORY HERE"

# Define how far back to consider "recent access"
$thresholdDays = 90
$thresholdDate = (Get-Date).AddDays(-$thresholdDays)

# Array to hold report data
$report = @()

# Function to detect outliers based on access time and user
function Get-DirectoryStats {
    param (
        [string]$dirPath
    )
    
    # Get the directory info and ACL
    $directory = Get-Item $dirPath
    $acl = Get-Acl $dirPath
    
    # Get last accessed time
    $lastAccessTime = $directory.LastAccessTime
    
    # Get the owner of the directory (could be treated as the last access user)
    $owner = $acl.Owner

    # Check if the directory is an outlier (not accessed in the last X days)
    $isOutlier = $false
    if ($lastAccessTime -lt $thresholdDate) {
        $isOutlier = $true
    }
    
    # Return an object with relevant data
    return [pscustomobject]@{
        Directory        = $dirPath
        LastAccessTime   = $lastAccessTime
        Owner            = $owner
        IsOutlier        = $isOutlier
    }
}

# Recursively search directories
Get-ChildItem -Path $baseDirectory -Directory -Recurse | ForEach-Object {
    $dirPath = $_.FullName
    $stats = Get-DirectoryStats -dirPath $dirPath
    $report += $stats
}

# Write report to CSV
$csvPath = "WRITE YOUR DESTINED PATH HERE\DirectoryAccessReport.csv"
$report | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

# Generate statistics (e.g., number of outliers)
$outliers = $report | Where-Object { $_.IsOutlier -eq $true }
$regulars = $report | Where-Object { $_.IsOutlier -eq $false }

# Output summary statistics
Write-Host "Total Directories Scanned: " $report.Count
Write-Host "Outliers Detected: " $outliers.Count
Write-Host "Directories Accessed Recently: " $regulars.Count
Write-Host "Reports generated at $csvPath."

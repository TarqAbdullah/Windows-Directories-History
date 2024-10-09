# Directories Access History

PowerShell script to scan directories within a specified path and report on directories that have not been accessed within a specified number of days. This is useful for system administrators who want to monitor directory access patterns, identify potentially abandoned directories, or optimize storage by removing or archiving unused folders.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
- [Parameters](#parameters)
- [Example](#example)
- [Output](#output)
- [Contributing](#contributing)
- [License](#license)

## Features

- Scans a specified directory and its subdirectories.
- Checks the last access date of each directory and compares it to a defined threshold.
- Flags directories that haven’t been accessed within the specified time as “outliers.”
- Retrieves the owner of each directory to determine potential last access users.
- Outputs a detailed report listing each directory’s path, last access time, and owner.

## Getting Started

To use this script, you need PowerShell installed on your Windows system. This script was tested on PowerShell 5.1 and above.

### Prerequisites

- **PowerShell**: Make sure PowerShell is installed on your system. You can check the version by running:
  
  ```powershell
  $PSVersionTable.PSVersion

### Installation

Clone the repository or download the script directly from the repository page:
  
  `powershell
  git clone https://github.com/yourusername/Directories-Access-History.git`

Alternatively, you can download the script as a .ps1 file and save it to a directory of your choice.

### Usage

1- Open PowerShell with administrative privileges.

2- Navigate to the directory containing the script.

3- Run the script using the following command:
  
  ```powershell
  .\Directories_Access_History.ps1

### Parameters

- `$baseDirectory`: Set this variable to the directory you want to scan.
  
  ```powershell
  $baseDirectory = "C:\Path\To\Directory"

- `$thresholdDays`: Specify the number of days for determining “recent access.” For instance, if you set this to `90`, any directory not accessed in the last 90 days will be flagged as an outlier.
  
  ```powershell
  $thresholdDays = 90

### Example

Here's an example configuration and how it would be executed:
  
  ```powershell
  # Define the directory to scan and the threshold in days
  $baseDirectory = "C:\Users\Public\Documents"
  $thresholdDays = 30

  # Run the script
  .\Directories_Access_History.ps1

The above example will scan the `C:\Users\Public\Documents` directory and flag any subdirectories that haven’t been accessed in the past 30 days.

### Output

The script outputs a report of directories that meet the outlier criteria. The output includes the following information for each flagged directory:

Directory: The path of the directory.
Last Accessed Time: The last access date of the directory.
Owner: The owner of the directory.
You can modify the script to export this data to a file by adding export functionality. Here’s an example snippet for exporting the report to a CSV file:

  ```powershell
  $report | Export-Csv -Path "DirectoryAccessReport.csv" -NoTypeInformation

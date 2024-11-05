# Directories Access History

YT Tutorial: https://youtu.be/12nLaCDIqEc

The hands-on exercises and real-world case studies in SANS SEC530: Defensible Security Architecture and Engineering that highlighted the challenges faced when sifting through data remnants. I got inspired to develop a project focused on cataloging and analyzing the history of directories could significantly aid in identifying potential indicators of compromise and understanding user activity over time.

PowerShell script to scan directories within a specified path and report on directories that have not been accessed within a specified number of days. This is useful for system administrators who want to monitor directory access patterns, identify potentially abandoned directories, or optimize storage by removing or archiving unused folders.

## Table of Contents

- [Features](#features)
- [Use Cases](#use-cases)
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

## Use Cases

This script is valuable in various scenarios, such as:

1. **Storage Optimization**: Identify directories that haven’t been accessed in a long time, making it easier to clean up storage by archiving or deleting old, unused folders.
2. **Security Audits**: Retrieve directory ownership information to ensure that sensitive folders are not owned by unauthorized users or have not been accessed recently, which could indicate potential security risks.
3. **Compliance Monitoring**: In environments with strict data retention policies, use this script to ensure that directories are being accessed regularly, verifying compliance with internal or external data usage policies.
4. **Resource Management**: For shared directories, monitor user access patterns to understand how resources are being used and adjust resource allocations or permissions as needed.
5. **Migration Planning**: During system or data migrations, identify actively used directories versus those that can be deprioritized, making the migration process more efficient.

## Getting Started

To use this script, you need PowerShell installed on your Windows system. This script was tested on PowerShell 5.1 and above.

### Prerequisites

- **PowerShell**: Make sure PowerShell is installed on your system. You can check the version by running:
  
  ```powershell
  $PSVersionTable.PSVersion

### Installation

- Clone the repository or download the script directly from the repository page:
  
  ```powershell
  git clone https://github.com/TarqAbdullah/Windows-Directories-History.git

### Usage

- Open PowerShell with administrative privileges.
- Navigate to the directory containing the script.
- Run the script using the following command:
  
  ```powershell
  .\Directories_Access_History.ps1

### Parameters

- `$baseDirectory`: Set this variable to the directory you want to scan.
  
  ```powershell
  $baseDirectory = "C:\Path\To\Directory"

- `$thresholdDays`: Specify the number of days for determining “recent access.” For instance, if you set this to `90`, any directory not accessed in the last 90 days will be flagged as an outlier.
  
  ```powershell
  $thresholdDays = 90


### Output

The script outputs a report of directories that meet the outlier criteria. The output includes the following information for each flagged directory:

Directory: The path of the directory.
Last Accessed Time: The last access date of the directory.
Owner: The owner of the directory.
You can modify the script to export this data to a file by adding export functionality. Here’s an example snippet for exporting the report to a CSV file:

  ```powershell
  $report | Export-Csv -Path "DirectoryAccessReport.csv" -NoTypeInformation

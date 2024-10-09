# Windows-Directories-History

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

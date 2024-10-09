# Windows-Directories-History

YT Tutorial: https://youtu.be/12nLaCDIqEc

This PowerShell script recursively scans a specified directory in a Windows environment, generating statistics on recent access times and ownership for each subdirectory. It's a useful tool for system administrators or users who need insights into directory access patterns and want to identify unused or rarely accessed folders. The script outputs both a summary of its findings and a detailed report in CSV format.

## Features

- **Recursive Directory Scanning**: Analyzes all subdirectories within a specified base directory.
- **Access Time Analysis**: Checks each directory’s last accessed time, identifying "outliers" that have not been accessed within a user-defined timeframe.
- **Ownership Detection**: Retrieves the owner of each directory, which can be useful for identifying access patterns by different users.
- **CSV Report Generation**: Exports detailed statistics to a CSV file for further analysis.
- **Summary Output**: Displays the total number of directories scanned, number of outliers, and directories accessed recently.

## Use Cases

This script is valuable in various scenarios, such as:

1. **Storage Optimization**: Identify directories that haven’t been accessed in a long time, making it easier to clean up storage by archiving or deleting old, unused folders.
2. **Security Audits**: Retrieve directory ownership information to ensure that sensitive folders are not owned by unauthorized users or have not been accessed recently, which could indicate potential security risks.
3. **Compliance Monitoring**: In environments with strict data retention policies, use this script to ensure that directories are being accessed regularly, verifying compliance with internal or external data usage policies.
4. **Resource Management**: For shared directories, monitor user access patterns to understand how resources are being used and adjust resource allocations or permissions as needed.
5. **Migration Planning**: During system or data migrations, identify actively used directories versus those that can be deprioritized, making the migration process more efficient.

## Usage

1. **Set the Base Directory**: Update the `$baseDirectory` variable with the path of the directory you want to analyze.
2. **Define Recent Access Threshold**: Adjust the `$thresholdDays` variable to set how many days back the script should consider as "recent access."
3. **Run the Script**: Execute the script in PowerShell. It will generate a summary in the console and save a detailed CSV report to the specified path.

The default configuration will:
- Scan all subdirectories within `$baseDirectory`.
- Classify directories as "outliers" if they have not been accessed in the last 90 days.
- Generate a CSV report at `$csvPath`.

## Example Output

```plaintext
Total Directories Scanned: 100
Outliers Detected: 20
Directories Accessed Recently: 80
Reports generated at $csvPath

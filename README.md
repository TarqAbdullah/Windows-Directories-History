# Windows-Directories-History


This PowerShell script recursively scans a specified directory in a Windows environment, generating statistics on recent access times and ownership for each subdirectory. It's a useful tool for system administrators or users who need insights into directory access patterns and want to identify unused or rarely accessed folders. The script outputs both a summary of its findings and a detailed report in CSV format.

## Features

- **Recursive Directory Scanning**: Analyzes all subdirectories within a specified base directory.
- **Access Time Analysis**: Checks each directory’s last accessed time, identifying "outliers" that have not been accessed within a user-defined timeframe.
- **Ownership Detection**: Retrieves the owner of each directory, which can be useful for identifying access patterns by different users.
- **CSV Report Generation**: Exports detailed statistics to a CSV file for further analysis.
- **Summary Output**: Displays the total number of directories scanned, number of outliers, and directories accessed recently.

## Usage

1. **Set the Base Directory**: Update the `$baseDirectory` variable with the path of the directory you want to analyze.
2. **Define Recent Access Threshold**: Adjust the `$thresholdDays` variable to set how many days back the script should consider as "recent access."
3. **Run the Script**: Execute the script in PowerShell. It will generate a summary in the console and save a detailed CSV report to the specified path.

The default configuration will:
- Scan all subdirectories within `C:\Users\Administrator\Downloads`.
- Classify directories as "outliers" if they have not been accessed in the last 90 days.
- Generate a CSV report at `C:\Users\Administrator\OneDrive\Desktop\DirectoryAccessReport.csv`.

## Example Output

```plaintext
Total Directories Scanned: 100
Outliers Detected: 20
Directories Accessed Recently: 80
Reports generated at C:\Users\Administrator\OneDrive\Desktop\DirectoryAccessReport.csv.

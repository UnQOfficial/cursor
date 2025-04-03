# Cursor AI Editor Installer

<p align="center">
  <img src="cursor.png" alt="Cursor AI Logo" width="200">
</p>

A modern, feature-rich installer script for Cursor AI Editor on Linux systems.

## Features

- 🚀 **Easy Installation**: Install Cursor AI Editor with a simple command
- 🔄 **Smart Updates**: Seamlessly update to the latest version without reinstalling
- 🧹 **Clean Uninstallation**: Remove Cursor completely when no longer needed
- 🔒 **Privacy Protection**: Reset request IDs and telemetry with a single click
- 📊 **Status Information**: View installation status and version information
- 📱 **Supports Multiple Architectures**: Works on both x86_64 and ARM64

## Installation

### Quick Install

```bash
sudo bash cursor.sh
```

### Command Line Options

```
Usage: cursor.sh [OPTION]

Options:
  -i, --install     Install Cursor AI Editor
  -u, --uninstall   Uninstall Cursor AI Editor
  -p, --update      Update Cursor AI Editor
  -r, --reset-ids   Reset Cursor telemetry & request IDs
  -a, --about       Show information about Cursor
  -h, --help        Display this help message
```

For example, to install Cursor directly:
```bash
sudo bash cursor.sh -i
```

To reset request IDs (no root required):
```bash
bash cursor.sh -r
```

## System Requirements

- Linux operating system
- Root access (for installation/uninstallation)
- Dependencies will be automatically installed (wget, grep, sed, awk)

## Status Information

The installer includes a status information table that displays:
- Name of the application
- Currently installed version
- Latest available version

## Privacy Features

Reset your telemetry and request IDs to enhance privacy:
```bash
bash cursor.sh -r
```

## Troubleshooting

If you encounter any issues:
1. Ensure you have root privileges for installation/uninstallation
2. Check internet connectivity for downloading the application
3. Verify your system architecture is supported (x86_64 or ARM64)

## License

This script is provided as-is, without any warranty.

## Author

Developed by Mahesh Technicals
Version: 3.0

# Cursor AI Editor Installer

<p align="center">
  <img src="cursor.png" alt="Cursor AI Logo" width="400">
</p>

A modern, comprehensive bash script for installing, managing, and customizing Cursor AI Editor on Linux systems.

> **GitHub Repository**: [https://github.com/MaheshTechnicals/cursor-free-vip-termux.git](https://github.com/MaheshTechnicals/cursor-free-vip-termux.git)

## Features

- **🚀 Full Installation Management**
  - Install, uninstall, and update Cursor AI Editor with ease
  - Cross-architecture support (x86_64 and ARM64)
  - Automatic dependency checking

- **🔒 Privacy Features**
  - Reset telemetry and request IDs
  - Backup and restore configuration files

- **💼 User Experience**
  - Interactive menu with modern UI
  - Command-line options for scripting
  - User-friendly error handling
  - Dynamic configuration that works for any user

## Prerequisites

- Linux operating system (Debian, Ubuntu, Fedora, Arch, etc.)
- Basic system utilities (wget, grep, sed, awk)
- Optional: xxd, jq, python3 (for enhanced functionality)

## Installation

### From GitHub Repository

```bash
# Clone the repository
git clone https://github.com/MaheshTechnicals/cursor-free-vip-termux.git

# Navigate to the directory
cd cursor-free-vip-termux

# Make the script executable
chmod +x cursor.sh

# Run the installer
./cursor.sh
```

### Interactive Mode

```bash
bash cursor.sh
```

### Command-line Options

```bash
# Install Cursor AI Editor
sudo bash cursor.sh -i

# Uninstall Cursor AI Editor
sudo bash cursor.sh -u

# Update to the latest version
sudo bash cursor.sh -p

# Reset request IDs
bash cursor.sh -r

# Show information about Cursor
bash cursor.sh -a

# Display help
bash cursor.sh -h
```

## Using on Android with Termux

This tool can be used on Android devices through Termux by installing a Linux distribution:

### Recommended Distros for Android

1. **Ubuntu 24.04 (Recommended)**
   - Follow the installation guide: [How to Install Ubuntu 24.04 on Android Without Root](https://maheshtechnicals.com/how-to-install-ubuntu-24-04-on-android-without-root/)

2. **Kali Linux**
   - Alternative option: [How to Install Kali Linux on Android (No Root) 2024](https://maheshtechnicals.com/how-to-install-kali-linux-on-android-no-root-2024/)

After installing your preferred Linux distro in Termux, you can proceed with the Cursor AI Editor installation as described above.

## Privacy

This script provides functionality to reset the telemetry IDs that Cursor uses, giving you a fresh identity when needed. It creates backups of your original configuration for safety.

## Customization

The installer creates configuration at `$HOME/.config/Cursor/` which is specific to your user account. All backup paths and configurations are dynamically set based on the current user's home directory.

## Troubleshooting

If you encounter permission issues:
- For installation/uninstallation: Run the script with `sudo`
- For configuration changes: Ensure you have write permissions to your config directory

## Original Cursor AI Editor

If you prefer to download the official version directly, visit the official Cursor website:
- [https://cursor.sh](https://cursor.sh)

## Disclaimer

- This installer is provided as-is, free to use and distribute.
- This tool is created for **educational purposes only**.
- This is an unofficial installer for Cursor AI Editor. Cursor is a product of Anysphere Inc.
- The authors are not responsible for any misuse of this tool or any violations of terms of service.

## Author

Created by Mahesh Technicals

## License

This installer is provided as-is, free to use and distribute.

# Cursor AI Editor Installer for Android & Linux | The Ultimate Setup Tool

<p align="center">
  <img src="logo.jpg" alt="Cursor AI Editor - AI-powered code editor for Android and Linux" width="200">
</p>

> The most comprehensive installer script for Cursor AI Editor on Android devices (via Termux) and Linux systems - bringing the revolutionary AI-powered code editor to mobile developers and Linux users alike (supports both ARM64 & x86_64).

[](https://opensource.org/licenses/MIT//img.shields.io/badge/Platformes](#key-features)
- [Android Installation Guide](#android-installation-guide)
- [Linux Installation Guide](#linux-installation-guide)
- [Command Line Reference](#command-line-reference)
- [System Requirements](#system-requirements)
- [Status Information](#status-information)
- [Enhanced Privacy Controls](#enhanced-privacy-controls)
- [Troubleshooting Guide](#troubleshooting-guide)
- [Copyright and License](#copyright-and-license)
- [About the Developer](#about-the-developer)

## Overview

This installer provides a seamless way to set up [Cursor AI Editor](https://cursor.sh) on Android devices (via Termux) and Linux systems. Cursor is the cutting-edge AI-powered code editor that enhances developer productivity with intelligent code completion, debugging assistance, and GitHub Copilot integration. Now you can enjoy professional coding with AI assistance directly on your Android phone or tablet!

## Key Features

- 📱 **Android-First Design**: Specially optimized for Android devices using Termux
- 🚀 **One-Click Installation**: Install Cursor AI Editor with a single command
- ⚡ **Auto Install Mode**: Silent installation without prompts for automation
- 🔄 **Zero-Downtime Updates**: Update to the latest version without losing your settings
- 🧹 **Complete Uninstallation**: Fully remove Cursor with all configurations when no longer needed
- 🔒 **Enhanced Privacy Controls**: Reset request IDs and telemetry with a single click
- 📊 **Real-Time Status Monitoring**: View installation status and version information
- ⚙️ **Cross-Platform Compatibility**: Works on both Android (ARM64) and Linux (x86_64)
- 🔧 **Automatic Dependency Management**: Intelligent detection and installation of required dependencies
- 🎨 **Enhanced Visual Design**: Professional ASCII art banner with terminal-optimized display
- 📈 **Advanced Progress Tracking**: Real-time progress bars and status indicators

## Android Installation Guide

### Setting Up Termux (Prerequisite)

1. Install [Termux from F-Droid](https://f-droid.org/en/packages/com.termux/) (recommended) or Google Play

2. Install a Linux distribution on your Android device using one of these guides:
   
   - **Kali Linux (Option 1)**: [To Install Kali Linux on Android (No Root) 2025](https://www.kali.org/docs/nethunter/nethunter-rootless/)
   
   - **Ubuntu (Option 2, Recommended)**: [To Install Ubuntu on Android Without Root](https://github.com/UnQOfficial/ubuntu)

### Installing Cursor on Android

Once you're in the Linux environment (Kali or Ubuntu):

1. Download the installer script:
   ```bash
   wget https://raw.githubusercontent.com/UnQOfficial/cursor/refs/heads/main/cursor.sh
   ```

2. Make it executable:
   ```bash
   chmod +x cursor.sh
   ```

3. Run the installer with sudo (for proper system-wide installation):
   ```bash
   sudo bash cursor.sh
   ```

4. Follow the on-screen instructions to complete the installation.

> **Note:** If you get "sudo: command not found", install it first with: `apt update && apt install sudo`

## Linux Installation Guide

### Quick Install Method

For fast installation with interactive menu:

```bash
sudo bash cursor.sh
```

### Auto Install Method (No Prompts)

For automated installation without any user interaction:

```bash
sudo bash cursor.sh -a
```

### Command Line Reference

```
Usage: cursor.sh [OPTION]

Options:
  -a, --auto-install  Auto install Cursor (no prompts, direct installation)
  -i, --install       Install Cursor AI Editor with automatic dependency resolution
  -u, --uninstall     Completely remove Cursor AI Editor from your system
  -p, --update        Update to the latest Cursor AI Editor version
  -r, --reset-ids     Reset Cursor telemetry & request IDs for enhanced privacy
  --about             Show detailed information about Cursor AI Editor
  -h, --help          Display this comprehensive help message
```

#### Practical Examples

Auto install Cursor AI Editor (perfect for automation):
```bash
sudo bash cursor.sh -a
```

Install Cursor AI Editor interactively:
```bash
sudo bash cursor.sh -i
```

Reset your request IDs for improved privacy (no root required):
```bash
bash cursor.sh -r
```

Update to the latest version:
```bash
sudo bash cursor.sh -p
```

## System Requirements

### For Android:
- **Device**: Any Android phone or tablet with ARM64 architecture
- **Android Version**: Android 7.0 or higher recommended
- **App**: Termux with proot-distro and Ubuntu installed
- **Storage**: Minimum 1GB free space recommended
- **RAM**: 3GB or more for optimal performance

### For Linux:
- **Operating System**: Any modern Linux distribution (Ubuntu, Debian, Fedora, Arch, CentOS, etc.)
- **Permissions**: Root access (for installation/uninstallation operations)
- **Dependencies**: Automatically managed (wget, grep, sed, awk, jq)
- **Architecture**: ARM64 or x86_64 processor
- **Storage**: Minimum 500MB free disk space recommended

## Status Information

The installer features an innovative status dashboard that displays:
- Application identification with name verification
- Currently installed version with update availability check
- Latest available version from official repositories
- Color-coded status indicators for better visibility
- System architecture compatibility information

## Enhanced Privacy Controls

Maintain control over your data with advanced privacy features:

```bash
bash cursor.sh -r
```

This command:
- Resets all telemetry identifiers
- Creates secure backups of your original configuration
- Generates new randomized identifiers
- Preserves your editor settings and preferences

## Troubleshooting Guide

### Android-Specific Issues:
1. **Termux Errors**: Ensure you have the latest Termux from F-Droid
2. **proot-distro Issues**: Try `pkg reinstall proot-distro` if encountering problems
3. **Space Limitations**: Android users may need to clear space or use external storage
4. **Performance**: Close background apps for better performance on Android devices

### General Issues:
1. **Permission Errors**: Ensure you have appropriate root privileges when needed
2. **Network Issues**: Verify internet connectivity for downloading application files
3. **Architecture Compatibility**: Confirm your device architecture is supported (ARM64 or x86_64)
4. **Dependency Problems**: The script will automatically install required dependencies

### Common Solutions:
```bash
# Fix dependency issues
sudo bash cursor.sh -i

# Reset configuration if having issues
bash cursor.sh -r

# Check installation status
sudo bash cursor.sh --about
```

## Advanced Features

### Professional ASCII Banner
The installer features a stunning UnQ ASCII art banner that automatically centers itself based on your terminal width for optimal visual experience.

### Smart Progress Tracking
Real-time progress bars show exactly what's happening during installation, extraction, and configuration phases.

### Automatic Fallback
If the latest version can't be fetched, the installer automatically falls back to a stable default version to ensure successful installation.

## Copyright and License

This script is provided under the MIT License - free to use, modify and distribute.

## About the Developer

Developed with ❤️ by **Sandeep Gaddam**  
**Version:** 4.1 - Professional Edition  
**Enhanced by:** UnQ AI  

### Connect with the Developer
- GitHub: [@UnQOfficial](https://github.com/UnQOfficial)
- Repository: [UnQOfficial/cursor](https://github.com/UnQOfficial/cursor)

***

<p align="center">
  <sub>© 2025 Sandeep Gaddam (UnQ). All rights reserved.</sub>
</p>

### Contributing

We welcome contributions! Please feel free to submit issues, feature requests, or pull requests to make this installer even better.

### Star the Repository ⭐

If this installer helped you set up Cursor AI Editor successfully, please consider starring the repository to show your support!

# Cursor AI Editor Installer for Android & Linux | The Ultimate Setup Tool

<div align="center">
  
  
  
  
  
  
  
  **The most comprehensive installer script for Cursor AI Editor on Android devices (via Termux) and Linux systems**
  
  *Bringing the revolutionary AI-powered code editor to mobile developers and Linux users alike (supports both ARM64 & x86_64)*

</div>

<p align="center">
  <img src="logo.jpg" alt="Cursor AI Editor - AI-powered code editor for Android and Linux" width="200">
</p>

<div align="center">
  
  [](https://github.com/UnQOfficial/cursor/releases//stars/UnQOfficial/thub/issues/UnQOffew](#overview)
- [Key Features](#key-features)
- [🚀 Quick Installation](#-quick-installation)
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

***

## 🚀 Quick Installation

### ⚡ **Auto Install** (Fastest - No Prompts)

```bash
# Download and auto-install in one command
curl -fsSL https://raw.githubusercontent.com/UnQOfficial/cursor/main/cursor.sh | sudo bash -s -- -a
```

### 🔥 **One-Line Install** (Interactive)

```bash
curl -fsSL https://raw.githubusercontent.com/UnQOfficial/cursor/main/cursor.sh | bash
```

### 📦 **Manual Installation**

<details>
<summary><b>Click to expand manual installation steps</b></summary>

#### Step 1: Download the Installer
```bash
# Download the professional installer script
curl -L -o cursor.sh https://raw.githubusercontent.com/UnQOfficial/cursor/main/cursor.sh
```

#### Step 2: Make Executable
```bash
# Make the script executable
chmod +x cursor.sh
```

#### Step 3: Run Installer
```bash
# Launch the professional installer (interactive menu)
sudo ./cursor.sh

# OR Auto install without prompts
sudo ./cursor.sh -a
```

</details>

### 🔄 **Alternative: Clone Repository**

```bash
# Clone the complete repository
git clone https://github.com/UnQOfficial/cursor.git

# Navigate to directory
cd cursor

# Launch installer (choose your preferred method)
chmod +x cursor.sh && sudo ./cursor.sh     # Interactive
# OR
chmod +x cursor.sh && sudo ./cursor.sh -a  # Auto install
```

***

## Android Installation Guide

### Setting Up Termux (Prerequisite)

1. Install [Termux from F-Droid](https://f-droid.org/en/packages/com.termux/) (recommended) or Google Play

2. Install a Linux distribution on your Android device using one of these guides:
   
   - **Kali Linux (Option 1)**: [How to Install Kali Linux on Android (No Root) 2025](https://www.kali.org/docs/nethunter/nethunter-rootless/)
   
   - **Ubuntu (Option 2, Recommended)**: [How to Install Ubuntu on Android Without Root](https://github.com/UnQOfficial/ubuntu)

### Installing Cursor on Android

Once you're in the Linux environment (Kali or Ubuntu):

#### 🚀 **Quick Install Commands**

```bash
# Auto install (fastest method)
curl -fsSL https://raw.githubusercontent.com/UnQOfficial/cursor/main/cursor.sh | sudo bash -s -- -a
```

#### 📦 **Manual Install Method**

1. Download the installer script:
   ```bash
   wget https://raw.githubusercontent.com/UnQOfficial/cursor/main/cursor.sh
   ```

2. Make it executable:
   ```bash
   chmod +x cursor.sh
   ```

3. Run the installer with sudo:
   ```bash
   sudo bash cursor.sh -a  # Auto install
   # OR
   sudo bash cursor.sh     # Interactive menu
   ```

> **Note:** If you get "sudo: command not found", install it first with: `apt update && apt install sudo`

***

## Linux Installation Guide

### 💻 **Command Line Usage**

<div align="center">
  <img src="https://img.shields.io/badge/Interface-Terminal%20Based-brightgreen?style=for-the-badge&logo=terminal">
</div>

### 🎮 **Available Commands**

```bash
Usage: cursor.sh [OPTION]

Options:
  -a, --auto-install    Auto install Cursor (no prompts, direct installation)
  -i, --install         Install Cursor AI Editor with automatic dependency resolution
  -u, --uninstall       Completely remove Cursor AI Editor from your system
  -p, --update          Update to the latest Cursor AI Editor version
  -r, --reset-ids       Reset Cursor telemetry & request IDs for enhanced privacy
  --about               Show detailed information about Cursor AI Editor
  -h, --help            Display this comprehensive help message

Examples:
  sudo bash cursor.sh -a     # Auto install without prompts
  sudo bash cursor.sh -i     # Interactive installation
  bash cursor.sh -r          # Reset request IDs
  sudo bash cursor.sh -p     # Update to latest version
```

### 🎯 **Interactive Menu System**

When running without arguments, you'll see:

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║  ██╗   ██╗███╗   ██╗ ██████╗                               ║
║  ██║   ██║████╗  ██║██╔═══██╗                              ║
║  ██║   ██║██╔██╗ ██║██║   ██║                              ║
║  ██║   ██║██║╚██╗██║██║▄▄ ██║                              ║
║  ╚██████╔╝██║ ╚████║╚██████╔╝                              ║
║   ╚═════╝ ╚═╝  ╚═══╝ ╚══▀▀═╝                               ║
║                                                              ║
║                 ┌─────────────────────────┐                 ║
║                 │        cursor           │                 ║
║                 └─────────────────────────┘                 ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝

🚀 Enhanced Cursor AI Editor Installer & Manager 🚀
✨ Author: UnQ Enhanced by AI
🌟 Version: 4.1 - Professional Edition
📌 Modern UI with Advanced Progress Tracking & Auto Install

Select an option:

1) Install Cursor AI Editor
2) Uninstall Cursor AI Editor 
3) Update Cursor AI Editor
4) Reset Request IDs
5) About Cursor
6) Exit
```

***

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

***

## Status Information

The installer features an innovative status dashboard that displays:
- Application identification with name verification
- Currently installed version with update availability check
- Latest available version from official repositories
- Color-coded status indicators for better visibility
- System architecture compatibility information

***

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

***

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

# Force reinstall
sudo bash cursor.sh -a
```

***

## 🛠️ Advanced Features

### 🎯 **Smart Installation System**
- **Automatic Architecture Detection** - No manual configuration needed
- **Dependency Auto-Resolution** - Installs missing packages automatically  
- **Professional ASCII Interface** - Beautiful terminal UI with UnQ branding
- **Progress Visualization** - Real-time progress bars and status indicators
- **Error Recovery** - Intelligent fallback mechanisms
- **Update Management** - Seamless version updates

### 🔧 **Developer Tools**
- **Real-time System Monitoring** - Live status updates
- **Multi-language Support** - Works with various terminal environments
- **Cross-platform Compatibility** - Ubuntu, Debian, Kali, Arch support
- **Automated Testing** - Built-in system verification
- **Privacy Controls** - Advanced telemetry management

***

## 🤝 Contributing

<div align="center">

[
[

</div>

We welcome contributions! Please feel free to submit issues, feature requests, or pull requests to make this installer even better.

### 📝 **Development Setup**
```bash
# Fork the repository on GitHub
git clone https://github.com/YourUsername/cursor.git
cd cursor

# Create a new branch
git checkout -b feature/your-feature-name

# Make your changes and test
./cursor.sh --about  # Test the installer

# Commit your changes
git commit -m "Add: your feature description"

# Push and create a pull request
git push origin feature/your-feature-name
```

***

## 📞 Support & Community

<div align="center">

[
[
[

</div>

### 🆘 **Need Help?**
- 📋 **GitHub Issues** - For bug reports and feature requests
- 💬 **Discussions** - For questions and community support
- 📱 **Telegram** - Join our community chat
- 📧 **Email** - devunq@gmail.com
- 🌟 **Documentation** - Check our [Wiki](https://github.com/UnQOfficial/cursor/wiki)

***

## 📊 Project Stats

<div align="center">



![Lines of code](https://img.shields.io/tokei/lines/="center">

[

This script is provided under the MIT License - free to use, modify and distribute.

**Free to use, modify, and distribute! 🎉**

</div>

***

## About the Developer

<div align="center">
  
**Sandeep Gaddam (UnQ)**

[
[
[

**Version:** 4.1 - Professional Edition  
**Enhanced by:** UnQ AI  

*Passionate Android developer and open-source enthusiast*

**"Making AI-powered development accessible to everyone"**

</div>

### Connect with the Developer
- GitHub: [@UnQOfficial](https://github.com/UnQOfficial)
- Repository: [UnQOfficial/cursor](https://github.com/UnQOfficial/cursor)

***

<div align="center">

### ⭐ **Star History**

[

***

### 🏆 **Project Milestones**

![GitHub milestones](https://img.shields.io/github/milestones/progressp Cursor AI Editor successfully, please consider starring the repository to show your support!

**Made with ❤️ for the Android developer community**

[

</div>

***

<p align="center">
  <sub>© 2025 Sandeep Gaddam (UnQ). All rights reserved.</sub>
</p>

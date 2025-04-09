# Cursor AI Editor Installer for Linux | The Ultimate Setup Tool

<p align="center">
  <img src="logo.jpg" alt="Cursor AI Editor - AI-powered code editor for Linux" width="200">
</p>

> The most comprehensive bash installer script for Cursor AI Editor - the revolutionary AI-powered code editor that helps developers write better code faster on Linux systems (x86_64 & ARM64).

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Architecture: x86_64 & ARM64](https://img.shields.io/badge/Architecture-x86__64%20%26%20ARM64-blue)](https://github.com/MaheshTechnicals/cursor-installer)
[![Bash Script](https://img.shields.io/badge/Language-Bash-green.svg)](https://github.com/MaheshTechnicals/cursor-installer)

## 📋 Table of Contents
- [Overview](#overview)
- [Key Features](#key-features)
- [Installation Guide](#installation-guide)
- [Command Line Reference](#command-line-reference)
- [System Requirements](#system-requirements)
- [Status Information](#status-information)
- [Enhanced Privacy Controls](#enhanced-privacy-controls)
- [Troubleshooting Guide](#troubleshooting-guide)
- [Copyright and License](#copyright-and-license)
- [About the Developer](#about-the-developer)

## Overview

This installer provides a seamless way to install, update, and manage [Cursor AI Editor](https://cursor.sh) - the cutting-edge AI-powered code editor that enhances developer productivity with intelligent code completion, debugging assistance, and GitHub Copilot integration. Perfect for developers seeking a modern IDE experience on Linux platforms.

## Key Features

- 🚀 **One-Click Installation**: Install Cursor AI Editor with a single command on any Linux distribution
- 🔄 **Zero-Downtime Updates**: Update to the latest version instantly without losing your settings
- 🧹 **Complete Uninstallation**: Fully remove Cursor with all configurations when no longer needed
- 🔒 **Enhanced Privacy Controls**: Reset request IDs and telemetry identifiers with a single click
- 📊 **Real-Time Status Monitoring**: View installation status and version information in an elegant interface
- 📱 **Cross-Architecture Support**: Optimized for both x86_64 and ARM64 architectures
- 🔧 **Automatic Dependency Management**: Intelligent detection and installation of required dependencies

## Installation Guide

### Quick Install Method

For fast installation with interactive menu:

```bash
sudo bash cursor.sh
```

### Command Line Reference

```
Usage: cursor.sh [OPTION]

Options:
  -i, --install     Install Cursor AI Editor with automatic dependency resolution
  -u, --uninstall   Completely remove Cursor AI Editor from your system
  -p, --update      Update to the latest Cursor AI Editor version
  -r, --reset-ids   Reset Cursor telemetry & request IDs for enhanced privacy
  -a, --about       Show detailed information about Cursor AI Editor
  -h, --help        Display this comprehensive help message
```

#### Practical Examples

Install Cursor AI Editor directly:
```bash
sudo bash cursor.sh -i
```

Reset your request IDs for improved privacy (no root required):
```bash
bash cursor.sh -r
```

## System Requirements

- **Operating System**: Any modern Linux distribution (Ubuntu, Debian, Fedora, Arch, CentOS, etc.)
- **Permissions**: Root access (for installation/uninstallation operations)
- **Dependencies**: Automatically managed (wget, grep, sed, awk)
- **Architecture**: x86_64 or ARM64 processor
- **Storage**: Minimum 500MB free disk space recommended

## Status Information

The installer features an innovative status dashboard that displays:
- Application identification with name verification
- Currently installed version with update availability check
- Latest available version from official repositories
- Color-coded status indicators for better visibility

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

If you encounter installation or usage issues:

1. **Permission Errors**: Ensure you have appropriate root privileges with `sudo`
2. **Network Issues**: Verify internet connectivity for downloading application files
3. **Architecture Compatibility**: Confirm your system architecture is supported (x86_64 or ARM64)
4. **Dependency Problems**: The script will automatically install required dependencies
5. **Storage Limitations**: Ensure adequate free disk space (minimum 500MB recommended)

## Copyright and License

This script is provided under the MIT License - free to use, modify and distribute.

## About the Developer

Developed with ❤️ by Mahesh Technicals  
Version: 3.0

---

<p align="center">
  <sub>© 2024 Mahesh Technicals. All rights reserved.</sub>
</p>

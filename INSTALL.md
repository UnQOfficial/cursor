# Detailed Installation Instructions

This document provides comprehensive installation instructions for Cursor AI Editor on both Android and Linux platforms.

## Android Installation (with Termux)

### Step 1: Install Termux

1. Download and install Termux from [F-Droid](https://f-droid.org/en/packages/com.termux/) (recommended) or Google Play Store.
2. Open Termux and wait for the initial setup to complete.

### Step 2: Update Termux packages

```bash
pkg update && pkg upgrade -y
```

### Step 3: Install required packages

```bash
pkg install proot-distro wget curl -y
```

### Step 4: Install Ubuntu on Termux

```bash
proot-distro install ubuntu
```

### Step 5: Start Ubuntu

```bash
proot-distro login ubuntu
```

### Step 6: Install Cursor AI Editor

Once you're in Ubuntu:

1. Download the installer script:
   ```bash
   wget https://raw.githubusercontent.com/MaheshTechnicals/cursor-installer/main/cursor.sh
   ```

2. Make the script executable:
   ```bash
   chmod +x cursor.sh
   ```

3. Run the installer:
   ```bash
   bash cursor.sh
   ```

4. Follow the on-screen instructions from the interactive menu.

### Step 7: Starting Cursor on Android

After installation, you'll need to run Cursor from within the Ubuntu environment:

1. Start Ubuntu:
   ```bash
   proot-distro login ubuntu
   ```

2. Launch Cursor:
   ```bash
   cursor --no-sandbox
   ```

## Linux Installation

### Step 1: Download the installer script

```bash
wget https://raw.githubusercontent.com/MaheshTechnicals/cursor-installer/main/cursor.sh
```

### Step 2: Make the script executable

```bash
chmod +x cursor.sh
```

### Step 3: Run the installer with sudo

```bash
sudo bash cursor.sh
```

### Step 4: Follow the interactive menu

Choose option 1 to install Cursor AI Editor, or use any of the other options as needed.

### Alternative: Direct installation with command-line option

```bash
sudo bash cursor.sh -i
```

## Troubleshooting

### Common Issues on Android

1. **"Command not found" errors**: Make sure you're in the Ubuntu environment by running `proot-distro login ubuntu`.

2. **Installation fails**: Ensure you have enough free space (at least 1GB recommended).

3. **Black screen when launching**: Try running with the `--no-sandbox` flag.

4. **Performance issues**: Close background apps to free up memory.

### Common Issues on Linux

1. **Permission errors**: Make sure you're using `sudo` for installation and uninstallation.

2. **Missing dependencies**: The script should handle these automatically, but if it fails, try manually installing: `sudo apt install wget grep sed awk`.

3. **Cursor doesn't launch**: Make sure the symbolic link was created by checking `which cursor`.

For additional help, please [open an issue](https://github.com/MaheshTechnicals/cursor-installer/issues/new) on the GitHub repository. 
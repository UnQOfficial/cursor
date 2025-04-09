# Troubleshooting Guide

This document provides solutions to common issues that may arise when using the Cursor AI Editor Installer on Android (Termux) or Linux platforms.

## Android-Specific Issues

### Termux Installation Problems

**Issue**: Unable to install or update Termux.  
**Solution**: Download the latest version from F-Droid instead of Google Play Store: [Termux on F-Droid](https://f-droid.org/en/packages/com.termux/).

**Issue**: Package installation errors in Termux.  
**Solution**: Update package repositories:
```bash
pkg update && pkg upgrade
```

### proot-distro Issues

**Issue**: proot-distro commands fail or Ubuntu doesn't start.  
**Solution**: Reinstall proot-distro:
```bash
pkg uninstall proot-distro
pkg install proot-distro
```

**Issue**: Ubuntu installation fails.  
**Solution**: Make sure you have enough storage space and try with a clean installation:
```bash
proot-distro remove ubuntu
proot-distro install ubuntu
```

### Storage Issues

**Issue**: "No space left on device" error.  
**Solution**: Free up space by removing unused apps or files, or clear Termux's cache:
```bash
apt clean
rm -rf /var/cache/apt/archives/*
```

### Performance Issues

**Issue**: Cursor runs slowly on Android.  
**Solution**:
- Close background applications to free memory
- Use a lighter desktop environment or window manager
- Add more swap space:
```bash
# Create a 1GB swap file
dd if=/dev/zero of=/path/to/swapfile bs=1M count=1024
chmod 600 /path/to/swapfile
mkswap /path/to/swapfile
swapon /path/to/swapfile
```

## Linux Issues

### Installation Issues

**Issue**: "Permission denied" errors during installation.  
**Solution**: Make sure to run the script with sudo:
```bash
sudo bash cursor.sh
```

**Issue**: Missing dependencies.  
**Solution**: The script should install these automatically, but you can manually install them:
```bash
# For Debian/Ubuntu:
sudo apt install wget grep sed awk

# For Fedora:
sudo dnf install wget grep sed gawk

# For Arch Linux:
sudo pacman -S wget grep sed gawk
```

### AppImage Extraction Issues

**Issue**: AppImage extraction fails.  
**Solution**: Ensure you have FUSE installed:
```bash
# For Debian/Ubuntu:
sudo apt install fuse libfuse2

# For Fedora:
sudo dnf install fuse fuse-libs

# For Arch Linux:
sudo pacman -S fuse2
```

### Symbolic Link Issues

**Issue**: "cursor: command not found" after installation.  
**Solution**: The symbolic link may not have been created correctly. You can create it manually:
```bash
sudo ln -sf /opt/cursor/AppRun /usr/local/bin/cursor
```

### Desktop Integration Issues

**Issue**: Cursor doesn't appear in application menu.  
**Solution**: Update the desktop database:
```bash
sudo update-desktop-database
```

Or launch Cursor directly from terminal:
```bash
cursor --no-sandbox
```

## Request ID Reset Issues

**Issue**: Unable to reset request IDs.  
**Solution**: The configuration file might be missing or have permission issues. Run:
```bash
# Check if configuration directory exists
mkdir -p ~/.config/Cursor/User/globalStorage/

# Set proper permissions
chmod -R 755 ~/.config/Cursor

# Run the reset function
bash cursor.sh -r
```

## Update Issues

**Issue**: Update fails or shows no new version.  
**Solution**: The script may be unable to fetch the latest version information. Try:
```bash
# Force the script to check for updates
wget -q -O- https://raw.githubusercontent.com/oslook/cursor-ai-downloads/refs/heads/main/version-history.json
```

Then run the update again:
```bash
sudo bash cursor.sh -p
```

## If All Else Fails

If you continue to experience issues:

1. Check the [GitHub issues page](https://github.com/MaheshTechnicals/cursor-installer/issues) to see if others have encountered the same problem.

2. Open a new issue with detailed information about your problem, including:
   - Your platform (Android/Linux)
   - Architecture (ARM64/x86_64)
   - Script version
   - Full error messages
   - Steps to reproduce

3. Try a clean installation:
   ```bash
   sudo bash cursor.sh -u   # Uninstall completely
   sudo bash cursor.sh -i   # Fresh installation
   ``` 
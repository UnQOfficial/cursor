#!/bin/bash

################################################################################
#                                                                              #
#  ██╗   ██╗███╗   ██╗ ██████╗                                               #
#  ██║   ██║████╗  ██║██╔═══██╗                                              #
#  ██║   ██║██╔██╗ ██║██║   ██║                                              #
#  ██║   ██║██║╚██╗██║██║▄▄ ██║                                              #
#  ╚██████╔╝██║ ╚████║╚██████╔╝                                              #
#   ╚═════╝ ╚═╝  ╚═══╝ ╚══▀▀═╝                                               #
#                                                                              #
#        ┌─────────────────────────────────────┐                              #
#        │           cursor                    │                              #
#        └─────────────────────────────────────┘                              #
#                                                                              #
#  🚀 Enhanced Cursor AI Editor Installer & Manager 🚀                        #
#  ✨ Author: UnQ Enhanced by AI                                              #
#  🌟 Version: 4.0 - Professional Edition                                     #
#  📌 Modern UI with Advanced Progress Tracking                               #
################################################################################

APP_NAME="Cursor"
APP_VERSION="0.48.6"
ARCH=$(uname -m)
APPIMAGE_URL=""
VERSION_JSON_URL="https://raw.githubusercontent.com/oslook/cursor-ai-downloads/refs/heads/main/version-history.json"

if [[ "$SUDO_USER" ]] && [[ "$EUID" -eq 0 ]]; then
    ACTUAL_HOME=$(eval echo ~$SUDO_USER)
else
    ACTUAL_HOME=$HOME
fi

INSTALL_DIR="/opt/cursor"
DESKTOP_FILE="/usr/share/applications/cursor.desktop"
SYMLINK_PATH="/usr/local/bin/cursor"
TEMP_DIR="/tmp/cursor-installer"
CONFIG_FILE="$ACTUAL_HOME/.config/Cursor/User/globalStorage/storage.json"

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
CYAN="\e[36m"
BLUE="\e[34m"
MAGENTA="\e[35m"
BOLD="\e[1m"
RESET="\e[0m"

print_text() {
    echo -e "$1"
}

print_box() {
    local content=("$@")
    local max_length=0
    local line_length

    for line in "${content[@]}"; do
        line_length=${#line}
        if [[ $line_length -gt $max_length ]]; then
            max_length=$line_length
        fi
    done

    max_length=$((max_length + 8))

    local top_border="${CYAN}${BOLD}╔"
    for ((i=0; i<max_length-2; i++)); do
        top_border+="═"
    done
    top_border+="╗${RESET}"

    local bottom_border="${CYAN}${BOLD}╚"
    for ((i=0; i<max_length-2; i++)); do
        bottom_border+="═"
    done
    bottom_border+="╝${RESET}"

    echo -e "$top_border"
    for line in "${content[@]}"; do
        local padding=$((max_length - ${#line} - 4))
        local left_padding=$((padding / 2))
        local right_padding=$((padding - left_padding))
        
        printf "${CYAN}${BOLD}║${RESET} "
        for ((i=0; i<left_padding; i++)); do printf " "; done
        printf "$line"
        for ((i=0; i<right_padding; i++)); do printf " "; done
        printf " ${CYAN}${BOLD}║${RESET}\n"
    done
    echo -e "$bottom_border"
}

show_progress_bar() {
    local current=$1
    local total=$2
    local message=$3
    local bar_length=50
    local filled_length=$((current * bar_length / total))
    local percentage=$((current * 100 / total))
    
    printf "\r${CYAN}${BOLD}[INFO]${RESET} $message "
    printf "${GREEN}["
    for ((i=0; i<filled_length; i++)); do printf "█"; done
    for ((i=filled_length; i<bar_length; i++)); do printf "░"; done
    printf "] ${percentage}%%${RESET}"
    
    if [[ $current -eq $total ]]; then
        echo
    fi
}

confirm_action() {
    local message=$1
    local default_choice=${2:-"n"}
    
    print_text "${YELLOW}${BOLD}[CONFIRM] $message${RESET}"
    print_text "${CYAN}Are you sure you want to continue? [y/N]:${RESET} "
    read -r choice
    
    choice=${choice:-$default_choice}
    if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
        print_text "${YELLOW}${BOLD}[CANCELLED] Operation cancelled by user.${RESET}"
        return 1
    fi
    return 0
}

check_root() {
    if [[ $EUID -ne 0 ]]; then
        print_text "${RED}${BOLD}[ERROR] Root privileges required for system installation.${RESET}"
        print_text "${YELLOW}Please run with sudo: ${BOLD}sudo $0${RESET}"
        print_text "${YELLOW}Press Enter to return to menu...${RESET}"
        read -r
        return 1
    fi
    return 0
}

install_dependencies() {
    local missing_deps=("$@")
    local use_sudo=""
    
    if [[ $EUID -ne 0 ]]; then
        use_sudo="sudo"
    fi

    if [[ ${#missing_deps[@]} -eq 0 ]]; then
        print_text "${GREEN}${BOLD}[SUCCESS] No dependencies to install.${RESET}"
        return 0
    fi

    print_text "${BLUE}${BOLD}[INFO] Installing dependencies: ${missing_deps[*]}${RESET}"

    local install_success=false

    if command -v apt >/dev/null 2>&1; then
        print_text "${BLUE}${BOLD}[INFO] Using apt package manager...${RESET}"
        if $use_sudo apt update -qq >/dev/null 2>&1 && $use_sudo apt install -y "${missing_deps[@]}" >/dev/null 2>&1; then
            install_success=true
        fi
    elif command -v apt-get >/dev/null 2>&1; then
        print_text "${BLUE}${BOLD}[INFO] Using apt-get package manager...${RESET}"
        if $use_sudo apt-get update -qq >/dev/null 2>&1 && $use_sudo apt-get install -y "${missing_deps[@]}" >/dev/null 2>&1; then
            install_success=true
        fi
    elif command -v dnf >/dev/null 2>&1; then
        print_text "${BLUE}${BOLD}[INFO] Using dnf package manager...${RESET}"
        if $use_sudo dnf install -y "${missing_deps[@]}" >/dev/null 2>&1; then
            install_success=true
        fi
    elif command -v yum >/dev/null 2>&1; then
        print_text "${BLUE}${BOLD}[INFO] Using yum package manager...${RESET}"
        if $use_sudo yum install -y "${missing_deps[@]}" >/dev/null 2>&1; then
            install_success=true
        fi
    elif command -v pacman >/dev/null 2>&1; then
        print_text "${BLUE}${BOLD}[INFO] Using pacman package manager...${RESET}"
        if $use_sudo pacman -Sy --noconfirm "${missing_deps[@]}" >/dev/null 2>&1; then
            install_success=true
        fi
    else
        print_text "${RED}${BOLD}[ERROR] No supported package manager found.${RESET}"
        return 1
    fi

    # Wait a moment for installation to complete
    sleep 2

    # Re-check which dependencies are still missing after installation attempt
    local still_missing=()
    for dep in "${missing_deps[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            still_missing+=("$dep")
        fi
    done

    if [[ ${#still_missing[@]} -gt 0 ]]; then
        print_text "${YELLOW}${BOLD}[WARNING] Some dependencies couldn't be installed: ${still_missing[*]}${RESET}"
        print_text "${YELLOW}${BOLD}[INFO] Trying alternative package names...${RESET}"
        
        # Try alternative names for common packages
        local alt_packages=()
        for dep in "${still_missing[@]}"; do
            case "$dep" in
                "jq")
                    alt_packages+=("jq" "jq-devel" "libjq1")
                    ;;
                "wget")
                    alt_packages+=("wget" "wget2")
                    ;;
                *)
                    alt_packages+=("$dep")
                    ;;
            esac
        done

        # Try installing alternative packages
        if command -v apt >/dev/null 2>&1; then
            $use_sudo apt install -y "${alt_packages[@]}" >/dev/null 2>&1
        elif command -v dnf >/dev/null 2>&1; then
            $use_sudo dnf install -y "${alt_packages[@]}" >/dev/null 2>&1
        elif command -v pacman >/dev/null 2>&1; then
            $use_sudo pacman -S --noconfirm "${alt_packages[@]}" >/dev/null 2>&1
        fi

        sleep 1

        # Final check
        local final_missing=()
        for dep in "${still_missing[@]}"; do
            if ! command -v "$dep" >/dev/null 2>&1; then
                final_missing+=("$dep")
            fi
        done

        if [[ ${#final_missing[@]} -gt 0 ]]; then
            print_text "${YELLOW}${BOLD}[WARNING] Could not install: ${final_missing[*]}${RESET}"
            print_text "${YELLOW}${BOLD}[INFO] Script will continue, but some features may not work properly.${RESET}"
            return 0  # Don't fail completely, just warn
        fi
    fi

    print_text "${GREEN}${BOLD}[SUCCESS] All dependencies installed successfully!${RESET}"
    return 0
}

check_dependencies() {
    local deps=("wget" "grep" "sed" "awk" "jq")
    local missing_deps=()

    print_text "${YELLOW}${BOLD}[INFO] Checking system dependencies...${RESET}"

    for i in "${!deps[@]}"; do
        show_progress_bar $((i+1)) ${#deps[@]} "Checking ${deps[$i]}"
        if ! command -v "${deps[$i]}" >/dev/null 2>&1; then
            missing_deps+=("${deps[$i]}")
        fi
        sleep 0.1
    done

    if [[ ${#missing_deps[@]} -gt 0 ]]; then
        print_text "${YELLOW}${BOLD}[INFO] Missing dependencies: ${missing_deps[*]}${RESET}"
        if confirm_action "Install missing dependencies automatically?"; then
            if install_dependencies "${missing_deps[@]}"; then
                print_text "${GREEN}${BOLD}[SUCCESS] Dependencies installed successfully!${RESET}"
                return 0
            else
                print_text "${YELLOW}${BOLD}[WARNING] Some dependencies may be missing, but continuing...${RESET}"
                return 0  # Continue anyway
            fi
        else
            print_text "${YELLOW}${BOLD}[WARNING] Continuing without installing dependencies...${RESET}"
            return 0  # Continue anyway
        fi
    fi

    print_text "${GREEN}${BOLD}[SUCCESS] All dependencies satisfied!${RESET}"
    return 0
}

display_header() {
    clear
    local content=(
        ""
        "${CYAN}${BOLD}UnQ Enhanced Cursor Manager${RESET}"
        "${CYAN}${BOLD}Professional Installation Suite${RESET}"
        ""
        "${MAGENTA}${BOLD}Version 4.0 - Advanced Edition${RESET}"
        ""
    )
    print_box "${content[@]}"
    echo
}

create_temp_dir() {
    print_text "${YELLOW}${BOLD}[INFO] Setting up workspace...${RESET}"
    mkdir -p "$TEMP_DIR"
    cd "$TEMP_DIR" || {
        print_text "${RED}${BOLD}[ERROR] Failed to create workspace.${RESET}"
        return 1
    }
    return 0
}

cleanup() {
    print_text "${YELLOW}${BOLD}[INFO] Cleaning up temporary files...${RESET}"
    cd / || true
    rm -rf "$TEMP_DIR"
}

fetch_download_urls() {
    print_text "${YELLOW}${BOLD}[INFO] Fetching latest version information...${RESET}"
    
    local response
    if command -v curl >/dev/null 2>&1; then
        response=$(curl -s --connect-timeout 10 --max-time 15 "$VERSION_JSON_URL" 2>/dev/null)
    elif command -v wget >/dev/null 2>&1; then
        response=$(wget --timeout=10 --tries=2 -qO- "$VERSION_JSON_URL" 2>/dev/null)
    else
        print_text "${YELLOW}${BOLD}[WARNING] No download tool available, using default version.${RESET}"
        return 0
    fi

    if [[ -z "$response" ]]; then
        print_text "${YELLOW}${BOLD}[WARNING] Could not fetch version info, using default version.${RESET}"
        return 0
    fi

    if command -v jq >/dev/null 2>&1; then
        local new_version=$(echo "$response" | jq -r '.versions[0].version' 2>/dev/null)
        
        if [[ -n "$new_version" && "$new_version" != "null" ]]; then
            APP_VERSION="$new_version"
            
            if [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
                APPIMAGE_URL=$(echo "$response" | jq -r '.versions[0].platforms["linux-arm64"]' 2>/dev/null)
            elif [[ "$ARCH" == "x86_64" ]]; then
                APPIMAGE_URL=$(echo "$response" | jq -r '.versions[0].platforms["linux-x64"]' 2>/dev/null)
            fi
        fi
    fi

    print_text "${GREEN}${BOLD}[SUCCESS] Version ${APP_VERSION} available for ${ARCH}${RESET}"
    return 0
}

install_cursor() {
    display_header
    
    if ! check_root; then
        return 1
    fi

    if ! confirm_action "Install Cursor AI Editor v${APP_VERSION}?"; then
        return 1
    fi

    check_dependencies || {
        print_text "${YELLOW}${BOLD}[WARNING] Continuing with dependency issues...${RESET}"
    }

    print_text "${CYAN}${BOLD}[1/5] Preparing installation environment...${RESET}"
    create_temp_dir || return 1

    print_text "${CYAN}${BOLD}[2/5] Fetching version information...${RESET}"
    fetch_download_urls

    print_text "${CYAN}${BOLD}[3/5] Downloading Cursor AI Editor...${RESET}"
    if [[ -z "$APPIMAGE_URL" ]]; then
        if [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
            APPIMAGE_URL="https://downloads.cursor.com/production/1649e229afdef8fd1d18ea173f063563f1e722ef/linux/arm64/Cursor-${APP_VERSION}-aarch64.AppImage"
        else
            APPIMAGE_URL="https://downloads.cursor.com/production/1649e229afdef8fd1d18ea173f063563f1e722ef/linux/x64/Cursor-${APP_VERSION}-x86_64.AppImage"
        fi
    fi

    if ! wget -q --timeout=30 --tries=3 --show-progress -O Cursor.AppImage "$APPIMAGE_URL" 2>/dev/null; then
        print_text "${RED}${BOLD}[ERROR] Download failed. Please check your internet connection.${RESET}"
        cleanup
        return 1
    fi

    print_text "${CYAN}${BOLD}[4/5] Processing AppImage...${RESET}"
    if ! chmod +x Cursor.AppImage; then
        print_text "${RED}${BOLD}[ERROR] Permission setup failed.${RESET}"
        cleanup
        return 1
    fi

    print_text "${YELLOW}${BOLD}[INFO] Extracting AppImage (this may take a moment)...${RESET}"
    if ! ./Cursor.AppImage --appimage-extract >/dev/null 2>&1; then
        print_text "${RED}${BOLD}[ERROR] Extraction failed.${RESET}"
        cleanup
        return 1
    fi

    if [[ ! -d "squashfs-root" ]]; then
        print_text "${RED}${BOLD}[ERROR] Extraction directory not found.${RESET}"
        cleanup
        return 1
    fi

    print_text "${CYAN}${BOLD}[5/5] Installing system-wide...${RESET}"
    
    if [[ -d "$INSTALL_DIR" ]]; then
        rm -rf "$INSTALL_DIR"
    fi
    
    mkdir -p "$INSTALL_DIR"
    if ! cp -r squashfs-root/* "$INSTALL_DIR/"; then
        print_text "${RED}${BOLD}[ERROR] Installation failed.${RESET}"
        cleanup
        return 1
    fi

    ln -sf "$INSTALL_DIR/AppRun" "$SYMLINK_PATH"

    cat > "$DESKTOP_FILE" << EOF
[Desktop Entry]
Name=Cursor
Comment=The AI-powered Code Editor - UnQ Enhanced
GenericName=Text Editor
Exec=cursor --no-sandbox %F
Icon=$INSTALL_DIR/co.anysphere.cursor.png
Type=Application
StartupNotify=true
StartupWMClass=Cursor
Categories=TextEditor;Development;IDE;Utility;
MimeType=text/plain;application/x-cursor-workspace;
Actions=new-empty-window;
Keywords=cursor;code;editor;programming;developer;ai;unq;
X-AppImage-Version=$APP_VERSION

[Desktop Action new-empty-window]
Name=New Empty Window
Exec=cursor --no-sandbox --new-window %F
Icon=$INSTALL_DIR/co.anysphere.cursor.png
EOF

    chmod +x "$INSTALL_DIR/AppRun"
    chmod +x "$DESKTOP_FILE"
    update-desktop-database >/dev/null 2>&1 || true

    cleanup

    echo
    print_text "${GREEN}${BOLD}✅ Installation Complete!${RESET}"
    
    local success_content=(
        ""
        "${MAGENTA}${BOLD}Cursor AI Editor v${APP_VERSION}${RESET}"
        "${GREEN}${BOLD}Successfully Installed${RESET}"
        ""
    )
    print_box "${success_content[@]}"

    print_text "${CYAN}${BOLD}Launch Options:${RESET}"
    print_text "• Application Menu: Search for 'Cursor'"
    print_text "• Terminal: ${BOLD}cursor --no-sandbox${RESET}"
}

uninstall_cursor() {
    display_header
    
    if ! check_root; then
        return 1
    fi

    if [[ ! -d "$INSTALL_DIR" ]]; then
        print_text "${YELLOW}${BOLD}[WARNING] Cursor is not installed.${RESET}"
        return 1
    fi

    if ! confirm_action "Remove Cursor AI Editor completely?"; then
        return 1
    fi

    print_text "${CYAN}${BOLD}[1/3] Removing installation directory...${RESET}"
    rm -rf "$INSTALL_DIR"
    
    print_text "${CYAN}${BOLD}[2/3] Removing system links...${RESET}"
    rm -f "$SYMLINK_PATH"
    
    print_text "${CYAN}${BOLD}[3/3] Cleaning desktop integration...${RESET}"
    rm -f "$DESKTOP_FILE"
    update-desktop-database >/dev/null 2>&1 || true

    print_text "${GREEN}${BOLD}✅ Uninstallation Complete!${RESET}"
    
    local uninstall_content=(
        ""
        "${MAGENTA}${BOLD}Cursor AI Editor${RESET}"
        "${GREEN}${BOLD}Successfully Removed${RESET}"
        ""
    )
    print_box "${uninstall_content[@]}"
}

update_cursor() {
    display_header
    
    if ! check_root; then
        return 1
    fi

    if [[ ! -d "$INSTALL_DIR" ]]; then
        print_text "${YELLOW}${BOLD}[WARNING] Cursor is not installed.${RESET}"
        print_text "${CYAN}Would you like to install it instead? [y/N]:${RESET} "
        read -r choice
        if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
            install_cursor
        fi
        return 1
    fi

    fetch_download_urls
    
    local installed_version="unknown"
    if [[ -f "$DESKTOP_FILE" ]]; then
        installed_version=$(grep -oP 'X-AppImage-Version=\K.*' "$DESKTOP_FILE" 2>/dev/null || echo "unknown")
    fi

    print_text "${CYAN}${BOLD}Current Version:${RESET} $installed_version"
    print_text "${CYAN}${BOLD}Latest Version:${RESET} $APP_VERSION"

    if [[ "$installed_version" == "$APP_VERSION" ]]; then
        print_text "${GREEN}${BOLD}[INFO] Already up to date!${RESET}"
        if ! confirm_action "Reinstall current version?"; then
            return 1
        fi
    else
        if ! confirm_action "Update to version ${APP_VERSION}?"; then
            return 1
        fi
    fi

    install_cursor
}

generate_hex_string() {
    local length=$1
    if command -v xxd >/dev/null 2>&1; then
        head -c $((length/2)) /dev/urandom | xxd -p | tr -d '\n' | head -c $length
    elif command -v openssl >/dev/null 2>&1; then
        openssl rand -hex $((length/2)) | tr -d '\n' | head -c $length
    else
        local result=""
        local chars="0123456789abcdef"
        for ((i=0; i<length; i++)); do
            result+="${chars:$((RANDOM%16)):1}"
        done
        echo -n "$result"
    fi
}

generate_uuid() {
    if command -v uuidgen >/dev/null 2>&1; then
        uuidgen | tr -d '\n'
    else
        local hex=$(generate_hex_string 32)
        echo -n "${hex:0:8}-${hex:8:4}-4${hex:13:3}-${hex:16:4}-${hex:20:12}"
    fi
}

reset_request_ids() {
    display_header

    if [[ ! -f "$CONFIG_FILE" ]]; then
        mkdir -p "$(dirname "$CONFIG_FILE")"
        echo "{}" > "$CONFIG_FILE"
    fi

    if [[ ! -w "$CONFIG_FILE" ]] && [[ $EUID -ne 0 ]]; then
        print_text "${RED}${BOLD}[ERROR] No write permission for config file.${RESET}"
        print_text "${YELLOW}Try running with sudo or check file permissions.${RESET}"
        return 1
    fi

    if ! confirm_action "Reset Cursor telemetry and request IDs?"; then
        return 1
    fi

    print_text "${CYAN}${BOLD}[1/3] Creating backup...${RESET}"
    if [[ ! -f "${CONFIG_FILE}.bak" ]]; then
        cp "$CONFIG_FILE" "${CONFIG_FILE}.bak" 2>/dev/null
    fi

    print_text "${CYAN}${BOLD}[2/3] Generating new IDs...${RESET}"
    local new_machine_id=$(generate_hex_string 64)
    local new_mac_id=$(generate_hex_string 64)
    local new_device_id=$(generate_uuid)

    print_text "${CYAN}${BOLD}[3/3] Updating configuration...${RESET}"

    cat > "$CONFIG_FILE" << EOF
{
  "telemetry.machineId": "${new_machine_id}",
  "telemetry.macMachineId": "${new_mac_id}",
  "telemetry.devDeviceId": "${new_device_id}",
  "telemetry.sqmId": ""
}
EOF

    if [[ "$SUDO_USER" ]] && [[ "$EUID" -eq 0 ]]; then
        chown $SUDO_USER:$(id -gn $SUDO_USER) "$CONFIG_FILE"
    fi

    print_text "${GREEN}${BOLD}✅ Request IDs Reset Complete!${RESET}"
    
    local reset_content=(
        ""
        "${MAGENTA}${BOLD}Privacy Enhanced${RESET}"
        "${GREEN}${BOLD}New IDs Generated${RESET}"
        ""
    )
    print_box "${reset_content[@]}"

    print_text "${YELLOW}${BOLD}Please restart Cursor for changes to take effect.${RESET}"
}

show_about() {
    display_header
    
    print_text "${CYAN}${BOLD}About Cursor AI Editor${RESET}"
    print_text "${CYAN}═══════════════════════${RESET}"
    echo
    
    print_text "${YELLOW}Cursor is an AI-first code editor built for productivity.${RESET}"
    echo
    
    print_text "${BOLD}Key Features:${RESET}"
    print_text "• AI-powered code completions"
    print_text "• Intelligent refactoring suggestions"
    print_text "• Built-in AI chat assistant"
    print_text "• Enhanced VS Code compatibility"
    echo
    
    print_text "${BOLD}Enhanced Installer Info:${RESET}"
    print_text "• Version: 4.0 Professional"
    print_text "• Enhanced by: UnQ AI"
    print_text "• Architecture: $ARCH"
    print_text "• Latest Version: $APP_VERSION"
    echo
    
    print_text "${YELLOW}Press Enter to continue...${RESET}"
    read -r
}

display_status_table() {
    local installed_version="Not Installed"
    
    if [[ -d "$INSTALL_DIR" ]]; then
        if [[ -f "$DESKTOP_FILE" ]]; then
            installed_version=$(grep -oP 'X-AppImage-Version=\K.*' "$DESKTOP_FILE" 2>/dev/null || echo "Unknown")
        else
            installed_version="Unknown"
        fi
    fi

    if [[ -z "$APP_VERSION" || "$APP_VERSION" == "0.48.6" ]]; then
        fetch_download_urls >/dev/null 2>&1
    fi

    local table_width=60
    local top_border="${CYAN}${BOLD}╔"
    for ((i=0; i<table_width-2; i++)); do top_border+="═"; done
    top_border+="╗${RESET}"
    
    local bottom_border="${CYAN}${BOLD}╚"
    for ((i=0; i<table_width-2; i++)); do bottom_border+="═"; done
    bottom_border+="╝${RESET}"

    echo -e "$top_border"
    printf "${CYAN}${BOLD}║${RESET} %-20s ${CYAN}${BOLD}║${RESET} %-33s ${CYAN}${BOLD}║${RESET}\n" "System Status" "Cursor AI Editor"
    printf "${CYAN}${BOLD}║${RESET}%*s${CYAN}${BOLD}║${RESET}\n" $((table_width-2)) ""
    printf "${CYAN}${BOLD}║${RESET} %-20s ${CYAN}${BOLD}║${RESET} %-33s ${CYAN}${BOLD}║${RESET}\n" "Architecture:" "$ARCH"
    printf "${CYAN}${BOLD}║${RESET} %-20s ${CYAN}${BOLD}║${RESET} %-33s ${CYAN}${BOLD}║${RESET}\n" "Installed:" "$installed_version"
    printf "${CYAN}${BOLD}║${RESET} %-20s ${CYAN}${BOLD}║${RESET} %-33s ${CYAN}${BOLD}║${RESET}\n" "Latest Available:" "$APP_VERSION"
    echo -e "$bottom_border"
    echo
}

ask_main_menu() {
    echo
    print_text "${GREEN}${BOLD}Operation completed successfully!${RESET}"
    echo
    print_text "${YELLOW}Return to main menu? [Y/n]:${RESET} "
    read -r menu_choice
    
    if [[ "$menu_choice" == "n" || "$menu_choice" == "N" ]]; then
        clear
        print_text "${GREEN}${BOLD}Thank you for using UnQ Enhanced Cursor Manager!${RESET}"
        exit 0
    fi
}

main_menu() {
    while true; do
        display_header
        display_status_table
        
        print_text "${CYAN}${BOLD}Select an option:${RESET}"
        echo
        print_text "1) ${GREEN}${BOLD}Install${RESET} Cursor AI Editor"
        print_text "2) ${RED}${BOLD}Uninstall${RESET} Cursor AI Editor" 
        print_text "3) ${BLUE}${BOLD}Update${RESET} Cursor AI Editor"
        print_text "4) ${MAGENTA}${BOLD}Reset Request IDs${RESET}"
        print_text "5) ${YELLOW}${BOLD}About${RESET} Cursor"
        print_text "6) ${CYAN}${BOLD}Exit${RESET}"
        echo
        
        print_text "${CYAN}Enter your choice [1-6]:${RESET} "
        read -r choice
        
        case "$choice" in
            1)
                install_cursor
                ask_main_menu
                ;;
            2)
                uninstall_cursor
                ask_main_menu
                ;;
            3)
                update_cursor
                ask_main_menu
                ;;
            4)
                reset_request_ids
                ask_main_menu
                ;;
            5)
                show_about
                ;;
            6)
                clear
                print_text "${GREEN}${BOLD}Thank you for using UnQ Enhanced Cursor Manager!${RESET}"
                print_text "${CYAN}Goodbye!${RESET}"
                exit 0
                ;;
            *)
                print_text "${RED}${BOLD}[ERROR] Invalid choice!${RESET}"
                print_text "${YELLOW}Press Enter to continue...${RESET}"
                read -r
                ;;
        esac
    done
}

case "${1:-}" in
    -i|--install)
        install_cursor
        ;;
    -u|--uninstall) 
        uninstall_cursor
        ;;
    -p|--update)
        update_cursor
        ;;
    -r|--reset-ids)
        reset_request_ids
        ;;
    -a|--about)
        show_about
        ;;
    -h|--help)
        print_text "${CYAN}${BOLD}UnQ Enhanced Cursor Manager v4.0${RESET}"
        print_text "${CYAN}Usage: $0 [OPTION]${RESET}"
        echo
        print_text "${BOLD}Options:${RESET}"
        print_text "  -i, --install     Install Cursor AI Editor"
        print_text "  -u, --uninstall   Uninstall Cursor AI Editor" 
        print_text "  -p, --update      Update Cursor AI Editor"
        print_text "  -r, --reset-ids   Reset telemetry IDs"
        print_text "  -a, --about       Show about information"
        print_text "  -h, --help        Show this help"
        echo
        print_text "${YELLOW}If no option provided, interactive menu will start.${RESET}"
        ;;
    *)
        main_menu
        ;;
esac

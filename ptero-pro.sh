#!/bin/bash

# =================================================================
# Project:   Ptero-Pro Manager
# Version:   2.0.0
# Author:    YourGitHubUsername
# License:   MIT
# Description: Advanced TUI for Pterodactyl Panel & Wings
# =================================================================

# Color & UI Definitions
export NEWT_COLORS='
  root=,blue
  window=,lightgray
  border=black,lightgray
  shadow=,gray
  button=white,blue
  actbutton=white,red
  compactbutton=white,blue
  title=blue,lightgray
  textbox=black,lightgray
  acttextbox=white,blue
  entry=black,lightgray
  disentry=gray,lightgray
  checkbox=black,lightgray
  actcheckbox=white,blue
  listbox=black,lightgray
  actlistbox=white,blue
'

# Constants
TITLE="Ptero-Pro Manager v2.0"
LOG_FILE="/var/log/ptero_pro.log"

# --- Core Functions ---

exit_script() {
    clear
    echo "Ptero-Pro: Management session ended."
    exit 0
}

# Ensure root
if [[ $EUID -ne 0 ]]; then
   whiptail --title "Access Denied" --msgbox "This script must be run as root. Please use sudo." 8 45
   exit 1
fi

# Pre-flight system check
check_system() {
    RAM=$(free -m | awk '/^Mem:/{print $2}')
    if [ "$RAM" -lt 1900 ]; then
        whiptail --title "Hardware Warning" --yesno "You have less than 2GB of RAM. Pterodactyl might be unstable. Continue anyway?" 8 60
        if [ $? -ne 0 ]; then exit_script; fi
    fi
}

# Advanced Tuning (The "Expert" Touch)
apply_tuning() {
    {
        echo 20; sleep 1
        # Kernel optimizations for UDP/Game traffic
        cat <<EOF > /etc/sysctl.d/99-ptero.conf
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
EOF
        sysctl -p /etc/sysctl.d/99-ptero.conf > /dev/null
        echo 60; sleep 1
        
        # Swap file creation if missing
        if [ $(free -m | grep Swap | awk '{print $2}') -eq 0 ]; then
            fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
            echo '/swapfile none swap sw 0 0' >> /etc/fstab
        fi
        echo 100; sleep 1
    } | whiptail --title "System Optimization" --gauge "Applying kernel tweaks and swap configuration..." 8 60 0
}

# --- Menu Sections ---

maintenance_menu() {
    M_CHOICE=$(whiptail --title "$TITLE - Maintenance" --menu "Select a maintenance task:" 15 60 5 \
    "1" "Update Panel (Latest GitHub Release)" \
    "2" "Fix Permissions (Chown/Chmod)" \
    "3" "Renew SSL Certificates" \
    "4) " "Database Backup" \
    "5" "<-- Back to Main Menu" 3>&1 1>&2 2>&3)

    case $M_CHOICE in
        1) 
            cd /var/www/pterodactyl && php artisan down
            curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv
            composer install --no-dev --optimize-autoloader
            php artisan view:clear && php artisan config:clear
            php artisan migrate --seed --force
            chown -R www-data:www-data /var/www/pterodactyl/*
            php artisan up
            whiptail --title "Success" --msgbox "Panel updated successfully!" 8 45
            maintenance_menu
            ;;
        2)
            chown -R www-data:www-data /var/www/pterodactyl/*
            whiptail --title "Fixed" --msgbox "Permissions restored to www-data." 8 45
            maintenance_menu
            ;;
        3)
            certbot renew
            maintenance_menu
            ;;
        5) main_menu ;;
    esac
}

install_menu() {
    I_CHOICE=$(whiptail --title "$TITLE - Installation" --menu "What would you like to install?" 15 60 4 \
    "1" "Full Stack (Panel + Wings + Database)" \
    "2" "Panel Only (Web Interface)" \
    "3" "Wings Only (Node Agent)" \
    "4" "<-- Back" 3>&1 1>&2 2>&3)

    case $I_CHOICE in
        1) apply_tuning; bash <(curl -s https://pterodactyl-installer.se) <<EOF
2
EOF
        ;;
        2) bash <(curl -s https://pterodactyl-installer.se) <<EOF
0
EOF
        ;;
        3) bash <(curl -s https://pterodactyl-installer.se) <<EOF
1
EOF
        ;;
        4) main_menu ;;
    esac
}

main_menu() {
    CHOICE=$(whiptail --title "$TITLE" --menu "Manage your Pterodactyl Instance:" 15 60 5 \
    "1" "🚀 Installation Menu" \
    "2" "🔧 Maintenance & Security" \
    "3" "📊 System Health Check" \
    "4" "📁 View Error Logs" \
    "5" "❌ Exit" 3>&1 1>&2 2>&3)

    case $CHOICE in
        1) install_menu ;;
        2) maintenance_menu ;;
        3) 
            HEALTH=$(free -h && df -h / && uptime)
            whiptail --title "System Health" --msgbox "$HEALTH" 15 70
            main_menu
            ;;
        4)
            LOG=$(tail -n 20 /var/www/pterodactyl/storage/logs/laravel-$(date +%Y-%m-%d).log 2>/dev/null || echo "No logs found for today.")
            whiptail --title "Recent Logs" --msgbox "$LOG" 20 80
            main_menu
            ;;
        5) exit_script ;;
    esac
}

# --- Entry Point ---
check_system
main_menu#!/bin/bash

# =================================================================
# Project:   Ptero-Pro Manager
# Version:   2.0.0
# Author:    YourGitHubUsername
# License:   MIT
# Description: Advanced TUI for Pterodactyl Panel & Wings
# =================================================================

# Color & UI Definitions
export NEWT_COLORS='
  root=,blue
  window=,lightgray
  border=black,lightgray
  shadow=,gray
  button=white,blue
  actbutton=white,red
  compactbutton=white,blue
  title=blue,lightgray
  textbox=black,lightgray
  acttextbox=white,blue
  entry=black,lightgray
  disentry=gray,lightgray
  checkbox=black,lightgray
  actcheckbox=white,blue
  listbox=black,lightgray
  actlistbox=white,blue
'

# Constants
TITLE="Ptero-Pro Manager v2.0"
LOG_FILE="/var/log/ptero_pro.log"

# --- Core Functions ---

exit_script() {
    clear
    echo "Ptero-Pro: Management session ended."
    exit 0
}

# Ensure root
if [[ $EUID -ne 0 ]]; then
   whiptail --title "Access Denied" --msgbox "This script must be run as root. Please use sudo." 8 45
   exit 1
fi

# Pre-flight system check
check_system() {
    RAM=$(free -m | awk '/^Mem:/{print $2}')
    if [ "$RAM" -lt 1900 ]; then
        whiptail --title "Hardware Warning" --yesno "You have less than 2GB of RAM. Pterodactyl might be unstable. Continue anyway?" 8 60
        if [ $? -ne 0 ]; then exit_script; fi
    fi
}

# Advanced Tuning (The "Expert" Touch)
apply_tuning() {
    {
        echo 20; sleep 1
        # Kernel optimizations for UDP/Game traffic
        cat <<EOF > /etc/sysctl.d/99-ptero.conf
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
EOF
        sysctl -p /etc/sysctl.d/99-ptero.conf > /dev/null
        echo 60; sleep 1
        
        # Swap file creation if missing
        if [ $(free -m | grep Swap | awk '{print $2}') -eq 0 ]; then
            fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
            echo '/swapfile none swap sw 0 0' >> /etc/fstab
        fi
        echo 100; sleep 1
    } | whiptail --title "System Optimization" --gauge "Applying kernel tweaks and swap configuration..." 8 60 0
}

# --- Menu Sections ---

maintenance_menu() {
    M_CHOICE=$(whiptail --title "$TITLE - Maintenance" --menu "Select a maintenance task:" 15 60 5 \
    "1" "Update Panel (Latest GitHub Release)" \
    "2" "Fix Permissions (Chown/Chmod)" \
    "3" "Renew SSL Certificates" \
    "4) " "Database Backup" \
    "5" "<-- Back to Main Menu" 3>&1 1>&2 2>&3)

    case $M_CHOICE in
        1) 
            cd /var/www/pterodactyl && php artisan down
            curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv
            composer install --no-dev --optimize-autoloader
            php artisan view:clear && php artisan config:clear
            php artisan migrate --seed --force
            chown -R www-data:www-data /var/www/pterodactyl/*
            php artisan up
            whiptail --title "Success" --msgbox "Panel updated successfully!" 8 45
            maintenance_menu
            ;;
        2)
            chown -R www-data:www-data /var/www/pterodactyl/*
            whiptail --title "Fixed" --msgbox "Permissions restored to www-data." 8 45
            maintenance_menu
            ;;
        3)
            certbot renew
            maintenance_menu
            ;;
        5) main_menu ;;
    esac
}

install_menu() {
    I_CHOICE=$(whiptail --title "$TITLE - Installation" --menu "What would you like to install?" 15 60 4 \
    "1" "Full Stack (Panel + Wings + Database)" \
    "2" "Panel Only (Web Interface)" \
    "3" "Wings Only (Node Agent)" \
    "4" "<-- Back" 3>&1 1>&2 2>&3)

    case $I_CHOICE in
        1) apply_tuning; bash <(curl -s https://pterodactyl-installer.se) <<EOF
2
EOF
        ;;
        2) bash <(curl -s https://pterodactyl-installer.se) <<EOF
0
EOF
        ;;
        3) bash <(curl -s https://pterodactyl-installer.se) <<EOF
1
EOF
        ;;
        4) main_menu ;;
    esac
}

main_menu() {
    CHOICE=$(whiptail --title "$TITLE" --menu "Manage your Pterodactyl Instance:" 15 60 5 \
    "1" "🚀 Installation Menu" \
    "2" "🔧 Maintenance & Security" \
    "3" "📊 System Health Check" \
    "4" "📁 View Error Logs" \
    "5" "❌ Exit" 3>&1 1>&2 2>&3)

    case $CHOICE in
        1) install_menu ;;
        2) maintenance_menu ;;
        3) 
            HEALTH=$(free -h && df -h / && uptime)
            whiptail --title "System Health" --msgbox "$HEALTH" 15 70
            main_menu
            ;;
        4)
            LOG=$(tail -n 20 /var/www/pterodactyl/storage/logs/laravel-$(date +%Y-%m-%d).log 2>/dev/null || echo "No logs found for today.")
            whiptail --title "Recent Logs" --msgbox "$LOG" 20 80
            main_menu
            ;;
        5) exit_script ;;
    esac
}

# --- Entry Point ---
check_system
main_menu

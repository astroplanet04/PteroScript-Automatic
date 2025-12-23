# 🦖 PteroScript-Automatic Utility v2.1

[![Version](https://img.shields.io/badge/version-2.1.0-blue.svg)](https://github.com/tuo-username/ptero-pro)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Ubuntu%20%7C%20Debian-orange.svg)]()

**Ptero-Pro Master** is an advanced, high-performance TUI (Text User Interface) utility designed to deploy, optimize, and manage Pterodactyl Panel and Wings nodes. Unlike standard installers, this tool focuses on **Enterprise-level hardening** and **Kernel-level performance tuning**.

---

## 📝 At a Glance: What does this script do?
- **Smart Installation:** Automated configuration of the Panel, Wings agent, and MariaDB database.
- **Kernel Optimization:** Tunes Linux network parameters (`sysctl`) to efficiently handle high-volume UDP/TCP traffic—ideal for high-performance Game Servers.
- **Advanced Security:** Out-of-the-box setup for UFW (Uncomplicated Firewall) and proactive brute-force protection via Fail2Ban.
- **Database Tuning:** Dynamically calculates available system RAM to optimize MariaDB buffer settings for peak database speed.
- **Pro Maintenance:** A comprehensive toolkit for automated backups, seamless panel updates, and Discord webhook notifications.

---
## 🛠️ Enterprise-Grade Features & Roadmap
This script implements advanced system optimizations that go beyond a simple installation. Here is the feature checklist:

### 🚀 Core System & Deployment
- [x] **Multi-OS Compatibility Check:** Granular verification for Ubuntu 20.04+ and Debian 11+.
- [x] **Auto-Dependency Management:** Automatic installation of `curl`, `tar`, `unzip`, `git`, and `socat`.
- [x] **Smart Swap Creation:** Automated 2GB swap file generation to prevent OOM (Out of Memory) crashes.
- [x] **Interactive TUI:** Professional Text User Interface built with `whiptail`.

### ⚡ Performance & Tuning
- [x] **Kernel Network Optimization:** Custom `sysctl` settings for high-performance UDP/TCP game traffic.
- [x] **MariaDB Auto-Scaling:** Dynamic calculation of `innodb_buffer_pool_size` based on total system RAM.
- [x] **PHP-FPM Tuning:** Optimized process manager settings for faster dashboard responsiveness.
- [x] **Redis Integration:** Pre-configured caching for lightning-fast panel sessions.

### 🛡️ Security & Hardening
- [x] **UFW Firewall Automation:** One-click security setup for all Pterodactyl-required ports.
- [x] **Fail2Ban Proactive Defense:** Custom jails and filters to mitigate brute-force attacks on Nginx.
- [x] **Directory Hardening:** Automated permission enforcement (Chown/Chmod) across the stack.
- [] **SSL DNS-01 Challenge Support:** (Coming Soon) Support for Cloudflare/DNS-based SSL.

### 🔧 Maintenance & DevOps
- [x] **One-Click Update Suite:** Automated panel updates directly from GitHub releases.
- [x] **Docker Health Manager:** Instant pruning of dangling images, old volumes, and massive logs.
- [x] **Discord Webhook Integration:** Real-time notifications for deployment and maintenance status.
- [x] **Automated Database Backups:** Local SQL dumps with compression support.
- [x] **System Health Monitor:** Real-time dashboard for RAM, CPU load, and Disk usage.

---

## 🔥 Key Features

### 🚀 Performance & Deployment
*   **Zero-Config Install:** Handles PHP 8.x, Composer, Redis, and Nginx dependencies automatically.
*   **Kernel Sysctl Tuning:** Reduced latency and improved packet handling for high-performance gaming.
*   **MariaDB Auto-Scaling:** Dynamic allocation of `innodb_buffer_pool_size` based on system hardware.

### 🛡️ Security & Hardening
*   **Automated Firewall:** Pre-configured UFW rules for Pterodactyl ports.
*   **Fail2Ban Integration:** Custom jails for Nginx and Panel authentication protection.
*   **Automatic Swap Management:** Prevents OOM (Out Of Memory) crashes on small VPS instances.

### 🛠️ Maintenance & DevOps
*   **One-Click Updates:** Updates the Panel to the latest GitHub release without losing data.
*   **Discord Webhooks:** Get notified directly on Discord when installation or backups are completed.
*   **Docker Health Tools:** Instant cleanup of dangling images, volumes, and oversized logs.

---

## 💻 Requirements

| Component | Minimum | Recommended |
| :--- | :--- | :--- |
| **OS** | Ubuntu 20.04+ / Debian 11+ | Ubuntu 22.04 LTS |
| **RAM** | 2 GB | 4 GB+ |
| **Storage** | 10 GB SSD | 40 GB NVMe |
| **CPU** | 1 Core | 2 Cores+ |
| **Virt.** | KVM / Dedicated | Dedicated |

---

## 🚀 Quick Start

Run the following command as **root** on a fresh server:

```bash
bash <(curl -sSL https://raw.githubusercontent.com/astroplanet04/pteroscript-automatic/main/pteroscript_automatic.sh)
```

## Manual Installation
If you prefer to clone the repository:

```
git clone https://github.com/pteroscript-automatic/pteroscript_automatic.git
cd ptero-pro
chmod +x pteroscript_automatic.sh
sudo ./pteroscript_automatic.sh
```
---

## 🛠 Advanced Usage

** Maintenance Menu
The script includes a hidden maintenance suite to fix common issues:

* **Option 1:** Updates the Panel pulling the latest tarball from GitHub.
* **Option 2:** Fixes storage/cache permissions (resolves 500 errors).
* **Option 4:** Creates a full database dump and file backup.

* ## Security Hardening
Activating the security module will:
* **1.** Enable UFW and allow ports 22, 80, 443, 8080, 2022.
* **2.** Install Fail2Ban and inject custom Pterodactyl filters.
* **3.** Harden sysctl.conf against common network attacks.

---

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the [Issues](https://github.com/astroplanet04/pteroscriot-automatic/issues) page.

---

## 📜 License
Distributed under the MIT License. See ```LICENSE``` for more information.

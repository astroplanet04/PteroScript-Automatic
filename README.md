# 🦖 PteroScript-Automatic Utility v2.1

[![Version](https://img.shields.io/badge/version-2.1.0-blue.svg)](https://github.com/tuo-username/ptero-pro)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Ubuntu%20%7C%20Debian-orange.svg)]()

**Ptero-Pro Master** is an advanced, high-performance TUI (Text User Interface) utility designed to deploy, optimize, and manage Pterodactyl Panel and Wings nodes. Unlike standard installers, this tool focuses on **Enterprise-level hardening** and **Kernel-level performance tuning**.

---

## 📝 In breve: Cosa fa questo script?
- **Installazione Smart:** Configura automaticamente Pannello, Wings e Database (MariaDB).
- **Ottimizzazione Kernel:** Modifica i parametri di rete Linux (`sysctl`) per gestire migliaia di pacchetti UDP/TCP (ideale per i Game Server).
- **Sicurezza Avanzata:** Configura automaticamente Firewall (UFW) e protezione brute-force (Fail2Ban).
- **Database Tuning:** Calcola la RAM del sistema e ottimizza i buffer di MariaDB per la massima velocità.
- **Manutenzione Pro:** Include tool per backup, aggiornamenti automatici del pannello e notifiche Discord.

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
bash <(curl -sSL https://raw.githubusercontent.com/tuo-username/ptero-pro/main/ptero-pro-master.sh)
```

## Manual Installation
If you prefer to clone the repository:

```
git clone https://github.com/tuo-username/ptero-pro.git
cd ptero-pro
chmod +x ptero-pro-master.sh
sudo ./ptero-pro-master.sh
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
Contributions, issues, and feature requests are welcome! Feel free to check the [Issues] page.(https://github.com/astroplanet04/pteroscriot-automatic/issues).

---

## 📜 License
Distributed under the MIT License. See ```LICENSE``` for more information.

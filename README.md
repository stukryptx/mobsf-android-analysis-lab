# MobSF Android Analysis Lab

> Fully Automated Android Static & Dynamic Analysis Lab Setup using Android Emulator, RootAVD, Magisk, Docker, and MobSF.

Build your own Android malware analysis & mobile application testing environment in minutes.

---

# What is This?

This project automates the setup of a complete Android security research environment for:

- Android Malware Analysis
- APK Reverse Engineering
- Dynamic Runtime Analysis
- Frida Instrumentation
- SSL Pinning Bypass
- Mobile App Pentesting
- Traffic Interception
- MobSF Dynamic Analysis

---

# Included Components

| Component | Purpose |
|---|---|
| Android SDK | Android development & debugging tools |
| Android Emulator | Virtual Android Device |
| Android 30 x86_64 | Fast emulator image |
| RootAVD | Root patching framework |
| Magisk | Systemless Android root |
| Docker | Container runtime |
| MobSF | Mobile Security Framework |

---

# Features

## Fully Automated Setup

- Android SDK Installation
- Emulator Installation
- MobSF Docker Setup
- RootAVD Integration
- Magisk Root Setup
- Environment Variable Configuration
- AVD Creation
- Dynamic Analysis Ready

---

# Supported Operating Systems

- Kali Linux
- Debian
- Ubuntu
- Parrot OS

---

# Hardware Requirements

| Requirement | Recommended |
|---|---|
| RAM | 8GB+ |
| CPU | 4 Cores |
| Storage | 20GB Free |
| Virtualization | Enabled |

---

# Enable CPU Virtualization

Check virtualization support:

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```

If output is greater than `0`, virtualization is enabled.

---

# One-Line Installation

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/mobsf-android-analysis-lab/main/install_android_env.sh)
```

---

# Manual Installation

```bash
git clone https://github.com/YOUR_USERNAME/mobsf-android-analysis-lab.git

cd mobsf-android-analysis-lab

chmod +x install_android_env.sh

./install_android_env.sh
```

---

# Created Emulator

| Property | Value |
|---|---|
| Emulator Name | MOBSF_DEV |
| Android Version | Android 11 |
| API Level | 30 |
| Architecture | x86_64 |
| Device | Pixel 7 Pro |

---

# IMPORTANT: Final Magisk Setup

After RootAVD completes:

## Steps

1. Start emulator

```bash
emulator -avd MOBSF_DEV
```

2. Wait for Android boot

3. Open Magisk App

4. Wait a few seconds

5. A popup will appear

6. Click Reboot

7. Emulator reboots automatically

8. Verify root:

```bash
adb root
```

---

# Start MobSF

```bash
docker run -it --rm -p 8000:8000 \
opensecurity/mobile-security-framework-mobsf:latest
```

---

# Open MobSF

```text
http://127.0.0.1:8000
```

---

# MobSF Dynamic Analysis Configuration

Use:

```python
ANALYZER_IDENTIFIER = "emulator-5554"
```

---

# Useful Commands

## Start Emulator

```bash
emulator -avd MOBSF_DEV
```

## List Devices

```bash
adb devices
```

## Restart ADB as Root

```bash
adb root
```

## Check Available AVDs

```bash
emulator -list-avds
```

---

# Recommended Tools

You can additionally install:

- Frida
- objection
- apktool
- jadx
- mitmproxy
- Burp Suite

---

# Future Improvements

Planned Features:

- Frida Auto Installer
- Burp CA Auto Install
- SSL Pinning Bypass Automation
- Emulator Snapshots
- ARM Emulator Support
- Docker Compose Setup
- Genymotion Support
- Play Integrity Bypass

---

# Project Structure

```text
mobsf-android-analysis-lab/
├── README.md
├── install_android_env.sh
├── oneliner.sh
├── LICENSE
└── .gitignore
```

---

# Credits

## RootAVD

https://github.com/newbit1/rootAVD

## MobSF

https://github.com/MobSF/Mobile-Security-Framework-MobSF

---

# Disclaimer

This project is intended strictly for:

- Educational Purposes
- Malware Analysis
- Mobile Security Research
- Authorized Security Testing

The user is responsible for complying with local laws and regulations.

---

# License

MIT License

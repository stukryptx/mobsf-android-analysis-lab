# 🗺️ MobSF Android Analysis Lab — Future Roadmap & Planned Enhancements

This document outlines planned improvements to automate, harden, and expand the mobile security testing laboratory.

---

## 📱 1. ARM Translation & Emulation Architecture
- [ ] **ARM64 Translation (libndk / libhoudini)**:
  - Integrate automatic installation of ARM translation libraries into x86_64 AVD images to allow analyzing APKs compiled purely for ARM architectures without performance hits.
- [ ] **Multi-Android API Version Profiles**:
  - Support parameterized AVD generation for Android 11 (API 30), Android 13 (API 33), and Android 14 (API 34) to test modern permission models and Scoped Storage changes.

---

## 💉 2. Automated Dynamic Instrumentation & Frida Ecosystem
- [ ] **Pre-Packaged Frida Server & Scripts**:
  - Auto-start `frida-server` on emulator boot.
  - Include an interactive library of bypass scripts (Universal SSL Unpinning, RootCloak, Keystore interception, Biometric bypass).
- [ ] **Burp Suite / mitmproxy CA Auto-Trust**:
  - Automatically install custom user certificates into `/system/etc/security/cacerts` directly via Magisk modules (`AlwaysTrustUserCerts`).

---

## ⚡ 3. Automated Batch APK Triage Pipeline
- [ ] **Headless CLI Ingestion Daemon**:
  - Provide a watch folder daemon that automatically ingests suspicious APKs, initiates dynamic runs via MobSF REST API, records network traffic (.pcap), and exports JSON reports.

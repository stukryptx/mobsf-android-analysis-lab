#!/bin/bash

set -e

clear

echo "============================================================"
echo "        MobSF Android Analysis Lab Installer"
echo "============================================================"
echo
echo "[+] Android Static & Dynamic Analysis Automation"
echo "[+] Emulator + RootAVD + Magisk + MobSF"
echo

sleep 2

echo "[+] Updating system packages..."
sudo apt update -y

echo "[+] Installing required packages..."
sudo apt install -y \
wget \
curl \
unzip \
git \
adb \
qemu-kvm \
libvirt-daemon-system \
libvirt-clients \
bridge-utils \
openjdk-17-jdk \
ca-certificates \
apt-transport-https \
gnupg \
lsb-release

echo
echo "[+] Installing Docker..."
curl -fsSL https://get.docker.com | sudo bash

sudo usermod -aG docker $USER

newgrp docker <<EONG

echo "[+] Enabling Docker service..."
sudo systemctl enable --now docker

echo "[+] Pulling MobSF Docker image..."
docker pull opensecurity/mobile-security-framework-mobsf:latest

EONG

echo
echo "[+] Creating Android SDK directories..."
mkdir -p "$HOME/Android/Sdk/cmdline-tools/latest"

cd "$HOME/Android"

echo "[+] Downloading Android Command Line Tools..."
wget -O commandlinetools.zip \
https://dl.google.com/android/repository/commandlinetools-linux-14742923_latest.zip

echo "[+] Extracting command line tools..."
unzip -o commandlinetools.zip

echo "[+] Moving cmdline-tools..."
mv cmdline-tools/* "$HOME/Android/Sdk/cmdline-tools/latest/" || true

echo
echo "[+] Configuring environment variables..."

if ! grep -q "ANDROID_HOME" "$HOME/.zshrc"; then

cat <<EOF >> "$HOME/.zshrc"

# Android SDK
export ANDROID_HOME=\$HOME/Android/Sdk
export ANDROID_SDK_ROOT=\$HOME/Android/Sdk
export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=\$PATH:\$ANDROID_HOME/platform-tools
export PATH=\$PATH:\$ANDROID_HOME/emulator

EOF

fi

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

echo
echo "[+] Accepting Android SDK licenses..."
yes | sdkmanager --licenses

echo
echo "[+] Installing Android SDK packages..."

sdkmanager \
"build-tools;30.0.0" \
"platform-tools" \
"platforms;android-30" \
"emulator" \
"system-images;android-30;google_apis_playstore;x86_64"

echo
echo "[+] Creating Android Virtual Device..."

echo "no" | avdmanager create avd \
-n MOBSF_DEV \
-k "system-images;android-30;google_apis_playstore;x86_64" \
-d pixel_7_pro

cd "$HOME/Android"

echo
echo "[+] Cloning RootAVD..."

git clone https://github.com/newbit1/rootAVD.git || true

cd rootAVD

chmod +x rootAVD.sh

echo
echo "[+] Rooting Emulator Image..."

./rootAVD.sh \
system-images/android-30/google_apis_playstore/x86_64/ramdisk.img

echo
echo "============================================================"
echo "                 IMPORTANT MANUAL STEPS"
echo "============================================================"
echo
echo "[1] Start Emulator:"
echo
echo "    emulator -avd MOBSF_DEV"
echo
echo "[2] Wait until Android fully boots"
echo
echo "[3] Open Magisk App inside Emulator"
echo
echo "[4] DO NOT CLICK ANYTHING IMMEDIATELY"
echo
echo "[5] Wait few seconds"
echo
echo "[6] A popup will appear asking for reboot"
echo
echo "[7] Click OK / REBOOT"
echo
echo "[8] Emulator will reboot automatically"
echo
echo "[9] Verify root access:"
echo
echo "    adb root"
echo
echo "[10] Start MobSF:"
echo
echo "docker run -it --rm -p 8000:8000 \\"
echo "opensecurity/mobile-security-framework-mobsf:latest"
echo
echo "[11] Open MobSF:"
echo
echo "http://127.0.0.1:8000"
echo
echo "============================================================"
echo "                INSTALLATION COMPLETED"
echo "============================================================"
echo
echo "[+] Environment Ready For:"
echo
echo "    - Android Malware Analysis"
echo "    - Static APK Analysis"
echo "    - Dynamic Runtime Analysis"
echo "    - Frida Instrumentation"
echo "    - SSL Pinning Bypass"
echo "    - Reverse Engineering"
echo "    - Traffic Interception"
echo

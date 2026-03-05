# HLB (HyperOS Launcher Bridge)

HLB is a Magisk module designed to bypass the navigation gesture restrictions on Xiaomi HyperOS. It works by replacing the stock `com.miui.home` with a "Ghost" container that keeps the system's gesture engine active while redirecting the user to a third-party launcher.

## 🚀 How it Works

On HyperOS, full-screen gestures are hardcoded to the stock launcher. If you switch launchers, the system disables the gestures. HLB fixes this by:
1. **Spoofing Identity:** Acting as the `com.miui.home` package.
2. **Gesture Retention:** Keeping the `MiuiGestureService` alive because the system thinks the stock launcher is still in use.
3. **Instant Redirection:** Automatically launching your preferred 3rd-party launcher as soon as the Home intent is called.

## 🛠️ Prerequisites

This module replaces a core system component. To avoid bootloops, you **MUST** have the following:

* **Magisk or KernelSU** installed.
* **CorePatch (LSPosed module):** This is required to disable system signature verification. Without this, HyperOS will reject the module because the APK isn't signed by Xiaomi.
* **QuickSwitch (Optional):** Recommended if you want to use your 3rd-party launcher as the Recents/Overview provider.

## 📦 Installation

1. **Build the Module:** Push this repository to GitHub. The included GitHub Action will compile the APK and create a flashable `.zip`.
2. **Download:** Go to the "Actions" tab in your GitHub repo and download the latest artifact.
3. **Flash:** Install the ZIP via Magisk or KernelSU.
4. **Reboot:** Upon reboot, your gestures should remain functional while using your custom launcher.

## ⚙️ Configuration

To change the target launcher, edit the package name in:
`app/src/main/java/com/miui/home/MainActivity.java`

Change the following line to your launcher's package name:
intent.setPackage("com.teslacoilsw.launcher");

## ⚠️ Troubleshooting

* **Bootloop:** If you stuck at the Mi logo, boot into recovery and delete the module folder from `/data/adb/modules/hlb_gesture_bypass`.
* **Black Screen on Home:** Ensure your target launcher is actually installed on the device.
* **Recents Not Working:** Use the **QuickSwitch** Magisk module to set your launcher as the Recents provider.

---
*Disclaimer: Use at your own risk. Modifying system components can lead to data loss or device instability.*
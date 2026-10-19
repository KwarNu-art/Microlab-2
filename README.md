# ⚡️ NovaShield: Performance & Thermal Rescue Engine

[![NovaShield CI/CD](https://github.com/KwarNu-art/Microlab-2/actions/workflows/build.yml/badge.svg)](https://github.com/KwarNu-art/Microlab-2/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-iOS%2015.0%2B-black.svg)](https://apple.com)
[![Architecture](https://img.shields.io/badge/Architecture-iphoneos--arm64%20(Rootless)-purple.svg)](https://github.com/KwarNu-art/Microlab-2)
[![Device](https://img.shields.io/badge/Target-iPhone%207%20Plus%20(A10)-orange.svg)](https://apple.com)

> **NovaShield** is an elite rootless jailbreak tweak engineered specifically for Apple A10 Fusion devices (iPhone 7 Plus running iOS 15.0 - 15.8.x) on **Dopamine** and **Palera1n**. It permanently cures severe thermal throttling, `thermalmonitord` watchdog loops, I2C bus hangs, background daemon runaway, and memory saturation during intense gaming (**Mobile Legends: Bang Bang**) and heavy **Telegram** usage while maintaining **strict 0% standby battery drain**.

---

## 🎯 The Problem on iPhone 7 Plus (A10 Fusion)

Under modern iOS 15.8.x, the iPhone 7 Plus faces unique hardware constraints:
1. **Watchdog Panic Loops**: When CPU temperature spikes, system daemons like `thermalmonitord` repeatedly stall on I2C bus queries, locking up the UI thread for 10–30 seconds.
2. **Background Daemon Runaway**: Daemons like `suggestd`, `passd`, `assetd`, and `cloudphotod` compete for the A10's two high-performance Hurricane cores.
3. **RAM Saturation**: Modern games (MLBB) and chat apps (Telegram) quickly exhaust the 3GB RAM pool, causing violent frame drops and system crashes.

---

## 💎 Key Features & Architecture

### 1. 🌙 Screen-State Aware Energy Lifecycle (Zero Standby Drain)
* Hooks `SBBacklightController` and Darwin kernel notification `com.apple.springboard.hasBlankedScreen`.
* **Screen ON**: Activates low-overhead kernel telemetry polling every 2.5 seconds.
* **Screen OFF / Sleep**: Instantly suspends all background timers, dispatch queues, and telemetry threads, ensuring **0.0% battery drain while locked**.

### 2. 📊 Low-Overhead Mach Kernel CPU Calculation
* Utilizes Mach kernel `host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, ...)` to track tick-level CPU utilization across Hurricane and Zephyr cores without CPU wake-up spikes.

### 3. 💎 Apple-Style Glassmorphism Warning HUD (`NovaHUD`)
* When CPU load exceeds user threshold (>80% for 3+ consecutive checks), a sleek glassmorphic HUD slides down smoothly from the top of the screen:
  * Native `UIVisualEffectView` with continuous rounded corners (`kCACornerCurveContinuous`).
  * Live telemetry readout: **CPU Load %** and **Active RAM Footprint**.
  * Embedded **"⚡️ Boost & Cool"** direct action button.
  * Auto-dismisses when system load stabilizes, or dismissible via swipe-up.

### 4. ⚡️ One-Tap "Boost & Cool" Rescue Action
* **Instant Cache Purge**: Broadcasts system-wide memory warnings and flushes texture buffers.
* **Daemon Throttle**: Drops runaway background daemons (`suggestd`, `passd`, `assetd`) to `nice +19` idle priority.
* **Foreground Thread Elevation**: Sets the foreground application (MLBB, Telegram) to `QOS_CLASS_USER_INTERACTIVE`.
* **Tactile Confirmation**: Heavy haptic feedback via `UIImpactFeedbackGenerator`.

### 5. ⚙️ Preferences & Settings Integration
* Configurable directly in the iOS **Settings.app** under Tweaks:
  * Master Enable / Disable switch.
  * CPU Warning Threshold Slider (60% to 95%).
  * Auto-Boost Gaming Mode for MLBB and Telegram.
  * "Test Warning HUD" interactive preview button.

---

## 📲 Installation Guide

### Rootless Jailbreak (Dopamine / Palera1n)
1. Download **`NovaShield-Rootless-arm64.deb`** from [GitHub Releases](https://github.com/KwarNu-art/Microlab-2/releases).
2. Open the file in **Sileo**, **Zebra**, or **Filza**.
3. Tap **Get / Install** and confirm.
4. Respring when prompted.

---

## 🛠️ Compilation

This project uses Theos with rootless packaging:
```bash
make clean
make package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless
```

Compiled `.deb` packages are located in `./packages/`.

---

## 📄 License
MIT License. Created for @KwarNu-art for repository `Microlab-2`.

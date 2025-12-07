# 🎨 Fancy Switch

[![pub package](https://img.shields.io/pub/v/fancy_switch.svg)](https://pub.dev/packages/fancy_switch)
[![likes](https://img.shields.io/pub/likes/fancy_switch)](https://pub.dev/packages/fancy_switch/score)
[![points](https://img.shields.io/pub/points/fancy_switch)](https://pub.dev/packages/fancy_switch/score)
[![popularity](https://img.shields.io/pub/popularity/fancy_switch)](https://pub.dev/packages/fancy_switch/score)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/unclegenson/fancy_switch)](https://github.com/unclegenson/fancy_switch/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/unclegenson/fancy_switch)](https://github.com/unclegenson/fancy_switch/network)

**Transform your Flutter apps with beautifully animated, fully customizable toggle switches created by UncleGenSon!**

---

## ✨ Why Fancy Switch?

Tired of boring, stock toggle switches? **Fancy Switch** brings your Flutter app to life with:

* 🎨 **Gorgeous gradient animations** that smoothly transition between states
* 🎭 **Dual-icon support** with separate icons for on/off states
* 📐 **Pixel-perfect customization** - control every aspect of the design
* ⚡ **Buttery-smooth 60fps animations** with customizable durations
* 🎯 **Native Flutter experience** - no platform-specific hacks

---

## 🚀 Quick Start

### 1. Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  fancy_switch: ^1.0.0
  flutter_svg: ^2.0.0+1  # Optional, for SVG support
```

### 2. Basic Usage

```dart
import 'package:fancy_switch/fancy_switch.dart';

bool isEnabled = false;

FancySwitch(
  value: isEnabled,
  onChanged: (value) => setState(() => isEnabled = value),
  activeIcon: Icons.notifications_active,
  inactiveIcon: Icons.notifications_off,
  activeColors: [Colors.green, Colors.lightGreen],
  inactiveColors: [Colors.grey, Colors.blueGrey],
)
```

### 🎨 Features

#### 🌈 Gradient Colors

Customize both active and inactive states with beautiful gradients:

```dart
FancySwitch(
  value: isDarkMode,
  onChanged: (v) => setState(() => isDarkMode = v),
  activeIcon: Icons.nightlight_round,
  inactiveIcon: Icons.wb_sunny,
  activeColors: [
    Color(0xFF2C3E50),
    Color(0xFF34495E),
  ],
  inactiveColors: [
    Color(0xFFF39C12),
    Color(0xFFE67E22),
  ],
)
```

#### 🖼️ Icon & SVG Support

Use Material Icons, custom icons, or SVG files:

```dart
// Using IconData
FancySwitch(
  activeIcon: Icons.wifi,
  inactiveIcon: Icons.wifi_off,
)

// Using SVG files
FancySwitch(
  activeIcon: 'assets/icons/moon.svg',
  inactiveIcon: 'assets/icons/sun.svg',
)
```

#### 📐 Complete Customization

Control every aspect of the switch:

```dart
FancySwitch(
  value: value,
  onChanged: onChanged,
  activeIcon: Icons.check,
  inactiveIcon: Icons.close,
  width: 120,
  height: 50,
  iconSize: 24,
  duration: Duration(milliseconds: 500),
  circlePadding: 6,
  circleMargin: 8,
  circleSizeRatio: 0.65,
  activeColors: [Colors.purple, Colors.deepPurple],
  inactiveColors: [Colors.blueGrey, Colors.grey],
)
```

#### 📱 Examples

Real-World Usage Examples

```dart
// Dark Mode Toggle
FancySwitch(
  value: darkMode,
  onChanged: (v) => setState(() => darkMode = v),
  activeIcon: Icons.nightlight_round,
  inactiveIcon: Icons.wb_sunny,
  activeColors: [Color(0xFF2C3E50), Color(0xFF34495E)],
  inactiveColors: [Color(0xFFF39C12), Color(0xFFE67E22)],
)

// Notifications Toggle
FancySwitch(
  value: notifications,
  onChanged: (v) => setState(() => notifications = v),
  activeIcon: Icons.notifications_active,
  inactiveIcon: Icons.notifications_off,
  activeColors: [Color(0xFF27AE60), Color(0xFF2ECC71)],
  inactiveColors: [Color(0xFF95A5A6), Color(0xFF7F8C8D)],
  width: 80,
  height: 36,
)

// Airplane Mode
FancySwitch(
  value: airplaneMode,
  onChanged: (v) => setState(() => airplaneMode = v),
  activeIcon: Icons.airplanemode_active,
  inactiveIcon: Icons.airplanemode_inactive,
  activeColors: [Color(0xFFE74C3C), Color(0xFFC0392B)],
  inactiveColors: [Color(0xFF3498DB), Color(0xFF2980B9)],
)
```

#### Custom Settings Grid

```dart
GridView.count(
  crossAxisCount: 2,
  children: [
    _buildSettingSwitch("Wi-Fi", wifiEnabled, Icons.wifi, [Color(0xFF9B59B6), Color(0xFF8E44AD)]),
    _buildSettingSwitch("Bluetooth", bluetoothEnabled, Icons.bluetooth, [Color(0xFF3498DB), Color(0xFF2980B9)]),
    // ... more switches
  ],
)
```

### ⚙️ API Reference

| Property        | Type               | Default            | Description                                    |
| --------------- | ------------------ | ------------------ | ---------------------------------------------- |
| value           | bool               | Required           | Current switch state                           |
| onChanged       | ValueChanged<bool> | Required           | Callback when state changes                    |
| activeIcon      | dynamic            | Required           | Icon for active state (IconData or SVG path)   |
| inactiveIcon    | dynamic            | Required           | Icon for inactive state (IconData or SVG path) |
| activeColors    | List<Color>        | [#27AE60, #2ECC71] | Gradient colors for active state               |
| inactiveColors  | List<Color>        | [#95A5A6, #7F8C8D] | Gradient colors for inactive state             |
| width           | double             | 70                 | Total width of the switch                      |
| height          | double             | 36                 | Total height of the switch                     |
| iconSize        | double             | 20                 | Size of icons                                  |
| duration        | Duration           | 400ms              | Animation duration                             |
| circlePadding   | double             | 6                  | Internal padding of the white circle           |
| circleMargin    | double             | 4                  | Margin from edges                              |
| circleSizeRatio | double             | 0.7                | Circle size relative to height                 |

### 🎯 Advanced Usage

#### Creating a Theme-Aware Switch

```dart
class ThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FancySwitch(
      value: theme.brightness == Brightness.dark,
      onChanged: (isDark) {
        // Your theme switching logic
      },
      activeIcon: Icons.nightlight_round,
      inactiveIcon: Icons.wb_sunny,
      activeColors: [theme.colorScheme.primary, theme.colorScheme.primary.withOpacity(0.8)],
      inactiveColors: [theme.colorScheme.secondary, theme.colorScheme.secondary.withOpacity(0.8)],
    );
  }
}
```

#### Building a Custom Switch with SVG

```dart
FancySwitch(
  value: isPremium,
  onChanged: (v) => setState(() => isPremium = v),
  activeIcon: 'assets/icons/crown.svg',
  inactiveIcon: 'assets/icons/crown_outline.svg',
  activeColors: [Color(0xFFFFD700), Color(0xFFFFA500)],
  inactiveColors: [Color(0xFFBDC3C7), Color(0xFF7F8C8D)],
  width: 100,
  height: 45,
  iconSize: 22,
)
```

### 🤝 Contributing

* Fork the repository
* Create a feature branch: `git checkout -b feature/amazing-feature`
* Commit your changes: `git commit -m 'Add amazing feature'`
* Push to the branch: `git push origin feature/amazing-feature`
* Open a Pull Request

#### Development Setup

```bash
# Clone the repository
git clone https://github.com/unclegenson/fancy_switch.git

# Install dependencies
flutter pub get

# Run the example app
cd example
flutter run
```

### 📖 FAQ

* **Can I use custom SVG animations?** Yes! Fancy Switch supports any SVG that works with the flutter_svg package.
* **How do I change the animation curve?** Currently uses `Curves.easeInOut`. For custom curves, submit a PR or fork.
* **Is there RTL support?** Yes! Fancy Switch respects Directionality.
* **Can I use emojis instead of icons?** Use SVG versions of emojis or create a custom widget.

### 📊 Performance

* ✅ 60 FPS animations on modern devices
* ✅ Minimal widget rebuilds
* ✅ Efficient painting operations
* ✅ Zero unnecessary state changes

### 🌟 Showcase

Used by thousands of apps including productivity apps, social media platforms, e-commerce apps, and utilities.

Share your creation! Tag on Telegram [@unclegenson] or submit a PR.

### 📄 License

MIT License

Copyright (c) 2024 UncleGenSon

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction...

### 🙏 Acknowledgments

* Flutter Team for the framework
* flutter_svg package
* All contributors
* You for using Fancy Switch!

### 📞 Support

* Author: UncleGenSon
* Email: [unclegenson@gmail.com](mailto:unclegenson@gmail.com)
* Telegram: @unclegenson
* GitHub: unclegenson
* Issues: GitHub Issues

Love this package? Give it a ⭐ on GitHub!

<div align="center">
Made with ❤️ by UncleGenSon for the Flutter community
Ready to elevate your Flutter app? Install Fancy Switch today and create toggle switches that users will love to interact with! 🚀
</div>

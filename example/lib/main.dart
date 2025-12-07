import 'package:flutter/material.dart';
import 'package:fancy_switch/fancy_switch.dart';

void main() {
  runApp(const FancySwitchExample());
}

class FancySwitchExample extends StatefulWidget {
  const FancySwitchExample({super.key});

  @override
  State<FancySwitchExample> createState() => _FancySwitchExampleState();
}

class _FancySwitchExampleState extends State<FancySwitchExample> {
  bool darkMode = false;
  bool notifications = true;
  bool airplaneMode = false;
  bool wifi = true;
  bool bluetooth = false;
  bool autoSync = true;
  bool batterySaver = false;
  bool customColors = false;
  bool customDemo2 = false;

  @override
  Widget build(BuildContext context) {
    final isDark = darkMode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fancy Switch Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.light(
          primary: Colors.deepPurple,
          secondary: Colors.amber,
          surface: Colors.white,
          background: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: Colors.black.withOpacity(0.1),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.deepPurple[800],
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Colors.grey[700]),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple[300],
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurple[300]!,
          secondary: Colors.amber,
          surface: Colors.grey[900]!,
          background: Colors.grey[900]!,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900]!,
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        cardTheme: CardThemeData(
          color: Colors.grey[800]!,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: Colors.black.withOpacity(0.3),
        ),
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Colors.grey[400]),
        ),
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final isDark = theme.brightness == Brightness.dark;

          return Scaffold(
            appBar: AppBar(
              title: const Text("✨ Fancy Switch Gallery"),
              backgroundColor: isDark ? Colors.grey[900] : Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? [Colors.grey[900]!, Colors.grey[850]!]
                      : [Colors.deepPurple.shade50, Colors.deepPurple.shade100],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.toggle_on,
                              size: 60,
                              color: isDark
                                  ? Colors.deepPurple[300]
                                  : Colors.deepPurple,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Fancy Switch Package",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? Colors.white
                                    : Colors.deepPurple[800],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Beautiful, customizable switches for Flutter",
                              style: TextStyle(
                                fontSize: 16,
                                color: isDark
                                    ? Colors.grey[300]
                                    : Colors.grey[700],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Dark Mode Switch (کوچک‌تر)
                      _buildSwitchCard(
                        isDark: isDark,
                        title: "🌙 Dark Mode",
                        subtitle: "Toggle between light and dark theme",
                        value: darkMode,
                        onChanged: (v) => setState(() => darkMode = v),
                        activeIcon: Icons.nightlight_round,
                        inactiveIcon: Icons.wb_sunny,
                        activeColors: const [
                          Color(0xFF2C3E50),
                          Color(0xFF34495E),
                        ],
                        inactiveColors: const [
                          Color(0xFFF39C12),
                          Color(0xFFE67E22),
                        ],
                        switchWidth: 80,
                        switchHeight: 36,
                      ),

                      const SizedBox(height: 24),

                      // Notification Switch (کوچک‌تر)
                      _buildSwitchCard(
                        isDark: isDark,
                        title: "🔔 Notifications",
                        subtitle: "Receive app notifications",
                        value: notifications,
                        onChanged: (v) => setState(() => notifications = v),
                        activeIcon: Icons.notifications_active,
                        inactiveIcon: Icons.notifications_off,
                        activeColors: const [
                          Color(0xFF27AE60),
                          Color(0xFF2ECC71),
                        ],
                        inactiveColors: const [
                          Color(0xFF95A5A6),
                          Color(0xFF7F8C8D),
                        ],
                        switchWidth: 80,
                        switchHeight: 36,
                      ),

                      const SizedBox(height: 24),

                      // Airplane Mode Switch (کوچک‌تر)
                      _buildSwitchCard(
                        isDark: isDark,
                        title: "✈️ Airplane Mode",
                        subtitle: "Disable all wireless connections",
                        value: airplaneMode,
                        onChanged: (v) => setState(() => airplaneMode = v),
                        activeIcon: Icons.airplanemode_active,
                        inactiveIcon: Icons.airplanemode_inactive,
                        activeColors: const [
                          Color(0xFFE74C3C),
                          Color(0xFFC0392B),
                        ],
                        inactiveColors: const [
                          Color(0xFF3498DB),
                          Color(0xFF2980B9),
                        ],
                        switchWidth: 80,
                        switchHeight: 36,
                      ),

                      const SizedBox(height: 24),

                      // Grid of smaller switches
                      Text(
                        "Quick Settings",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.deepPurple[800],
                        ),
                      ),

                      const SizedBox(height: 16),

                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 3,
                        children: [
                          _buildMiniSwitchCard(
                            isDark: isDark,
                            title: "Wi-Fi",
                            value: wifi,
                            onChanged: (v) => setState(() => wifi = v),
                            icon: Icons.wifi,
                            activeColors: const [
                              Color(0xFF9B59B6),
                              Color(0xFF8E44AD),
                            ],
                          ),
                          _buildMiniSwitchCard(
                            isDark: isDark,
                            title: "Bluetooth",
                            value: bluetooth,
                            onChanged: (v) => setState(() => bluetooth = v),
                            icon: Icons.bluetooth,
                            activeColors: const [
                              Color(0xFF3498DB),
                              Color(0xFF2980B9),
                            ],
                          ),
                          _buildMiniSwitchCard(
                            isDark: isDark,
                            title: "Auto Sync",
                            value: autoSync,
                            onChanged: (v) => setState(() => autoSync = v),
                            icon: Icons.sync,
                            activeColors: const [
                              Color(0xFF1ABC9C),
                              Color(0xFF16A085),
                            ],
                          ),
                          _buildMiniSwitchCard(
                            isDark: isDark,
                            title: "Battery Saver",
                            value: batterySaver,
                            onChanged: (v) => setState(() => batterySaver = v),
                            icon: Icons.battery_saver,
                            activeColors: const [
                              Color(0xFFF39C12),
                              Color(0xFFD35400),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Custom Colors Demo - نسخه اول
                      _buildCustomColorsCard(
                        isDark: isDark,
                        title: "🎨 Custom Colors Demo 1",
                        subtitle: "Gradient color showcase",
                        value: customColors,
                        onChanged: (v) => setState(() => customColors = v),
                        activeIcon: Icons.color_lens,
                        inactiveIcon: Icons.color_lens_outlined,
                        activeColors: const [
                          Color(0xFF9C27B0),
                          Color(0xFF673AB7),
                        ],
                        inactiveColors: const [
                          Color(0xFF009688),
                          Color(0xFF4CAF50),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Custom Colors Demo - نسخه دوم
                      _buildCustomColorsCard2(
                        isDark: isDark,
                        title: "🎨 Custom Colors Demo 2",
                        subtitle: "With more spacing and better icons",
                        value: customDemo2,
                        onChanged: (v) => setState(() => customDemo2 = v),
                        activeIcon: Icons.star,
                        inactiveIcon: Icons.star_border,
                        activeColors: const [
                          Color(0xFFFF5722),
                          Color(0xFFFF9800),
                        ],
                        inactiveColors: const [
                          Color(0xFF2196F3),
                          Color(0xFF03A9F4),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Stats Section
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey[800] : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                isDark ? 0.3 : 0.1,
                              ),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "📊 Switch Statistics",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? Colors.white
                                    : Colors.deepPurple[800],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildStatItem(
                                  isDark: isDark,
                                  icon: Icons.check_circle,
                                  color: Colors.green,
                                  label: "Enabled",
                                  count:
                                      "${[notifications, wifi, autoSync, customColors, customDemo2].where((v) => v).length}",
                                ),
                                _buildStatItem(
                                  isDark: isDark,
                                  icon: Icons.remove_circle,
                                  color: Colors.red,
                                  label: "Disabled",
                                  count:
                                      "${[darkMode, airplaneMode, bluetooth, batterySaver].where((v) => v).length}",
                                ),
                                _buildStatItem(
                                  isDark: isDark,
                                  icon: Icons.toggle_on,
                                  color: Colors.deepPurple,
                                  label: "Total",
                                  count: "9",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Footer
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "Made with ❤️ by UncleGenSon",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "fancy_switch v1.0.0",
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark
                                    ? Colors.grey[400]
                                    : Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Beautiful, customizable switches for Flutter",
                              style: TextStyle(
                                fontSize: 11,
                                color: isDark
                                    ? Colors.grey[500]
                                    : Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwitchCard({
    required bool isDark,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required List<Color> activeColors,
    required List<Color> inactiveColors,
    double switchWidth = 120,
    double switchHeight = 40,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.deepPurple[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDark ? Colors.grey[300] : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          FancySwitch(
            value: value,
            onChanged: onChanged,
            activeIcon: activeIcon,
            inactiveIcon: inactiveIcon,
            activeColors: activeColors,
            inactiveColors: inactiveColors,
            width: switchWidth,
            height: switchHeight,
            duration: const Duration(milliseconds: 300),
            circleSizeRatio: 0.65,
            circleMargin: 4,
            circlePadding: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomColorsCard({
    required bool isDark,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required List<Color> activeColors,
    required List<Color> inactiveColors,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.deepPurple[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: FancySwitch(
              value: value,
              onChanged: onChanged,
              activeIcon: activeIcon,
              inactiveIcon: inactiveIcon,
              activeColors: activeColors,
              inactiveColors: inactiveColors,
              width: 160,
              height: 48,
              duration: const Duration(milliseconds: 350),
              circleSizeRatio: 0.6,
              circleMargin: 8,
              circlePadding: 6,
              iconSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomColorsCard2({
    required bool isDark,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required List<Color> activeColors,
    required List<Color> inactiveColors,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.deepPurple[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: FancySwitch(
              value: value,
              onChanged: onChanged,
              activeIcon: activeIcon,
              inactiveIcon: inactiveIcon,
              activeColors: activeColors,
              inactiveColors: inactiveColors,
              width: 180,
              height: 52,
              duration: const Duration(milliseconds: 350),
              circleSizeRatio: 0.7,
              circleMargin: 10,
              circlePadding: 8,
              iconSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniSwitchCard({
    required bool isDark,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
    required List<Color> activeColors,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.1 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: value
                ? activeColors.first
                : (isDark ? Colors.grey[400] : Colors.grey),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : Colors.deepPurple[800],
              ),
            ),
          ),
          FancySwitch(
            value: value,
            onChanged: onChanged,
            activeIcon: icon,
            inactiveIcon: icon,
            activeColors: activeColors,
            inactiveColors: const [Color(0xFF95A5A6), Color(0xFF7F8C8D)],
            width: 60,
            height: 30,
            iconSize: 16,
            circleSizeRatio: 0.6,
            circleMargin: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required bool isDark,
    required IconData icon,
    required Color color,
    required String label,
    required String count,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          count,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.deepPurple[800],
          ),
        ),
        Text(
          label,
          style: TextStyle(color: isDark ? Colors.grey[300] : Colors.grey[600]),
        ),
      ],
    );
  }
}

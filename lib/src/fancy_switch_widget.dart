library fancy_switch;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FancySwitch extends StatefulWidget {
  /// وضعیت فعلی روشن یا خاموش بودن
  final bool value;

  /// تابعی که هنگام تغییر وضعیت صدا زده می‌شود
  final ValueChanged<bool> onChanged;

  /// آیکون هنگام روشن بودن (می‌تواند IconData یا مسیر SVG باشد)
  final dynamic activeIcon;

  /// آیکون هنگام خاموش بودن
  final dynamic inactiveIcon;

  /// اندازه آیکون یا SVG
  final double iconSize;

  /// رنگ‌های گرادیان برای حالت روشن
  final List<Color> activeColors;

  /// رنگ‌های گرادیان برای حالت خاموش
  final List<Color> inactiveColors;

  /// مدت زمان انیمیشن
  final Duration duration;

  /// ارتفاع سوئیچ
  final double height;

  /// عرض سوئیچ
  final double width;

  /// حاشیه داخلی دایره سفید
  final double circlePadding;

  /// حاشیه دایره سفید از لبه‌ها (برای جلوگیری از چسبیدن زیاد)
  final double circleMargin;

  /// اندازه دایره سفید (نسبت به ارتفاع)
  final double circleSizeRatio;

  const FancySwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeIcon,
    required this.inactiveIcon,
    this.iconSize = 20,
    this.activeColors = const [Color(0xFF27AE60), Color(0xFF2ECC71)],
    this.inactiveColors = const [Color(0xFF95A5A6), Color(0xFF7F8C8D)],
    this.duration = const Duration(milliseconds: 400),
    this.height = 36,
    this.width = 70,
    this.circlePadding = 6,
    this.circleMargin = 6, // تغییر از 4 به 6
    this.circleSizeRatio = 0.7,
  });

  @override
  State<FancySwitch> createState() => _FancySwitchState();
}

class _FancySwitchState extends State<FancySwitch> {
  /// تشخیص می‌دهد آیکون مثل IconData است یا SVG
  Widget _buildIcon(dynamic icon) {
    if (icon is IconData) {
      return Icon(
        icon,
        color: Colors.white,
        size: widget.iconSize,
      );
    }

    if (icon is String && icon.endsWith('.svg')) {
      return SvgPicture.asset(
        icon,
        width: widget.iconSize,
        height: widget.iconSize,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    }

    throw FlutterError(
        "FancySwitch: activeIcon و inactiveIcon باید IconData یا مسیر SVG باشند.");
  }

  @override
  Widget build(BuildContext context) {
    // محاسبه اندازه دایره بر اساس ارتفاع و نسبت
    final circleSize = widget.height * widget.circleSizeRatio;

    // محاسبه موقعیت عمودی دایره (وسط قرارگیری)
    final circleTop = (widget.height - circleSize) / 2;

    // محاسبه موقعیت افقی آیکون‌ها
    final iconLeftMargin = widget.circleMargin + 2; // کمی بیشتر از دایره
    final iconRightMargin =
        widget.width - widget.iconSize - widget.circleMargin - 2;

    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeInOut,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height / 2),
          gradient: LinearGradient(
            colors: widget.value ? widget.activeColors : widget.inactiveColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: (widget.value
                      ? widget.activeColors.first
                      : widget.inactiveColors.first)
                  .withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            /// آیکون روشن/خاموش - سمت راست برای روشن، سمت چپ برای خاموش
            AnimatedPositioned(
              duration: widget.duration,
              curve: Curves.easeInOut,
              left: widget.value ? iconLeftMargin : iconRightMargin,
              top: (widget.height - widget.iconSize) / 2,
              child: AnimatedSwitcher(
                duration: widget.duration,
                child: widget.value
                    ? _buildIcon(widget.activeIcon)
                    : _buildIcon(widget.inactiveIcon),
              ),
            ),

            /// دایره سفید متحرک
            AnimatedPositioned(
              duration: widget.duration,
              curve: Curves.easeInOut,
              left: widget.value
                  ? widget.width - circleSize - widget.circleMargin
                  : widget.circleMargin,
              top: circleTop,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

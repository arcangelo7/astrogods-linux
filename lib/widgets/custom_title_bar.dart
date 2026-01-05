import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class CustomTitleBar extends StatelessWidget {
  final String title;

  const CustomTitleBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Only show on desktop platforms, not web
    if (kIsWeb ||
        (defaultTargetPlatform != TargetPlatform.windows &&
            defaultTargetPlatform != TargetPlatform.linux &&
            defaultTargetPlatform != TargetPlatform.macOS)) {
      return const SizedBox.shrink();
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 32,
      color: Colors.transparent,
      child: GestureDetector(
        onPanStart: (details) {
          windowManager.startDragging();
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  decoration: TextDecoration.none,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      color: Colors.black.withValues(alpha: 0.3),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitleBarButton(
                    context,
                    Icons.minimize,
                    () {
                      windowManager.minimize();
                    },
                    isDark,
                  ),
                  _buildTitleBarButton(
                    context,
                    Icons.crop_square,
                    () async {
                      if (await windowManager.isMaximized()) {
                        windowManager.unmaximize();
                      } else {
                        windowManager.maximize();
                      }
                    },
                    isDark,
                  ),
                  _buildTitleBarButton(
                    context,
                    Icons.close,
                    () {
                      windowManager.close();
                    },
                    isDark,
                    isClose: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleBarButton(
    BuildContext context,
    IconData icon,
    VoidCallback onPressed,
    bool isDark, {
    bool isClose = false,
  }) {
    final iconColor = Colors.white.withValues(alpha: 0.9);
    final hoverColor = isClose
        ? Colors.red.withValues(alpha: 0.7)
        : Colors.white.withValues(alpha: 0.15);

    return SizedBox(
      width: 32,
      height: 32,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          hoverColor: hoverColor,
          child: Icon(icon, size: 14, color: iconColor),
        ),
      ),
    );
  }
}

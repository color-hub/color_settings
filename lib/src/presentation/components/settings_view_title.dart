import 'package:color_ui/color_ui.dart';
import 'package:flutter/cupertino.dart';

class SettingsViewTitle extends StatelessWidget {
  const SettingsViewTitle({
    required this.title,
    this.bottomPadding = 10,
    super.key,
  });

  final String title;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isMobile(context)) {
      return Column(
        children: [
          GradientTitle(title: title),
          SizedBox(height: bottomPadding),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}

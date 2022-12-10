import 'package:color_settings/color_settings.dart';
import 'package:color_ui/color_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutAppView extends SettingsView {
  const AboutAppView({
    required this.appLogo,
    required this.appName,
    required this.appVersion,
    super.key,
  });

  final Widget appLogo;
  final String appName;
  final String appVersion;

  @override
  void showModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: (context) => ColorModal(
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        content: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appLogo,
        const SizedBox(height: 10),
        Text(
          appName,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Text('${'version'.tr()}: $appVersion'),
        const SizedBox(height: 30),
        const Text('Made by'),
        const Text(
          'Color Hub',
          style: TextStyle(fontSize: 35, fontFamily: 'Monoton'),
        ),
      ],
    );
  }
}

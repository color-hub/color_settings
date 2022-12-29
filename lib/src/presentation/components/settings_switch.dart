import 'package:color_settings/src/presentation/components/settings_label.dart';
import 'package:flutter/material.dart';

class SettingsSwitch extends StatelessWidget {
  const SettingsSwitch({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
    this.visible = true,
    super.key,
  });

  final IconData icon;
  final String title;
  final bool value;
  final bool visible;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: SettingsLabel(icon: icon, label: title)),
          Switch(
            activeColor: Theme.of(context).primaryColor,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

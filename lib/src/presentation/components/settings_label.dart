import 'package:flutter/material.dart';

class SettingsLabel extends StatelessWidget {
  const SettingsLabel({
    required this.icon,
    required this.label,
    super.key,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).iconTheme.color),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            label,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}

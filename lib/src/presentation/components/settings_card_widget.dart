import 'package:flutter/material.dart';

class SettingsCardWidget extends StatelessWidget {
  const SettingsCardWidget({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        children: children,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    required this.onPressed,
    required this.label,
    this.color,
    this.textStyle = const TextStyle(fontSize: 20, color: Colors.white),
    this.style,
    super.key,
  });

  factory SettingsButton.ghost({
    required Function() onPressed,
    required String label,
  }) {
    return SettingsButton(
      onPressed: onPressed,
      label: label,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        side: MaterialStateProperty.all(
          const BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
      ),
      textStyle: const TextStyle(fontSize: 20, color: Colors.red),
    );
  }

  final Function() onPressed;
  final String label;
  final Color? color;
  final TextStyle textStyle;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              backgroundColor: color ?? Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
        onPressed: onPressed,
        child: Text(label, style: textStyle),
      ),
    );
  }
}

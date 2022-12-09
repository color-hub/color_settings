import 'package:flutter/material.dart';

class SettingsItem {
  SettingsItem({
    required this.label,
    required this.index,
    this.description,
    this.web = true,
    this.profileItem = false,
    this.gradient = false,
    this.zeroPadding = false,
    this.avatarLink,
    this.icon,
    this.color,
    this.onPressed,
  });

  final String label;
  final String? description;
  final bool web;
  final bool profileItem;
  final bool gradient;
  final bool zeroPadding;
  final int index;

  final Function()? onPressed;
  final IconData? icon;
  final Color? color;
  final String? avatarLink;
}

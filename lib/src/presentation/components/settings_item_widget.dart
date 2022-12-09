import 'package:color_ui/color_ui.dart';
import 'package:flutter/material.dart';

class SettingsItemWidget extends StatelessWidget {
  const SettingsItemWidget({
    required this.item,
    required this.onPressed,
    required this.isSelected,
    required this.divider,
    super.key,
  });

  final SettingsItem item;
  final bool isSelected;
  final bool divider;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: item.gradient
            ? null
            : isSelected
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : Colors.transparent,
        gradient: item.gradient
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              )
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Row(
                  children: [
                    _buildIcon(),
                    const SizedBox(width: 15),
                    _buildLabel(context),
                  ],
                ),
              ),
              if (divider) const Divider(height: 0.1, endIndent: 15, indent: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: item.color,
      ),
      child: Center(
        child: Icon(item.icon, color: Colors.white),
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
            style: item.gradient
                ? Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)
                : Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 5),
          Text(
            item.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 12,
              color: item.gradient ? Colors.white : Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }
}

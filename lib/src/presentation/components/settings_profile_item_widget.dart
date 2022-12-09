import 'package:cached_network_image/cached_network_image.dart';
import 'package:color_ui/color_ui.dart';
import 'package:flutter/material.dart';

/// Item мобильных настроек
class SettingsProfileItemWidget extends SettingsItemWidget {
  const SettingsProfileItemWidget({
    required super.item,
    required super.isSelected,
    required super.onPressed,
    required super.divider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Row(
                children: [
                  _buildAvatar(context),
                  const SizedBox(width: 15),
                  _buildLabel(context),
                ],
              ),
            ),
            if (divider) const Divider(height: 0.1, endIndent: 15, indent: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Theme.of(context).primaryColor,
      backgroundImage: CachedNetworkImageProvider(
        item.avatarLink ?? kEmptyImageLink,
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
            style: Theme.of(context).textTheme.headline3,
          ),
          if (item.description?.isNotEmpty == true) const SizedBox(height: 5),
          if (item.description?.isNotEmpty == true)
            Text(
              item.description!,
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor),
            ),
        ],
      ),
    );
  }
}

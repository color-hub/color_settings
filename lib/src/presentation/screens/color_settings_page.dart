import 'package:color_ui/color_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColorSettingsPage extends StatefulWidget {
  const ColorSettingsPage({
    required this.settingsItems,
    required this.settingsViews,
    this.isAlert = false,
    this.automaticallyImplyLeading = false,
    super.key,
  });

  final List<SettingsCard> settingsItems;
  final List<SettingsView> settingsViews;
  final bool isAlert;
  final bool automaticallyImplyLeading;

  @override
  State<ColorSettingsPage> createState() => _ColorSettingsPageState();
}

class _ColorSettingsPageState extends State<ColorSettingsPage> {
  int _currentIndex = 0;

  final PaneController controller = PaneController();

  PaneState selectedPane = PaneState.first;

  @override
  void initState() {
    super.initState();
    controller.addListener(() => updateState());
  }

  @override
  Widget build(BuildContext context) {
    int firstFlex = widget.isAlert ? 2 : 1;
    int secondFlex = widget.isAlert ? 3 : 2;

    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              backgroundColor: Colors.transparent,
              title: GradientTitle(title: 'settingsPageTitle'.tr()),
            )
          : null,
      body: TwoPanePage(
        controller: controller,
        duration: Duration.zero,
        //TODO заменить на ListView
        firstPane: ListView(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 35),
          children: List.generate(
            widget.settingsItems.length,
            (index) {
              return SettingsCardWidget(
                children: _buildSettingsItems(widget.settingsItems[index].items),
              );
            },
          ),
        ),
        firstFlex: firstFlex,
        secondFlex: secondFlex,
        secondPane: Pane(
          margin: Responsive.isTablet(context)
              ? const EdgeInsets.fromLTRB(5, 0, 5, 10)
              : const EdgeInsets.fromLTRB(15, 0, 10, 10),
          child: widget.settingsViews[_currentIndex],
        ),
      ),
    );
  }

  List<Widget> _buildSettingsItems(List<SettingsItem> items) {
    return List.generate(
      items.length,
      (index) {
        bool visible = true;
        bool divider = false;
        if (!items[index].web && kIsWeb) {
          visible = false;
        }
        if (items.length > 1 && index != items.length - 1) {
          divider = true;
        }
        if (items[index].profileItem) {
          return Visibility(
            visible: visible,
            child: ProfileSettingsItemWidget(
              isSelected:
                  Responsive.isDesktop(context) ? _currentIndex == items[index].index : false,
              item: items[index],
              onPressed: () => onPressedSettingsItem(items[index]),
              divider: divider,
            ),
          );
        }

        return Visibility(
          visible: visible,
          child: SettingsItemWidget(
            isSelected: Responsive.isDesktop(context) ? _currentIndex == items[index].index : false,
            item: items[index],
            onPressed: items[index].onPressed ?? () => onPressedSettingsItem(items[index]),
            divider: divider,
          ),
        );
      },
    );
  }

  void onPressedSettingsItem(SettingsItem item) {
    setState(() {
      _currentIndex = item.index;
    });
    if (Responsive.isTablet(context)) {
      controller.openSecondPane();
    }
    if (Responsive.isMobile(context)) {
      widget.settingsViews[_currentIndex].showModal(context);
    }
  }

  void onPressedTabletBackButton() {
    if (selectedPane == PaneState.first) {
      Navigator.pop(context);
    } else {
      controller.openFirstPane();
    }
  }

  void updateState() {
    setState(() {
      selectedPane = controller.selectedPane;
    });
  }
}

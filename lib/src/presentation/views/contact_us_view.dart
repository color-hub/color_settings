import 'package:color_settings/color_settings.dart';
import 'package:color_ui/color_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends SettingsView {
  const ContactUsView({
    required this.emailDescription,
    super.key,
  });

  final String emailDescription;

  @override
  void showModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: (context) => ColorModal(
        title: 'contactUsTitle'.tr(),
        content: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SettingsViewTitle(title: 'Связь с нами'.tr()),
        ),
        const Text(
          'Возникли вопросы? Можете связаться с нами любым удобным для вас способом:',
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => launchUrl(
                SocialLinks.email(emailDescription),
                mode: LaunchMode.externalApplication,
              ),
              icon: const Icon(Icons.email),
            ),
            IconButton(
              onPressed: () => launchUrl(
                SocialLinks.twitter,
                mode: LaunchMode.externalApplication,
              ),
              icon: const FaIcon(FontAwesomeIcons.twitter),
            ),
            IconButton(
              onPressed: () => launchUrl(
                SocialLinks.vk,
                mode: LaunchMode.externalApplication,
              ),
              icon: const FaIcon(FontAwesomeIcons.vk),
            ),
          ],
        ),
        Text(
          "${'discordLabel'.tr()}:",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => launchUrl(
                SocialLinks.discord,
                mode: LaunchMode.externalApplication,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(FontAwesomeIcons.discord),
                    SizedBox(width: 10),
                    Flexible(child: Text('Discord')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

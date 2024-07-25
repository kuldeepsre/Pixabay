import 'package:flutter/material.dart';
import '../../utils/icons_constants/secondary_icons_icons.dart';
import '../reuseables/account_page_utils_row.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              height: 355,
              child: Column(
                children: [
                  AccountPageUtilsRow(
                    icon: Icons.language_rounded,
                    text: "Language",
                    size: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      )),
                  AccountPageUtilsRow(
                    icon: SecondaryIcons.bell_duotone,
                    text: "Notification",
                    size: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      )),
                  AccountPageUtilsRow(
                    icon: SecondaryIcons.pad,
                    text: "Terms of Use",
                    size: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      )),
                  AccountPageUtilsRow(
                    icon: Icons.info_outline,
                    text: "Pricavy Policy",
                    size: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      )),
                  AccountPageUtilsRow(
                    icon: SecondaryIcons.send_arrow,
                    text: "Chat support",
                    size: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Color(0xffF3F3F6),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

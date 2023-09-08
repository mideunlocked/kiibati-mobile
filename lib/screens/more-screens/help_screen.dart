import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/app_links.dart';
import '../../widgets/help-widgets/help_list_tile.dart';
import '../../widgets/more-widgets/custom_profile_appbar.dart';
import 'licenses_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomProfileAppBar(
        title: "Help",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HelpListTile(
              title: "About app",
              subtitle: "About app, licenses",
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const LicensesScreen(),
                ),
              ),
            ),
            HelpListTile(
              title: "Terms and condition",
              subtitle: "Take a look at our terms and condition",
              function: () async {
                final url = Uri.parse(terms_and_contition);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw "Could not launch $url";
                }
              },
            ),
            HelpListTile(
              title: "Privacy policy",
              subtitle: "Take a look at our privacy policy",
              function: () async {
                final url = Uri.parse(privacy_policy);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw "Could not launch $url";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

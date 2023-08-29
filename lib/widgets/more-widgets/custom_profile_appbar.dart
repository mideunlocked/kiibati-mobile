import 'package:flutter/material.dart';

import '../general-widgets/custome_back_button.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomProfileAppBar({super.key, this.actions, required this.title});

  final List<Widget>? actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;

    var primaryColor = of.primaryColor;
    return AppBar(
      centerTitle: true,
      leading: const CustomBackButton(),
      title: Text(
        title,
        style: bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

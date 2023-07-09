import 'package:flutter/material.dart';

class MoreListTile extends StatelessWidget {
  const MoreListTile({
    super.key,
    required this.title,
    required this.widget,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: widget,
          title: Text(title),
        ),
        const Divider(),
      ],
    );
  }
}

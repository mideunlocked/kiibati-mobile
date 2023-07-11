import 'package:flutter/material.dart';

class MoreListTile extends StatelessWidget {
  const MoreListTile({
    super.key,
    required this.title,
    required this.widget,
    required this.page,
  });

  final String title;
  final Widget widget, page;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => page,
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          leading: widget,
          title: Text(title),
        ),
        const Divider(),
      ],
    );
  }
}

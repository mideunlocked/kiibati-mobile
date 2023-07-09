import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 2.h,
    );
    var fullName = "Ariyo Osuolale";

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          sizedBox,
          const MoreScreenAppBar(),
          Expanded(
            child: Column(
              children: [
                MoreListTile(
                  title: fullName,
                  widget: NameContainer(fullName: fullName),
                ),
                const MoreListTile(
                  title: "Chat with us",
                  widget: MoreIcon(
                    iconUrl: "bubble-chat",
                  ),
                ),
                const MoreListTile(
                  title: "Bookmarks",
                  widget: MoreIcon(
                    iconUrl: "bookmark_2",
                  ),
                ),
                const MoreListTile(
                  title: "Pastors",
                  widget: MoreIcon(
                    iconUrl: "pastor",
                  ),
                ),
                const MoreListTile(
                  title: "Pay offering",
                  widget: MoreIcon(
                    iconUrl: "hand",
                  ),
                ),
                const MoreListTile(
                  title: "Find church",
                  widget: MoreIcon(
                    iconUrl: "location",
                  ),
                ),
                const MoreListTile(
                  title: "About church",
                  widget: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MoreIcon extends StatelessWidget {
  const MoreIcon({
    super.key,
    required this.iconUrl,
  });

  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/$iconUrl.png",
      height: 7.h,
      width: 7.w,
    );
  }
}

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

class NameContainer extends StatelessWidget {
  const NameContainer({
    super.key,
    required this.fullName,
  });

  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Text(
        fullName.characters.first,
      ),
    );
  }
}

class MoreScreenAppBar extends StatelessWidget {
  const MoreScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var primaryColor = of.primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "More",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primaryColor,
            fontSize: 16.sp,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign out",
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

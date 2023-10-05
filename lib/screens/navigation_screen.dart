import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiibati_mobile/helpers/notification_icon_helper.dart';
import 'package:kiibati_mobile/models/notification.dart';
import 'package:kiibati_mobile/providers/notification_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../widgets/general-widgets/custom_progress_indicator.dart';
import '../widgets/more-widgets/custom_profile_appbar.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/NotificationScreen";

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomProfileAppBar(title: "Notifications"),
            StreamBuilder(
                stream: notificationProvider.getNotifications(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CustomProgressIndicator());
                  } else if (snapshot.hasData == false &&
                      snapshot.data == null) {
                    return Text(
                      "Can't get notifications",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 8.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView(
                      children: snapshot.data?.docs
                              .map(
                                (DocumentSnapshot noti) => NotificationTile(
                                  notification: AppNotification(
                                    title: noti["title"] ?? "",
                                    body: noti["body"] ?? "",
                                    linkId: noti["linkId"] ?? "",
                                    notificationType: noti["type"] ?? 0,
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notification,
  });

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    var textTheme = of.textTheme;
    var bodyMedium = textTheme.bodyMedium;

    // var primaryColor = of.primaryColor;
    return ListTile(
      leading: Image.asset(
        NotificationIcon.notificationIcon[notification.notificationType]["icon"]
            .toString(),
        height: 8.h,
        width: 8.w,
      ),
      title: Padding(
        padding: EdgeInsets.only(bottom: 1.h),
        child: Text(
          notification.title,
          style: bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Text(
        notification.body,
        style: bodyMedium?.copyWith(
          fontSize: 10.sp,
        ),
      ),
      shape: const Border(
        bottom: BorderSide(
          color: Colors.black12,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 2.w,
      ),
      titleAlignment: ListTileTitleAlignment.top,
      // tileColor: primaryColor.withOpacity(0.1),
    );
  }
}

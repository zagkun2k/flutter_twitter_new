import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/notifications/controller/notification_controller.dart';
import 'package:twitter_clone/features/notifications/widgets/notification_tile.dart';
import 'package:twitter_clone/models/notification_model.dart' as model;

class NotificationView extends ConsumerWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const NotificationView(),
  );

  const NotificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDetailProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: currentUser == null
          ? const Loader()
          : ref.watch(getNotificationsProvider(currentUser.uid)).when(
                data: (notifications) {
                  // return ref.watch(getLatestNotificationProvider).when(
                  //       data: (data) {
                  //         if (data.events.contains(
                  //             'databases.*.collections.${AppwriteConstants.notificationsCollection}.documents.*.create')) {
                  //           final latestNotif =
                  //               model.Notification.fromMap(data.payload);
                  //           if (latestNotif.uid == currentUser.uid) {
                  //             notifications.insert(0, latestNotif);
                  //           }
                  //         }
                  //         return ListView.builder(
                  //           itemCount: notifications.length,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             final notification = notifications[index];
                  //             return NotificationTile(
                  //               notification: notification,
                  //             );
                  //           },
                  //         );
                  //       },
                  //       error: (error, stackTrace) => ErrorText(
                  //         error: error.toString(),
                  //       ),
                  //       loading: () {
                  //         return ListView.builder(
                  //           itemCount: notifications.length,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             final notification = notifications[index];
                  //             return NotificationTile(
                  //               notification: notification,
                  //             );
                  //           },
                  //         );
                  //       },
                  //     );
                  return ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      final notification = notifications[index];
                      return NotificationTile(
                        notification: notification,
                      );
                    },
                  );
                },
                error: (error, stackTrace) => ErrorText(
                  error: error.toString(),
                ),
                loading: () => const Loader(),
              ),
      // body: const Loader(),
    );
  }
}

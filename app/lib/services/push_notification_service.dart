import 'dart:developer';

import 'package:app/config.dart';
import 'package:app/tools/utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class PushNotificationService {
  PushNotificationService._privateConstructor();
  static final PushNotificationService _instance =
      PushNotificationService._privateConstructor();
  factory PushNotificationService() {
    return _instance;
  }
  Future<void> initOneSignal([context, route]) async {
    log("----oneSignal----");

    OneSignal.initialize(onesignalKey);
    OneSignal.Notifications.requestPermission(true);
    OneSignal.User.pushSubscription.addObserver((state) {});

    OneSignal.Notifications.addPermissionObserver((state) {
      //print("Has permission " + state.toString());
    });

    OneSignal.Notifications.addClickListener((event) {
      log('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      if (event.notification.launchUrl != null &&
          event.notification.launchUrl!.isNotEmpty) {
        Tools().openUrl(event.notification.launchUrl!);
      }
      if (event.notification.subtitle != null) {}
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      /// preventDefault to not display the notification
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();
    });

    OneSignal.InAppMessages.addClickListener((event) {
      //print("In App Message Clicked: \n${event.result.jsonRepresentation().replaceAll("\\n", "\n")}");
    });
    OneSignal.InAppMessages.addWillDisplayListener((event) {
      //print("ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDisplayListener((event) {
      //print("ON DID DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addWillDismissListener((event) {
      //print("ON WILL DISMISS IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDismissListener((event) {
      //print("ON DID DISMISS IN APP MESSAGE ${event.message.messageId}");
    });
  }
}

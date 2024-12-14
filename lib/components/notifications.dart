import 'package:digipost/core/themes/colors.dart';
import 'package:flutter/material.dart';

// Enum for Notification Types
enum NotificationType { success, error, info }

void showCustomNotification(
    BuildContext context, String message, NotificationType type) {
  final snackBar = SnackBar(
    content: NotificationWidget(
      message: message,
      type: type,
    ),
    duration: const Duration(seconds: 3),
    backgroundColor:
        getNotificationColor(type), // Set the background color here
    behavior: SnackBarBehavior.floating, // Optional: makes the SnackBar float
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// Function to get the notification background color based on type
Color getNotificationColor(NotificationType type) {
  switch (type) {
    case NotificationType.success:
      return TailwindColors.green500;
    case NotificationType.error:
      return TailwindColors.red600;
    case NotificationType.info:
      return TailwindColors.blue500;
  }
}

class NotificationWidget extends StatelessWidget {
  final String message;
  final NotificationType type;

  // Constructor for NotificationWidget
  const NotificationWidget({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          type == NotificationType.success
              ? Icons.check_circle
              : type == NotificationType.error
                  ? Icons.error
                  : Icons.info,
          color: Colors.white,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

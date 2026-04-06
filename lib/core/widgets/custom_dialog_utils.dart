import 'package:flutter/material.dart';

class DialogUtils {
  // =========================
  // BASE GENERAL DIALOG
  // =========================
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    IconData? icon,
    Color? iconColor,
    String okText = "OK",
    VoidCallback? onOk,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              if (icon != null) Icon(icon, color: iconColor ?? Colors.blue),
              if (icon != null) const SizedBox(width: 8),
              Expanded(child: Text(title)),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (onOk != null) onOk();
              },
              child: Text(okText),
            ),
          ],
        );
      },
    );
  }

  // =========================
  // SUCCESS
  // =========================
  static void success({
    required BuildContext context,
    required String message,
    VoidCallback? onOk,
  }) {
    show(
      context: context,
      title: "Success",
      message: message,
      icon: Icons.check_circle,
      iconColor: Colors.green,
      onOk: onOk,
    );
  }

  // =========================
  // ERROR
  // =========================
  static void error({
    required BuildContext context,
    required String message,
    VoidCallback? onOk,
  }) {
    show(
      context: context,
      title: "Error",
      message: message,
      icon: Icons.error,
      iconColor: Colors.red,
      onOk: onOk,
    );
  }

  // =========================
  // WARNING
  // =========================
  static void warning({
    required BuildContext context,
    required String message,
    VoidCallback? onOk,
  }) {
    show(
      context: context,
      title: "Warning",
      message: message,
      icon: Icons.warning,
      iconColor: Colors.orange,
      onOk: onOk,
    );
  }

  // =========================
  // INFO
  // =========================
  static void info({
    required BuildContext context,
    required String message,
    VoidCallback? onOk,
  }) {
    show(
      context: context,
      title: "Info",
      message: message,
      icon: Icons.info,
      iconColor: Colors.blue,
      onOk: onOk,
    );
  }

  // =========================
  // CONFIRM DIALOG (YES / NO)
  // =========================
  static Future<void> confirm({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    String confirmText = "Yes",
    String cancelText = "No",
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (onCancel != null) onCancel();
              },
              child: Text(cancelText),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }

  // =========================
  // LOADING DIALOG
  // =========================
  static void showLoading(
    BuildContext context, {
    String message = "Loading...",
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 16),
              Expanded(child: Text(message)),
            ],
          ),
        );
      },
    );
  }

  // =========================
  // CLOSE DIALOG
  // =========================
  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}

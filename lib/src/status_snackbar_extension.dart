import 'package:flutter/material.dart';
import 'status_snackbar.dart';
import 'snackbar_state.dart';
import 'snackbar_config.dart';

/// Extension on [BuildContext] for easy snackbar access.
///
/// Provides convenient methods to show snackbars directly from context:
///
/// ```dart
/// context.showSuccessSnackbar('Done!');
/// context.showErrorSnackbar('Failed', subTitle: 'Please retry');
///
/// // With custom icon
/// context.showSuccessSnackbar('Uploaded!', icon: Icons.cloud_done);
///
/// // Without icon
/// context.showSuccessSnackbar('Done!', showIcon: false);
///
/// // At top of screen
/// context.showInfoSnackbar('New message', position: SnackbarPosition.top);
///
/// // With action button
/// context.showErrorSnackbar(
///   'Deleted',
///   actionLabel: 'Undo',
///   onAction: () => restoreItem(),
/// );
/// ```
extension StatusSnackbarExtension on BuildContext {
  /// Shows a snackbar with the specified state.
  void showSnackbar(
    String message,
    SnackbarState state, {
    String? subTitle,
    int durationSeconds = 3,
    SnackbarConfig? config,
    bool showIcon = true,
    bool showCloseButton = true,
    SnackbarPosition position = SnackbarPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) {
    StatusSnackbar.show(
      this,
      message,
      state,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
      config: config,
      showIcon: showIcon,
      showCloseButton: showCloseButton,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      onDismiss: onDismiss,
    );
  }

  /// Shows a fully customizable snackbar.
  void showCustomSnackbar(
    String message, {
    required SnackbarConfig config,
    String? subTitle,
    int durationSeconds = 3,
    bool showIcon = true,
    bool showCloseButton = true,
    SnackbarPosition position = SnackbarPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) {
    StatusSnackbar.showCustom(
      this,
      message,
      config: config,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
      showIcon: showIcon,
      showCloseButton: showCloseButton,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      onDismiss: onDismiss,
    );
  }

  /// Shows an error snackbar (red theme).
  void showErrorSnackbar(
    String message, {
    String? subTitle,
    int durationSeconds = 3,
    IconData? icon,
    Color? iconColor,
    bool showIcon = true,
    bool showCloseButton = true,
    SnackbarPosition position = SnackbarPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) {
    StatusSnackbar.showError(
      this,
      message,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
      icon: icon,
      iconColor: iconColor,
      showIcon: showIcon,
      showCloseButton: showCloseButton,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      onDismiss: onDismiss,
    );
  }

  /// Shows a warning snackbar (amber theme).
  void showWarningSnackbar(
    String message, {
    String? subTitle,
    int durationSeconds = 3,
    IconData? icon,
    Color? iconColor,
    bool showIcon = true,
    bool showCloseButton = true,
    SnackbarPosition position = SnackbarPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) {
    StatusSnackbar.showWarning(
      this,
      message,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
      icon: icon,
      iconColor: iconColor,
      showIcon: showIcon,
      showCloseButton: showCloseButton,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      onDismiss: onDismiss,
    );
  }

  /// Shows a success snackbar (green theme).
  void showSuccessSnackbar(
    String message, {
    String? subTitle,
    int durationSeconds = 3,
    IconData? icon,
    Color? iconColor,
    bool showIcon = true,
    bool showCloseButton = true,
    SnackbarPosition position = SnackbarPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) {
    StatusSnackbar.showSuccess(
      this,
      message,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
      icon: icon,
      iconColor: iconColor,
      showIcon: showIcon,
      showCloseButton: showCloseButton,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      onDismiss: onDismiss,
    );
  }

  /// Shows an info snackbar (blue theme).
  void showInfoSnackbar(
    String message, {
    String? subTitle,
    int durationSeconds = 3,
    IconData? icon,
    Color? iconColor,
    bool showIcon = true,
    bool showCloseButton = true,
    SnackbarPosition position = SnackbarPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) {
    StatusSnackbar.showInfo(
      this,
      message,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
      icon: icon,
      iconColor: iconColor,
      showIcon: showIcon,
      showCloseButton: showCloseButton,
      position: position,
      actionLabel: actionLabel,
      onAction: onAction,
      onDismiss: onDismiss,
    );
  }
}

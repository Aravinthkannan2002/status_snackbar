import 'package:flutter/material.dart';
import 'snackbar_state.dart';
import 'snackbar_config.dart';

/// A beautiful, customizable snackbar with multiple states.
///
/// Provides static methods to show snackbars with different states:
/// - [showSuccess] - Green snackbar for success messages
/// - [showError] - Red snackbar for error messages
/// - [showWarning] - Amber snackbar for warning messages
/// - [showInfo] - Blue snackbar for informational messages
/// - [showCustom] - Fully customizable snackbar with your own config
///
/// All snackbars automatically adapt to dark/light theme.
///
/// Example:
/// ```dart
/// StatusSnackbar.showSuccess(context, 'Saved!');
/// StatusSnackbar.showError(context, 'Failed', subTitle: 'Try again');
///
/// // Without icon
/// StatusSnackbar.showSuccess(context, 'Done!', showIcon: false);
///
/// // At top of screen
/// StatusSnackbar.showInfo(context, 'New message', position: SnackbarPosition.top);
///
/// // With action button
/// StatusSnackbar.showError(
///   context,
///   'Deleted',
///   actionLabel: 'Undo',
///   onAction: () => print('Undo pressed'),
/// );
/// ```
class StatusSnackbar {
  StatusSnackbar._();

  static const Map<SnackbarState, SnackbarConfig> _configs = {
    SnackbarState.error: SnackbarConfigs.error,
    SnackbarState.warning: SnackbarConfigs.warning,
    SnackbarState.success: SnackbarConfigs.success,
    SnackbarState.info: SnackbarConfigs.info,
  };

  /// Shows a snackbar with the specified state.
  ///
  /// [context] - BuildContext to show the snackbar
  /// [message] - Main message to display
  /// [state] - The snackbar state (success, error, warning, info)
  /// [subTitle] - Optional subtitle for additional details
  /// [durationSeconds] - How long to show the snackbar (default: 3)
  /// [config] - Optional custom configuration to override default colors/icon
  /// [showIcon] - Whether to show the icon (default: true)
  /// [showCloseButton] - Whether to show the close button (default: true)
  /// [position] - Position of snackbar: top or bottom (default: bottom)
  /// [actionLabel] - Optional action button label (e.g., "Undo")
  /// [onAction] - Callback when action button is pressed
  /// [onDismiss] - Callback when snackbar is dismissed
  static void show(
    BuildContext context,
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
    final effectiveConfig = config ?? _configs[state]!;
    _showSnackbar(
      context,
      message,
      effectiveConfig,
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

  /// Shows a fully customizable snackbar with your own configuration.
  ///
  /// Use this method when you want complete control over colors and icons.
  ///
  /// Example:
  /// ```dart
  /// StatusSnackbar.showCustom(
  ///   context,
  ///   'Payment received!',
  ///   config: SnackbarConfig(
  ///     lightBackgroundColor: Colors.purple.shade100,
  ///     lightTextColor: Colors.purple.shade900,
  ///     darkBackgroundColor: Colors.purple.shade900,
  ///     darkTextColor: Colors.purple.shade100,
  ///     iconColor: Colors.purple,
  ///     icon: Icons.payment,
  ///   ),
  /// );
  /// ```
  static void showCustom(
    BuildContext context,
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
    _showSnackbar(
      context,
      message,
      config,
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

  /// Internal method to display the snackbar
  static void _showSnackbar(
    BuildContext context,
    String message,
    SnackbarConfig config, {
    String? subTitle,
    int durationSeconds = 3,
    bool showIcon = true,
    bool showCloseButton = true,
    SnackbarPosition position = SnackbarPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismiss,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDark ? config.darkBackgroundColor : config.lightBackgroundColor;
    final textColor = isDark ? config.darkTextColor : config.lightTextColor;

    // Get the ScaffoldMessengerState reference before showing snackbar
    // to avoid context issues when widget is disposed
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    scaffoldMessenger.hideCurrentSnackBar();

    // Calculate margin based on position
    final EdgeInsets margin = position == SnackbarPosition.top
        ? const EdgeInsets.only(top: 20, left: 20, right: 20)
        : const EdgeInsets.only(bottom: 20, left: 20, right: 20);

    scaffoldMessenger
        .showSnackBar(
          SnackBar(
            content: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Icon (conditionally shown)
                  if (showIcon) ...[
                    Icon(
                      config.icon,
                      size: 20,
                      color: config.iconColor,
                    ),
                    const SizedBox(width: 10),
                  ],

                  // Message content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                        if (subTitle != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            subTitle,
                            style: TextStyle(
                              color: textColor.withValues(alpha: 0.8),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Action button (if provided)
                  if (actionLabel != null) ...[
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        scaffoldMessenger.hideCurrentSnackBar();
                        onAction?.call();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: config.iconColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          actionLabel,
                          style: TextStyle(
                            color: config.iconColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],

                  // Close button (conditionally shown)
                  if (showCloseButton) ...[
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: scaffoldMessenger.hideCurrentSnackBar,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: textColor.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            margin: margin,
            padding: EdgeInsets.zero,
            duration: Duration(seconds: durationSeconds),
            dismissDirection: position == SnackbarPosition.top
                ? DismissDirection.up
                : DismissDirection.down,
          ),
        )
        .closed
        .then((_) => onDismiss?.call());
  }

  /// Shows an error snackbar (red theme).
  static void showError(
    BuildContext context,
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
    final config = (icon != null || iconColor != null)
        ? SnackbarConfigs.error.copyWith(icon: icon, iconColor: iconColor)
        : SnackbarConfigs.error;

    _showSnackbar(
      context,
      message,
      config,
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

  /// Shows a warning snackbar (amber theme).
  static void showWarning(
    BuildContext context,
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
    final config = (icon != null || iconColor != null)
        ? SnackbarConfigs.warning.copyWith(icon: icon, iconColor: iconColor)
        : SnackbarConfigs.warning;

    _showSnackbar(
      context,
      message,
      config,
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

  /// Shows a success snackbar (green theme).
  static void showSuccess(
    BuildContext context,
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
    final config = (icon != null || iconColor != null)
        ? SnackbarConfigs.success.copyWith(icon: icon, iconColor: iconColor)
        : SnackbarConfigs.success;

    _showSnackbar(
      context,
      message,
      config,
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

  /// Shows an info snackbar (blue theme).
  static void showInfo(
    BuildContext context,
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
    final config = (icon != null || iconColor != null)
        ? SnackbarConfigs.info.copyWith(icon: icon, iconColor: iconColor)
        : SnackbarConfigs.info;

    _showSnackbar(
      context,
      message,
      config,
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
}

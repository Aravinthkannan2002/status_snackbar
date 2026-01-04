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
///
/// All snackbars automatically adapt to dark/light theme.
///
/// Example:
/// ```dart
/// StatusSnackbar.showSuccess(context, 'Saved!');
/// StatusSnackbar.showError(context, 'Failed', subTitle: 'Try again');
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
  static void show(
    BuildContext context,
    String message,
    SnackbarState state, {
    String? subTitle,
    int durationSeconds = 3,
  }) {
    final config = _configs[state]!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDark ? config.darkBackgroundColor : config.lightBackgroundColor;
    final textColor = isDark ? config.darkTextColor : config.lightTextColor;

    // Get the ScaffoldMessengerState reference before showing snackbar
    // to avoid context issues when widget is disposed
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    scaffoldMessenger.hideCurrentSnackBar();

    scaffoldMessenger.showSnackBar(
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
              // Icon
              Icon(
                config.icon,
                size: 20,
                color: config.iconColor,
              ),
              const SizedBox(width: 10),

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

              // Close button
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
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.zero,
        duration: Duration(seconds: durationSeconds),
      ),
    );
  }

  /// Shows an error snackbar (red theme).
  ///
  /// Example:
  /// ```dart
  /// StatusSnackbar.showError(context, 'Something went wrong');
  /// ```
  static void showError(
    BuildContext context,
    String message, {
    String? subTitle,
    int durationSeconds = 3,
  }) {
    show(
      context,
      message,
      SnackbarState.error,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
    );
  }

  /// Shows a warning snackbar (amber theme).
  ///
  /// Example:
  /// ```dart
  /// StatusSnackbar.showWarning(context, 'Please check your input');
  /// ```
  static void showWarning(
    BuildContext context,
    String message, {
    String? subTitle,
    int durationSeconds = 3,
  }) {
    show(
      context,
      message,
      SnackbarState.warning,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
    );
  }

  /// Shows a success snackbar (green theme).
  ///
  /// Example:
  /// ```dart
  /// StatusSnackbar.showSuccess(context, 'Saved successfully!');
  /// ```
  static void showSuccess(
    BuildContext context,
    String message, {
    String? subTitle,
    int durationSeconds = 3,
  }) {
    show(
      context,
      message,
      SnackbarState.success,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
    );
  }

  /// Shows an info snackbar (blue theme).
  ///
  /// Example:
  /// ```dart
  /// StatusSnackbar.showInfo(context, 'New update available');
  /// ```
  static void showInfo(
    BuildContext context,
    String message, {
    String? subTitle,
    int durationSeconds = 3,
  }) {
    show(
      context,
      message,
      SnackbarState.info,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
    );
  }
}

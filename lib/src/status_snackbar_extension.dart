import 'package:flutter/material.dart';
import 'status_snackbar.dart';
import 'snackbar_state.dart';

/// Extension on [BuildContext] for easy snackbar access.
///
/// Provides convenient methods to show snackbars directly from context:
///
/// ```dart
/// context.showSuccessSnackbar('Done!');
/// context.showErrorSnackbar('Failed', subTitle: 'Please retry');
/// ```
extension StatusSnackbarExtension on BuildContext {
  /// Shows a snackbar with the specified state.
  void showSnackbar(
    String message,
    SnackbarState state, {
    String? subTitle,
    int durationSeconds = 3,
  }) {
    StatusSnackbar.show(
      this,
      message,
      state,
      subTitle: subTitle,
      durationSeconds: durationSeconds,
    );
  }

  /// Shows an error snackbar (red theme).
  ///
  /// Example:
  /// ```dart
  /// context.showErrorSnackbar('Something went wrong');
  /// ```
  void showErrorSnackbar(String message, {String? subTitle}) {
    StatusSnackbar.showError(this, message, subTitle: subTitle);
  }

  /// Shows a warning snackbar (amber theme).
  ///
  /// Example:
  /// ```dart
  /// context.showWarningSnackbar('Please check your input');
  /// ```
  void showWarningSnackbar(String message, {String? subTitle}) {
    StatusSnackbar.showWarning(this, message, subTitle: subTitle);
  }

  /// Shows a success snackbar (green theme).
  ///
  /// Example:
  /// ```dart
  /// context.showSuccessSnackbar('Saved successfully!');
  /// ```
  void showSuccessSnackbar(String message, {String? subTitle}) {
    StatusSnackbar.showSuccess(this, message, subTitle: subTitle);
  }

  /// Shows an info snackbar (blue theme).
  ///
  /// Example:
  /// ```dart
  /// context.showInfoSnackbar('New update available');
  /// ```
  void showInfoSnackbar(String message, {String? subTitle}) {
    StatusSnackbar.showInfo(this, message, subTitle: subTitle);
  }
}

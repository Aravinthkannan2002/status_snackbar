/// Beautiful, customizable snackbars with multiple states.
///
/// This library provides a simple way to show beautiful snackbars
/// with different states (success, error, warning, info) and
/// automatic dark mode support.
///
/// ## Usage
///
/// ```dart
/// // Using static methods
/// StatusSnackbar.showSuccess(context, 'Operation completed!');
/// StatusSnackbar.showError(context, 'Something went wrong');
///
/// // Using context extension
/// context.showSuccessSnackbar('Saved successfully!');
/// context.showErrorSnackbar('Failed to save', subTitle: 'Please try again');
/// ```
library status_snackbar;

export 'src/status_snackbar.dart';
export 'src/snackbar_state.dart';
export 'src/snackbar_config.dart';
export 'src/status_snackbar_extension.dart';

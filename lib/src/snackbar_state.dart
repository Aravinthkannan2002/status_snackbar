/// Snackbar states for different types of messages.
///
/// Each state has its own color scheme and icon that automatically
/// adapts to light and dark themes.
enum SnackbarState {
  /// Success state - green colors with check icon
  success,

  /// Error state - red colors with error icon
  error,

  /// Warning state - amber/yellow colors with warning icon
  warning,

  /// Info state - blue colors with info icon
  info,
}

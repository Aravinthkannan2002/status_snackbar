import 'package:flutter/material.dart';

/// Configuration for snackbar appearance.
///
/// Defines the colors and icon for each snackbar state,
/// supporting both light and dark themes.
///
/// You can use the default configurations from [SnackbarConfigs] or create
/// your own custom configuration.
///
/// Example - Custom config:
/// ```dart
/// const myCustomConfig = SnackbarConfig(
///   lightBackgroundColor: Color(0xFFE8F5E9),
///   lightTextColor: Color(0xFF1B5E20),
///   darkBackgroundColor: Color(0xFF1B5E20),
///   darkTextColor: Color(0xFFE8F5E9),
///   iconColor: Color(0xFF4CAF50),
///   icon: Icons.thumb_up,
/// );
/// ```
class SnackbarConfig {
  /// Creates a snackbar configuration.
  const SnackbarConfig({
    required this.lightBackgroundColor,
    required this.lightTextColor,
    required this.darkBackgroundColor,
    required this.darkTextColor,
    required this.iconColor,
    required this.icon,
  });

  /// Background color for light theme
  final Color lightBackgroundColor;

  /// Text color for light theme
  final Color lightTextColor;

  /// Background color for dark theme
  final Color darkBackgroundColor;

  /// Text color for dark theme
  final Color darkTextColor;

  /// Icon color (same for both themes)
  final Color iconColor;

  /// Icon to display
  final IconData icon;

  /// Creates a copy of this config with the given fields replaced.
  SnackbarConfig copyWith({
    Color? lightBackgroundColor,
    Color? lightTextColor,
    Color? darkBackgroundColor,
    Color? darkTextColor,
    Color? iconColor,
    IconData? icon,
  }) {
    return SnackbarConfig(
      lightBackgroundColor: lightBackgroundColor ?? this.lightBackgroundColor,
      lightTextColor: lightTextColor ?? this.lightTextColor,
      darkBackgroundColor: darkBackgroundColor ?? this.darkBackgroundColor,
      darkTextColor: darkTextColor ?? this.darkTextColor,
      iconColor: iconColor ?? this.iconColor,
      icon: icon ?? this.icon,
    );
  }
}

/// Default configurations for each snackbar state.
///
/// Use these pre-built configurations or customize them using [copyWith].
///
/// Example - Customize default config:
/// ```dart
/// final customSuccess = SnackbarConfigs.success.copyWith(
///   icon: Icons.thumb_up,
///   iconColor: Colors.teal,
/// );
/// ```
class SnackbarConfigs {
  SnackbarConfigs._();

  /// Error state configuration - red theme
  static const error = SnackbarConfig(
    lightBackgroundColor: Color(0xFFFEE2E2),
    lightTextColor: Color(0xFF991B1B),
    darkBackgroundColor: Color(0xFF450A0A),
    darkTextColor: Color(0xFFFECACA),
    iconColor: Color(0xFFDC2626),
    icon: Icons.error_rounded,
  );

  /// Warning state configuration - amber theme
  static const warning = SnackbarConfig(
    lightBackgroundColor: Color(0xFFFEF3C7),
    lightTextColor: Color(0xFF92400E),
    darkBackgroundColor: Color(0xFF451A03),
    darkTextColor: Color(0xFFFDE68A),
    iconColor: Color(0xFFF59E0B),
    icon: Icons.warning_rounded,
  );

  /// Success state configuration - green theme
  static const success = SnackbarConfig(
    lightBackgroundColor: Color(0xFFDCFCE7),
    lightTextColor: Color(0xFF166534),
    darkBackgroundColor: Color(0xFF052E16),
    darkTextColor: Color(0xFFBBF7D0),
    iconColor: Color(0xFF22C55E),
    icon: Icons.check_circle_rounded,
  );

  /// Info state configuration - blue theme
  static const info = SnackbarConfig(
    lightBackgroundColor: Color(0xFFDBEAFE),
    lightTextColor: Color(0xFF1E40AF),
    darkBackgroundColor: Color(0xFF1E3A5F),
    darkTextColor: Color(0xFFBFDBFE),
    iconColor: Color(0xFF3B82F6),
    icon: Icons.info_rounded,
  );
}

# Changelog

All notable changes to this project will be documented in this file.

## [1.1.1] - 2026-01-04

### Fixed
- Fixed demo GIF not displaying on pub.dev (now uses absolute GitHub URL)

## [1.1.0] - 2026-01-04

### Added
- Custom icon support for all snackbar methods (`icon` parameter)
- Custom icon color support (`iconColor` parameter)
- `showIcon` parameter to hide icons (`showIcon: false`)
- `showCloseButton` parameter to hide the close button
- `showCustom()` method for fully customizable snackbars
- `showCustomSnackbar()` context extension
- `copyWith()` method on `SnackbarConfig` for easy customization
- **Position support**: Show snackbars at top or bottom (`position: SnackbarPosition.top`)
- **Action button**: Add an action button with callback (`actionLabel`, `onAction`)
- **Dismiss callback**: Get notified when snackbar is dismissed (`onDismiss`)

### Changed
- All snackbar methods now accept optional `icon`, `iconColor`, `showIcon`, `showCloseButton`, `position`, `actionLabel`, `onAction`, and `onDismiss` parameters

## [1.0.1] - 2026-01-04

### Added
- Explicit platform support declarations (Android, iOS, Web, macOS, Windows, Linux)
- Platform support table in README

## [1.0.0] - 2026-01-04

### Added
- Initial release
- 4 snackbar states: success, error, warning, info
- Automatic dark mode support
- Optional subtitle for additional message details
- Close button to dismiss snackbar
- BuildContext extension for easy access
- Customizable duration
- Comprehensive documentation and examples

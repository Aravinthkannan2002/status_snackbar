import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:status_snackbar/status_snackbar.dart';

void main() {
  group('SnackbarState', () {
    test('has all required states', () {
      expect(SnackbarState.values.length, 4);
      expect(SnackbarState.values, contains(SnackbarState.success));
      expect(SnackbarState.values, contains(SnackbarState.error));
      expect(SnackbarState.values, contains(SnackbarState.warning));
      expect(SnackbarState.values, contains(SnackbarState.info));
    });
  });

  group('SnackbarConfigs', () {
    test('success config has correct icon', () {
      expect(SnackbarConfigs.success.icon, Icons.check_circle_rounded);
    });

    test('error config has correct icon', () {
      expect(SnackbarConfigs.error.icon, Icons.error_rounded);
    });

    test('warning config has correct icon', () {
      expect(SnackbarConfigs.warning.icon, Icons.warning_rounded);
    });

    test('info config has correct icon', () {
      expect(SnackbarConfigs.info.icon, Icons.info_rounded);
    });

    test('configs have different colors for light and dark modes', () {
      expect(
        SnackbarConfigs.success.lightBackgroundColor,
        isNot(equals(SnackbarConfigs.success.darkBackgroundColor)),
      );
      expect(
        SnackbarConfigs.error.lightTextColor,
        isNot(equals(SnackbarConfigs.error.darkTextColor)),
      );
    });
  });

  group('StatusSnackbar widget test', () {
    testWidgets('shows success snackbar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    StatusSnackbar.showSuccess(context, 'Test message');
                  },
                  child: const Text('Show'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Test message'), findsOneWidget);
    });

    testWidgets('shows snackbar with subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    StatusSnackbar.showError(
                      context,
                      'Error title',
                      subTitle: 'Error details',
                    );
                  },
                  child: const Text('Show'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Error title'), findsOneWidget);
      expect(find.text('Error details'), findsOneWidget);
    });

    testWidgets('context extension works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    context.showInfoSnackbar('Info message');
                  },
                  child: const Text('Show'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Info message'), findsOneWidget);
    });
  });
}

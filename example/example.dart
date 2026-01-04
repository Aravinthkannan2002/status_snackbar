import 'package:flutter/material.dart';
import 'package:status_snackbar/status_snackbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status Snackbar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Snackbar Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Basic Snackbars',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Success button
            ElevatedButton.icon(
              onPressed: () {
                context.showSuccessSnackbar(
                  'Success!',
                  subTitle: 'Your action was completed successfully.',
                );
              },
              icon: const Icon(Icons.check_circle, color: Colors.green),
              label: const Text('Show Success'),
            ),
            const SizedBox(height: 8),

            // Error button
            ElevatedButton.icon(
              onPressed: () {
                context.showErrorSnackbar(
                  'Error!',
                  subTitle: 'Something went wrong. Please try again.',
                );
              },
              icon: const Icon(Icons.error, color: Colors.red),
              label: const Text('Show Error'),
            ),
            const SizedBox(height: 8),

            // Warning button
            ElevatedButton.icon(
              onPressed: () {
                context.showWarningSnackbar(
                  'Warning!',
                  subTitle: 'Please review your input.',
                );
              },
              icon: const Icon(Icons.warning, color: Colors.amber),
              label: const Text('Show Warning'),
            ),
            const SizedBox(height: 8),

            // Info button
            ElevatedButton.icon(
              onPressed: () {
                context.showInfoSnackbar(
                  'Info',
                  subTitle: 'Here is some useful information.',
                );
              },
              icon: const Icon(Icons.info, color: Colors.blue),
              label: const Text('Show Info'),
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              'Position Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Top position
            OutlinedButton.icon(
              onPressed: () {
                context.showInfoSnackbar(
                  'Top Snackbar',
                  subTitle: 'This appears at the top!',
                  position: SnackbarPosition.top,
                );
              },
              icon: const Icon(Icons.arrow_upward),
              label: const Text('Show at Top'),
            ),
            const SizedBox(height: 8),

            // Bottom position (default)
            OutlinedButton.icon(
              onPressed: () {
                context.showInfoSnackbar(
                  'Bottom Snackbar',
                  subTitle: 'This appears at the bottom (default)',
                  position: SnackbarPosition.bottom,
                );
              },
              icon: const Icon(Icons.arrow_downward),
              label: const Text('Show at Bottom'),
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              'Action Button',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // With action button
            OutlinedButton.icon(
              onPressed: () {
                context.showErrorSnackbar(
                  'Item deleted',
                  actionLabel: 'Undo',
                  onAction: () {
                    context.showSuccessSnackbar('Item restored!');
                  },
                );
              },
              icon: const Icon(Icons.delete),
              label: const Text('Delete with Undo'),
            ),
            const SizedBox(height: 8),

            // Action with onDismiss
            OutlinedButton.icon(
              onPressed: () {
                context.showWarningSnackbar(
                  'Changes pending',
                  actionLabel: 'Save Now',
                  onAction: () {
                    context.showSuccessSnackbar('Saved!');
                  },
                  onDismiss: () {
                    debugPrint('Snackbar dismissed');
                  },
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('Save with Dismiss Callback'),
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              'Customization',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Custom icon
            OutlinedButton.icon(
              onPressed: () {
                context.showSuccessSnackbar(
                  'File uploaded!',
                  icon: Icons.cloud_done,
                );
              },
              icon: const Icon(Icons.cloud_upload),
              label: const Text('Custom Icon'),
            ),
            const SizedBox(height: 8),

            // Without icon
            OutlinedButton.icon(
              onPressed: () {
                context.showSuccessSnackbar(
                  'Simple message without icon',
                  showIcon: false,
                );
              },
              icon: const Icon(Icons.visibility_off),
              label: const Text('No Icon'),
            ),
            const SizedBox(height: 8),

            // Without close button
            OutlinedButton.icon(
              onPressed: () {
                context.showInfoSnackbar(
                  'No close button',
                  subTitle: 'Will auto-dismiss',
                  showCloseButton: false,
                );
              },
              icon: const Icon(Icons.close),
              label: const Text('No Close Button'),
            ),
            const SizedBox(height: 8),

            // Fully custom
            OutlinedButton.icon(
              onPressed: () {
                StatusSnackbar.showCustom(
                  context,
                  'Custom snackbar!',
                  subTitle: 'Purple theme with star icon',
                  config: SnackbarConfig(
                    lightBackgroundColor: Colors.purple.shade100,
                    lightTextColor: Colors.purple.shade900,
                    darkBackgroundColor: Colors.purple.shade900,
                    darkTextColor: Colors.purple.shade100,
                    iconColor: Colors.purple,
                    icon: Icons.star,
                  ),
                );
              },
              icon: const Icon(Icons.palette),
              label: const Text('Fully Custom'),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 16),

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
            const SizedBox(height: 16),

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
            const SizedBox(height: 16),

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
            const SizedBox(height: 32),

            // Using static method
            OutlinedButton(
              onPressed: () {
                StatusSnackbar.showSuccess(
                  context,
                  'Using static method!',
                );
              },
              child: const Text('Static Method Example'),
            ),
          ],
        ),
      ),
    );
  }
}

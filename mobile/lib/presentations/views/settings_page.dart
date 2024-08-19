import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../../config/constants.dart';
import '../../providers/theme_provider.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          children: [
            // Consumer(builder: (context, ref, child) {
            //   final isDark = ref.watch(isDarkProvider);
            //   return SwitchListTile(
            //     title: const Text('Dark Mode', style: TextStyle(fontSize: 20)),
            //     value: isDark,
            //     onChanged: (value) {
            //       ref.read(isDarkProvider.notifier).toggleTheme();
            //     },
            //   );
            // }),
            ListTile(
              title: const Text('About', style: TextStyle(fontSize: 20)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('About'),
                      content: const SingleChildScrollView(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Privacy Policy',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Introduction',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your information when you use our app.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Information We Collect',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '1. Personal Information: We may collect personal information such as your name, email address, and other contact details when you register or interact with our app.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '2. Usage Data: We collect information about how you use our app, including the features you use and the time spent on the app.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '3. Device Information: We collect information about the device you use to access our app, including the device model, operating system, and unique device identifiers.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'How We Use Your Information',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '1. To Provide and Improve Our Services: We use your information to operate, maintain, and improve our app.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '2. To Communicate with You: We may use your contact information to send you updates, notifications, and other information related to our app.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '3. To Personalize Your Experience: We use your information to personalize your experience and provide content and features that are relevant to you.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Sharing Your Information',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'We do not share your personal information with third parties except in the following circumstances:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '1. With Your Consent: We may share your information with third parties when we have your consent to do so.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '2. For Legal Reasons: We may disclose your information if required by law or in response to a legal request.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Security',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'We take reasonable measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is completely secure.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Changes to This Privacy Policy',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Contact Us',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'If you have any questions about this Privacy Policy, please contact us at admin@renolation.com.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

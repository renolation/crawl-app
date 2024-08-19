import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

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
            Consumer(builder: (context, ref, child) {
              final isDark = ref.watch(isDarkProvider);
              return SwitchListTile(
                title: const Text('Dark Mode', style: TextStyle(fontSize: 20)),
                value: isDark,
                onChanged: (value) {
                  ref.read(isDarkProvider.notifier).toggleTheme();
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/character');
              },
              child: const Text('Character Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/passive_skill');
              },
              child: const Text('Passive Skill Page'),
            ),
          ],
        ),
      ),
    );
  }
}

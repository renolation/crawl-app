import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/domains/echo/echo_entity.dart';

import '../../data/providers/fetch_detail.dart';

class EchoDetailPage extends HookConsumerWidget {
  const EchoDetailPage({
    super.key,
    required this.id,
    required this.echoEntity,
  });

  final int id;
  final EchoEntity echoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Echo Detail'),
      ),
      body:  Center(
        child: Consumer(builder: (context, ref, child) {
          final echo = ref.watch(fetchEchoByIdProvider(id: echoEntity.id!));
        return echo.when(data: (data){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data.name!),

              Text(data.cost!.toString()),
            ],
          );
        },
          error: (err, stack) => Text('Error $err'),
          loading: () => Text('loading'),
        );
      })),
    );
  }
}

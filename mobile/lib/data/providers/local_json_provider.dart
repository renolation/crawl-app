import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobile/domains/sonata_effect/sonata_effect_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_json_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<SonataEffectEntity>> fetchSonataEffect(FetchSonataEffectRef ref) async {
  final String response = await rootBundle.loadString('assets/data/sonata.json');
  final data = await json.decode(response);
  print(data.length);
  return List<SonataEffectEntity>.from(data.map((x) => SonataEffectEntity.fromJson(x)));
}
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mobile/data/providers/wuthering_api_provider.dart';
import 'package:mobile/domains/character/character_entity.dart';

part 'character_controller.g.dart';

@Riverpod(keepAlive: true)
class CharacterController extends _$CharacterController{
  @override
  FutureOr<List<CharacterEntity>> build() async {
    return getParent();
  }
  Future<List<CharacterEntity>> getParent() async {
    final wutheringRepo = ref.watch(wutheringApiProvider);
    return wutheringRepo.getCharacters();
  }
}

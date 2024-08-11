import 'package:mobile/domains/echo/echo_entity.dart';
import 'package:mobile/domains/item/item_entity.dart';
import 'package:mobile/domains/weapon/weapon_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domains/character_element/character_element_entity.dart';
import 'wuthering_api_provider.dart';

part 'fetch_character_elements.g.dart';

@Riverpod(keepAlive: true)
Future<List<CharacterElementEntity>> fetchCharacterElements(FetchCharacterElementsRef ref) async {
  final wutheringRepo = ref.watch(wutheringApiProvider);
  return await wutheringRepo.getCharacterElements();
}

@Riverpod(keepAlive: true)
Future<List<EchoEntity>> fetchEchoes(FetchEchoesRef ref) async {
  final wutheringRepo = ref.watch(wutheringApiProvider);
  return await wutheringRepo.getEchoes();
}

@Riverpod(keepAlive: true)
Future<List<WeaponEntity>> fetchWeapons(FetchWeaponsRef ref) async {
  final wutheringRepo = ref.watch(wutheringApiProvider);
  return await wutheringRepo.getWeapons();
}


@Riverpod(keepAlive: true)
Future<List<ItemEntity>> fetchItems(FetchItemsRef ref) async {
  final wutheringRepo = ref.watch(wutheringApiProvider);
  return await wutheringRepo.getItems();
}



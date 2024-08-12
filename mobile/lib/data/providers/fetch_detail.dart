import 'package:mobile/domains/weapon/weapon_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'wuthering_api_provider.dart';

part 'fetch_detail.g.dart';


@Riverpod(keepAlive: true)
Future<WeaponEntity> fetchWeaponById(FetchWeaponByIdRef ref,{required int id}) async {
  final wutheringRepo = ref.watch(wutheringApiProvider);
  return await wutheringRepo.getWeaponById(id.toString());
}
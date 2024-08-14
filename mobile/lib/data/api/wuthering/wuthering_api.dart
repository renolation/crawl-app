import 'package:dio/dio.dart';
import 'package:mobile/domains/character/character_entity.dart';
import 'package:mobile/domains/echo/echo_entity.dart';
import 'package:mobile/domains/item/item_entity.dart';
import 'package:mobile/domains/weapon/weapon_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domains/character_element/character_element_entity.dart';


part 'wuthering_api.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class WutheringApi {
  factory WutheringApi(Dio client, {
    String baseUrl,
  }) = _WutheringApi;

  @GET('/getter/list-character-elements')
  Future<List<CharacterElementEntity>> getCharacterElements();


  @GET('/getter/list-characters')
  Future<List<CharacterEntity>> getCharacters();


  @GET('/getter/list-echos')
  Future<List<EchoEntity>> getEchoes();

  @GET('/getter/echo/{id}')
  Future<EchoEntity> getEchoById(@Path() String id);

  @GET('/getter/list-weapons')
  Future<List<WeaponEntity>> getWeapons();

  @GET('/getter/weapon/{id}')
  Future<WeaponEntity> getWeaponById(@Path() String id);

  @GET('/getter/character/{id}')
  Future<CharacterEntity> getCharacterById(@Path() String id);

  @GET('/getter/list-items')
  Future<List<ItemEntity>> getItems();
}
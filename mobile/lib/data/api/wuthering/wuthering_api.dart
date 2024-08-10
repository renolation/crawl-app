import 'package:dio/dio.dart';
import 'package:mobile/data/dto/character_element/character_element_dto.dart';
import 'package:retrofit/retrofit.dart';


part 'wuthering_api.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class WutheringApi {
  factory WutheringApi(Dio client, {
    String baseUrl,
  }) = _WutheringApi;

  @GET('/getter/list-character-elements')
  Future<List<CharacterElementDTO>> getCharacterElements();

}
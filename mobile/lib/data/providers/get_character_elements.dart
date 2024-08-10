import 'package:mobile/data/dto/character_element/character_element_dto.dart';
import 'package:mobile/data/providers/wuthering_api_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_character_elements.g.dart';

@Riverpod(keepAlive: true)
class GetCharacterElements extends _$GetCharacterElements {
  @override
  FutureOr<List<CharacterElementDTO>> build() async {
    return getParent();
  }

  Future<List<CharacterElementDTO>> getParent() async {
    return await ref.read(wutheringApiProvider).getCharacterElements();
  }
}

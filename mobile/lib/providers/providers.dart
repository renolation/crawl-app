import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseUrlProvider = StateProvider<String?>((ref) {
  return 'http://103.188.82.191:3001';
});

// The current search filter
final searchCharacterProvider = StateProvider.autoDispose((ref) {
  ref.onDispose((){
    print('searchProvider disposed');
  });
  return '';
});
final searchEchoProvider = StateProvider.autoDispose((ref) => '');
final searchWeaponProvider = StateProvider.autoDispose((ref) => '');
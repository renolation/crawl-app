import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/constants.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  bool isDarkModeEnabled() {
    return sharedPreferences.getBool(sharedDarkModeKey) ?? true;
  }

  void setDarkModeEnabled({required bool isdark}) {
    sharedPreferences.setBool(sharedDarkModeKey, isdark);
  }
}

final isDarkProvider = StateNotifierProvider<DarkThemeNotifier, bool>((ref) {
  return DarkThemeNotifier(ref: ref);
});

class DarkThemeNotifier extends StateNotifier<bool> {
  DarkThemeNotifier({required this.ref}) : super(true) {
    state = ref.watch(sharedUtilityProvider).isDarkModeEnabled();
  }
  Ref ref;

  void toggleTheme() {
    ref.watch(sharedUtilityProvider).setDarkModeEnabled(
      isdark: !ref.watch(sharedUtilityProvider).isDarkModeEnabled(),
    );
    state = ref.watch(sharedUtilityProvider).isDarkModeEnabled();
  }
}
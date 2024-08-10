import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseUrlProvider = StateProvider<String?>((ref) {
  return 'http://103.188.82.191:3001';
});
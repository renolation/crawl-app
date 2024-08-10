import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/api/api.dart';

import '../../providers/providers.dart';
import 'dio_provider.dart';

Provider<WutheringApi> wutheringApiProvider = Provider<WutheringApi>(
      (ref) => WutheringApi(
    ref.watch(dioProvider),
    baseUrl: ref.watch(baseUrlProvider) ?? '',
  ),
);

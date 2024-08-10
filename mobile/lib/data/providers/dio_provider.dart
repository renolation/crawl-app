import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'error_handler_provider.dart';

final dioProvider = Provider<Dio>(
        (ref) => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        contentType: 'application/json',
      ),
    )
      ..interceptors.add(ref.watch(errorHandlerProvider))
  // ..interceptors
  //     .add(PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90)),
);

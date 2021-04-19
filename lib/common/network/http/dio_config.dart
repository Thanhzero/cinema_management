import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cinema/common/configs/configurations.dart';
import 'package:flutter_cinema/common/network/http/dio_interceptor.dart';

Dio dio = Dio(BaseOptions(
  connectTimeout: Configurations.connectTimeout,
  receiveTimeout: Configurations.responseTimeout,
  contentType: Configurations.contentType,
  headers: {'Accept': 'application/json'},
  baseUrl: Configurations.host,
))
  ..interceptors.add(logInterceptor)
  ..interceptors.add(DioInterceptor());

LogInterceptor logInterceptor = LogInterceptor(
  requestHeader: kDebugMode,
  requestBody: kDebugMode,
  responseBody: kDebugMode,
  responseHeader: false,
);

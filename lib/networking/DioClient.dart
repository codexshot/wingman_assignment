import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

const _defaultConnectTimeout = Duration(seconds: 5);
const _defaultReceiveTimeout = Duration(seconds: 5);

class DioClient {
  final String baseUrl;

  Dio? _dio;

  final List<Interceptor>? interceptors;
  String token;

  DioClient(
    this.baseUrl,
    this.token,
    Dio dio, {
    this.interceptors,
  }) {
    _dio = dio;
    _dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Token": token
      };
    if (interceptors?.isNotEmpty ?? false) {
      _dio!.interceptors.addAll(interceptors!);
    }
    if (kDebugMode) {
      _dio!.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
    }
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
         return json.decode(response.data);
    } on SocketException catch (e) {
      Get.snackbar(
        'Error', // Title of the snack bar
        e.toString(), // Message of the snack bar
        snackPosition: SnackPosition.BOTTOM, // Position of the snack bar
      );
      throw SocketException(e.toString());
    } on FormatException catch (_) {

      throw FormatException();
    } catch (e) {
      Get.snackbar(
        'Error', // Title of the snack bar
        e.toString(), // Message of the snack bar
        snackPosition: SnackPosition.BOTTOM, // Position of the snack bar
      );
      throw Exception(e);
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return json.decode(response.data);
    } on FormatException catch (_) {
      throw FormatException();
    } catch (e) {
      Get.snackbar(
        'Error', // Title of the snack bar
        e.toString(), // Message of the snack bar
        snackPosition: SnackPosition.BOTTOM, // Position of the snack bar
      );

      throw Exception(e);
    }
  }
}

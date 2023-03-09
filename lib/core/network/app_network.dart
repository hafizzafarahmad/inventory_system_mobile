import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inventory_system/core/network/api_endpoint.dart';
import 'package:inventory_system/dependency_injection.dart';
import 'package:inventory_system/features/auth/presentation/controller/auth_controller.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../common/widgets/snackbar/app_snackbar.dart';
import '../environment/local_data_constans.dart';

class AppNetworkClient {
  static const storage = FlutterSecureStorage();

  static final Dio _dio = Dio()
    ..options.connectTimeout = 10000;

  AppNetworkClient._();

  static final AppNetworkClient _instance = AppNetworkClient._();

  static final AuthController controller = AuthController(authRepository: sl());

  factory AppNetworkClient() {
    return _instance;
  }

  static Future<Response> get({
    Map<String, dynamic>? data,
    String? url,
    Map<String, dynamic>? customHeader,
    required String path,
  }) async {
    debugPrint("CALLING GET ${(url ?? ApiEndPoint.baseUrl) + path}");
    debugPrint("CALLING GET $data");
    String? token = await storage.read(key: LocalDataConstant.token);

    try {
      final res =
          await _dio.get(
              (url ?? ApiEndPoint.baseUrl) + path,
              queryParameters: data,
              options: Options(
                  headers: {
                    'Authorization' : 'Bearer $token',
                  }
              ),
          );

      debugPrint("CALLING GET ${res.requestOptions.path}");
      debugPrint("Query GET ${res.requestOptions.queryParameters}");
      debugPrint("CALLING GET ${res.requestOptions.headers}");
      debugPrint("CALLING GET ${res.data}");

      // debugPrint("Data Response " + res.data.toString());

      if(res.data["code"] != "200"){
        if(token != null){
          bool hasExpired = JwtDecoder.isExpired(token);

          if(hasExpired){
            controller.forceLogout();
          }
        }
        throw res.data['messages'].toString();
      }

      return res;
    } on DioError catch (e) {
      if(token != null){
        bool hasExpired = JwtDecoder.isExpired(token);

        if(hasExpired){
          controller.forceLogout();
        }
      }
      _errorCatch(e);
      try {
        throw "[500] Server Error, try again later";
      } catch (e) {
        throw e.toString();
      }
    } catch (e) {
      if(token != null){
        bool hasExpired = JwtDecoder.isExpired(token);

        if(hasExpired){
          controller.forceLogout();
        }
      }
      throw e.toString();
    }
  }

  static Future<Response> post({
    Map<String, dynamic>? data,
    String? url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? customHeader,
    String? token,
    required String path,
    FormData? form,
    // jsonMap for sending raw json to server
    Map<String, dynamic>? jsonMap,
  }) async {
    String? token = await storage.read(key: LocalDataConstant.token);

    customHeader ??= {
      'Authorization' : 'Bearer $token',
    };
    debugPrint("CALLING POST ${(url ?? ApiEndPoint.baseUrl) + path}");
    debugPrint("CALLING POST ${form?.fields.asMap()}");
    debugPrint("CALLING POST $jsonMap");
    try {
      final res = await _dio.post((url ?? ApiEndPoint.baseUrl) + path,
          data: form ?? jsonMap ?? FormData.fromMap(data!),
          queryParameters: params,
          options: Options(
            headers: customHeader
          ));

      debugPrint("CALLING POST ${res.requestOptions.path}");
      debugPrint("CALLING POST ${res.requestOptions.data}");
      debugPrint("CALLING POST ${res.requestOptions.headers}");
      debugPrint("CALLING POST ${res.data}");

      if(res.data["code"] != "200"){
        if(token != null){
          bool hasExpired = JwtDecoder.isExpired(token);

          if(hasExpired){
            controller.forceLogout();
          }
        }
        throw res.data['messages'].toString();
      }

      return res;
    } on DioError catch (e) {
      if(token != null){
        bool hasExpired = JwtDecoder.isExpired(token);

        if(hasExpired){
          controller.forceLogout();
        }
      }
      _errorCatch(e);
      try {
        throw "[${e.response!.statusCode}] Server Error, try again later";
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Response> put({
    Map<String, dynamic>? data,
    String? url,
    Map<String, dynamic>? customHeader,
    String? token,
    required String path,
    Map<String, dynamic>? params,
    FormData? form,
    // jsonMap for sending raw json to server
    Map<String, dynamic>? jsonMap,
  }) async {
    String? token = await storage.read(key: LocalDataConstant.token);

    customHeader ??= {
      'Authorization' : 'Bearer $token',
    };
    debugPrint("CALLING PUT ${(url ?? ApiEndPoint.baseUrl) + path}");
    debugPrint("CALLING PUT ${form?.fields.asMap()}");
    debugPrint("CALLING PUT $jsonMap");
    try {
      final res = await _dio.put((url ?? ApiEndPoint.baseUrl) + path,
          queryParameters: params,
          data: form ?? jsonMap ?? FormData.fromMap(data!),
          options: Options(
              headers: customHeader
          ));

      debugPrint("CALLING PUT ${res.requestOptions.path}");
      debugPrint("CALLING PUT ${res.requestOptions.data}");
      debugPrint("CALLING PUT ${res.requestOptions.headers}");
      debugPrint("CALLING PUT ${res.data}");

      if(res.data["code"] != "200"){
        if(token != null){
          bool hasExpired = JwtDecoder.isExpired(token);

          if(hasExpired){
            controller.forceLogout();
          }
        }
        throw res.data['messages'].toString();
      }

      return res;
    } on DioError catch (e) {
      if(token != null){
        bool hasExpired = JwtDecoder.isExpired(token);

        if(hasExpired){
          controller.forceLogout();
        }
      }
      _errorCatch(e);
      try {
        throw "[${e.response!.statusCode}] Server Error, try again later";
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Response> delete({
    Map<String, dynamic>? data,
    String? url,
    Map<String, dynamic>? customHeader,
    required String path,
  }) async {
    debugPrint("CALLING GET ${(url ?? ApiEndPoint.baseUrl) + path}");
    debugPrint("CALLING GET $data");
    String? token = await storage.read(key: LocalDataConstant.token);
    if(token != null){
      bool hasExpired = JwtDecoder.isExpired(token);

      if(hasExpired){
        controller.forceLogout();
      }
    }
    try {
      final res =
      await _dio.delete(
        (url ?? ApiEndPoint.baseUrl) + path,
        queryParameters: data,
        options: Options(
            headers: {
              'Authorization' : 'Bearer $token',
            }
        ),
      );

      debugPrint("CALLING DELETE ${res.requestOptions.path}");
      debugPrint("Query DELETE ${res.requestOptions.queryParameters}");
      debugPrint("CALLING DELETE ${res.requestOptions.headers}");
      debugPrint("CALLING DELETE ${res.data}");

      // debugPrint("Data Response " + res.data.toString());

      if(res.data["code"] != "200"){
        throw res.data['messages'].toString();
      }

      return res;
    } on DioError catch (e) {
      _errorCatch(e);
      try {
        throw "[500] Server Error, try again later";
      } catch (e) {
        throw e.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static void _errorCatch(DioError e) {
    if (e.response != null) {
      debugPrint("Error CALLING ${e.requestOptions.path}");

      debugPrint("Error Status Code ${e.response!.statusCode}");
      debugPrint("Error Response ${e.response!.data}");

      if (e.response!.statusCode == 401) {
        // AppSnackbar.warning("Warning", e.response!.data.toString());
        // getx.Get.find<SessionController>().setCurrentSession(null);
        // getx.Get.offAllNamed(RouteConstant.login);
      } else if (e.response!.data != null && e.response!.data['message'] != null) {
        AppSnackbar.warning("Warning", e.response!.data['message'].toString());
      } else {
        throw "[500] Server Error, try again later";
      }
    } else {
      // Something happened in setting up or sending the requestOptions that triggered an Error
      debugPrint("CALLING ${e.requestOptions}");
      debugPrint(e.message);
    }
  }
}

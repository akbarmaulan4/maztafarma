
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:maztafarma/core/errors/http_no_authorize_exception.dart';
import 'package:maztafarma/core/errors/http_status_failed_exception.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }
const BASE_URL = 'https://dev-bco.businesscorporateofficer.com/api';//"https://api-sandbox.kedai-sayur.com";
const INTERNAL_GATEWAY = '/internal-api-gateway/api/v1';

class API{

  static API? _instance;
  static API get instance {
    return _instance ??= API();
  }

  API();

  static headerPost() async {
    String token = LocalSources().getToken(); //PreferenceUtils.getString(TOKEN);
    var header = <String, String>{};
    header['Content-Type'] = 'application/json';
    header['Access-Control-Allow-Origin'] = '*';
    if(token != ''){
      header['Authorization'] = 'Bearer $token';
    }
    return header;
  }



  Future<ApiResponse<RESULT>> basePost<RESULT>(String module, Map<String, dynamic> post, bool isApplicationJson, ApiResponse<RESULT> Function(Map<String, dynamic> data) handleBody) async {
    final fullURL = Uri.parse(BASE_URL + module);
    http.Response response;
    try {

      if (kDebugMode) {
        debugPrint("URL: $fullURL", wrapWidth: 1024);
        debugPrint("HEADER: ${jsonEncode(await headerPost())}", wrapWidth: 1024);
        debugPrint("BODY: ${jsonEncode(post)}", wrapWidth: 1024);
      }
      response = await http.post(fullURL, headers: await headerPost(), body: isApplicationJson ? jsonEncode(post):post).timeout(const Duration(seconds: 60));
      int responseCode = response.statusCode;
      String body = response.body;
      var mapJson = jsonDecode(response.body);

      if (kDebugMode) {
        debugPrint("RESULT : ${jsonEncode(mapJson)}", wrapWidth: 1024);
      }

      if (responseCode == 200) {
        return handleBody(mapJson);
      }else if (responseCode >= 500) {
        return ApiResponse(
            error: HTTPStatusFailedException(message: mapJson?['error_message'] ?? 'Server error. silakan coba beberapa saat lagi. data: $mapJson',
                errorCode: responseCode,
                responseBody: body));
      } else if (responseCode == 401) {
        return ApiResponse(error: NoAuthorizationException(mapJson?['error_message']));
      } else if (responseCode >= 400) {
        return ApiResponse(
            error: HTTPStatusFailedException(
                message: mapJson?['error_message'] ?? 'Proses tidak berhasil. Silakan menghubungi support. data: $mapJson',
                errorCode: responseCode,
                responseBody: body));
      }else {
        return ApiResponse(error: HTTPStatusFailedException(message: 'Unknown Error', errorCode: -1, responseBody: body));
      }
    } on TimeoutException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Server timeout. Silakan coba lagi', errorCode: 408));
    } on SocketException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Koneksi terputus. Silahkan coba lagi', errorCode: 401));
    } on Exception catch (e) {
      return ApiResponse(error: HTTPStatusFailedException(message: e.toString(), errorCode: 401));
    }

  }

  Future<ApiResponse<RESULT>> basePostUpload<RESULT>(
      String module,
      String pathImage,
      Map<String, dynamic> post,
      ApiResponse<RESULT> Function(Map<String, dynamic> data) handleBody
    ) async {
    final fullURL = Uri.parse(BASE_URL + module);
    http.MultipartRequest request = new http.MultipartRequest("POST", fullURL);
    request.headers.addAll(await headerPost());
    try {

      if (kDebugMode) {
        debugPrint("URL: $fullURL", wrapWidth: 1024);
        debugPrint("HEADER: ${jsonEncode(await headerPost())}", wrapWidth: 1024);
        debugPrint("BODY: ${jsonEncode(post)}", wrapWidth: 1024);
      }
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('file', pathImage);
      for(int i=0; i<post.length; i++){
        var key = post.keys.elementAt(i);
        var value = post.values.elementAt(i);
        request.fields[key] = value;
      }
      request.files.add(multipartFile);
      http.StreamedResponse response = await request.send();
      int responseCode = response.statusCode;

      Map<String, dynamic> mapResponse = Map();
      if (responseCode == 200) {
        mapResponse["status"] = true;
        mapResponse["message"] = 'Upload berhasil';
        return handleBody(mapResponse);
      }else if (responseCode >= 500) {
        mapResponse["statusCode"] = responseCode;
        mapResponse["message"] = 'Server error. silakan coba beberapa saat lagi';
        return ApiResponse(
            error: HTTPStatusFailedException(message: 'Server error. silakan coba beberapa saat lagi.',
                errorCode: responseCode,
                responseBody: 'Server error. silakan coba beberapa saat lagi'));
      } else if (responseCode == 401) {
        return ApiResponse(error: NoAuthorizationException('Sesi anda berakhir, silahkan login kembali'));
      } else if (responseCode >= 400) {
        return ApiResponse(
            error: HTTPStatusFailedException(
                message: 'Proses tidak berhasil. Silakan menghubungi support.',
                errorCode: responseCode,
                responseBody: 'Proses tidak berhasil. Silakan menghubungi support.'));
      }else {
        return ApiResponse(error: HTTPStatusFailedException(message: 'Unknown Error', errorCode: -1, responseBody: 'Unknow Response'));
      }
    } on TimeoutException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Server timeout. Silakan coba lagi', errorCode: 408));
    } on SocketException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Koneksi terputus. Silahkan coba lagi', errorCode: 401));
    } on Exception catch (e) {
      return ApiResponse(error: HTTPStatusFailedException(message: e.toString(), errorCode: 401));
    }

  }

  Future<ApiResponse<RESULT>> baseGet<RESULT>(String module, ApiResponse<RESULT> Function(Map<String, dynamic> data) handleBody) async {
    final fullURL = Uri.parse(BASE_URL + module);
    http.Response response;
    try {
      if (kDebugMode) {
        debugPrint("URL: $fullURL", wrapWidth: 1024);
        debugPrint("HEADER: ${jsonEncode(await headerPost())}", wrapWidth: 1024);
      }
      response = await http.get(fullURL, headers: await headerPost()).timeout(const Duration(seconds: 60));
      int responseCode = response.statusCode;
      String body = response.body;
      var mapJson = jsonDecode(response.body);

      if (kDebugMode) {
        debugPrint("RESULT : ${jsonEncode(mapJson)}", wrapWidth: 1024);
      }

      if (responseCode == 200) {
        return handleBody(mapJson);
      }else if (responseCode >= 500) {
        return ApiResponse(
            error: HTTPStatusFailedException(message: mapJson?['error_message'] ?? 'Server error. silakan coba beberapa saat lagi. data: $mapJson',
                errorCode: responseCode,
                responseBody: body));
      } else if (responseCode == 401) {
        return ApiResponse(error: NoAuthorizationException(mapJson?['error_message']));
      } else if (responseCode >= 400) {
        return ApiResponse(
            error: HTTPStatusFailedException(
                message: mapJson?['error_message'] ?? 'Proses tidak berhasil. Silakan menghubungi support. data: $mapJson',
                errorCode: responseCode,
                responseBody: body));
      }else {
        return ApiResponse(error: HTTPStatusFailedException(message: 'Unknown Error', errorCode: -1, responseBody: body));
      }
    } on TimeoutException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Server timeout. Silakan coba lagi', errorCode: 408));
    } on SocketException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Koneksi terputus. Silahkan coba lagi', errorCode: 401));
    } on Exception catch (e) {
      return ApiResponse(error: HTTPStatusFailedException(message: e.toString(), errorCode: 401));
    }
  }

  Future<ApiResponse<RESULT>> baseGetURL<RESULT>({String? url,
      ApiResponse<RESULT> Function(List<dynamic> data)? handleBody}) async {
    final fullURL = Uri.parse(url!);
    http.Response response;
    try {
      if (kDebugMode) {
        debugPrint("URL: $fullURL", wrapWidth: 1024);
        debugPrint("HEADER: ${jsonEncode(await headerPost())}", wrapWidth: 1024);
      }
      response = await http.get(fullURL, headers: await headerPost()).timeout(const Duration(seconds: 60));
      int responseCode = response.statusCode;
      String body = response.body;
      var mapJson = jsonDecode(response.body);

      if (kDebugMode) {
        debugPrint("RESULT : ${jsonEncode(mapJson)}", wrapWidth: 1024);
      }

      if (responseCode == 200) {
        return handleBody!(mapJson);
      }else if (responseCode >= 500) {
        return ApiResponse(
            error: HTTPStatusFailedException(message: mapJson?['error_message'] ?? 'Server error. silakan coba beberapa saat lagi. data: $mapJson',
                errorCode: responseCode,
                responseBody: body));
      } else if (responseCode == 401) {
        return ApiResponse(error: NoAuthorizationException(mapJson?['error_message']));
      } else if (responseCode >= 400) {
        return ApiResponse(
            error: HTTPStatusFailedException(
                message: mapJson?['error_message'] ?? 'Proses tidak berhasil. Silakan menghubungi support. data: $mapJson',
                errorCode: responseCode,
                responseBody: body));
      }else {
        return ApiResponse(error: HTTPStatusFailedException(message: 'Unknown Error', errorCode: -1, responseBody: body));
      }
    } on TimeoutException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Server timeout. Silakan coba lagi', errorCode: 408));
    } on SocketException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Koneksi terputus. Silahkan coba lagi', errorCode: 401));
    } on Exception catch (e) {
      return ApiResponse(error: HTTPStatusFailedException(message: e.toString(), errorCode: 401));
    }
  }

  Future<ApiResponse<RESULT>> basePut<RESULT>(String module, Map<String, dynamic> post, ApiResponse<RESULT> Function(Map<String, dynamic> data) handleBody) async {
    final fullURL = Uri.parse(BASE_URL + module);
    http.Response response;
    try {
      if (kDebugMode) {
        debugPrint("URL: $fullURL", wrapWidth: 1024);
        debugPrint("HEADER: ${jsonEncode(await headerPost())}", wrapWidth: 1024);
      }
      response = await http.put(fullURL, headers: await headerPost(), body: jsonEncode(post)).timeout(const Duration(seconds: 60));
      int responseCode = response.statusCode;
      String body = response.body;
      var mapJson = jsonDecode(response.body);

      if (responseCode == 200) {
        return handleBody(mapJson);
      }else if (responseCode >= 500) {
        return ApiResponse(
            error: HTTPStatusFailedException(message: mapJson?['error_message'] ?? 'Server error. silakan coba beberapa saat lagi. data: $mapJson',
                errorCode: responseCode,
                responseBody: body));
      } else if (responseCode == 401) {
        return ApiResponse(error: NoAuthorizationException(mapJson?['error_message']));
      } else if (responseCode >= 400) {
        return ApiResponse(
            error: HTTPStatusFailedException(
                message: mapJson?['error_message'] ?? 'Proses tidak berhasil. Silakan menghubungi support. data: $mapJson',
                errorCode: responseCode,
                responseBody: body));
      }else {
        return ApiResponse(error: HTTPStatusFailedException(message: 'Unknown Error', errorCode: -1, responseBody: body));
      }
    } on TimeoutException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Server timeout. Silakan coba lagi', errorCode: 408));
    } on SocketException catch (_) {
      return ApiResponse(error: HTTPStatusFailedException(message: 'Koneksi terputus. Silahkan coba lagi', errorCode: 401));
    } on Exception catch (e) {
      return ApiResponse(error: HTTPStatusFailedException(message: e.toString(), errorCode: 401));
    }
  }
}

class ApiResponse<RESULT> {
  int? totalRecord;
  RESULT? result;
  Exception? error;
  ApiResponse({this.result, this.error, this.totalRecord});
}
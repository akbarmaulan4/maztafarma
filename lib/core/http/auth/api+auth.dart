
import 'package:maztafarma/core/http/api.dart';
import 'package:maztafarma/core/http/path_api.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_login.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_token.dart';

extension APIAuth on API{

  Future<ApiResponse<MToken>> generateToken({
    required Map<String, dynamic> post,
    required ApiResponse<MToken> Function(Map<String, dynamic> data) handleBody,
    bool isApplicationJson = true
  }){
    return basePost('$INTERNAL_GATEWAY/$GENERATE_TOKEN', post, isApplicationJson, handleBody);
  }

  Future<ApiResponse<MLogin>> login({
    required Map<String, dynamic> post,
    required ApiResponse<MLogin> Function(Map<String, dynamic> data) handleBody,
    bool isApplicationJson = true
  }){
    return basePost('$LOGIN', post, isApplicationJson, handleBody);
  }

}
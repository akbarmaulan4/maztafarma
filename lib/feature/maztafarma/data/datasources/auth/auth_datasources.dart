
import 'package:maztafarma/core/http/api.dart';
import 'package:maztafarma/core/http/auth/api+auth.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_login.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_token.dart';

class AuthDataSources {

  Future<ApiResponse<MLogin>> login({required Map<String, dynamic> post}) {
    // TODO: implement login
    return API.instance.login(
        post: post,
        handleBody: (Map<String, dynamic>? json){
          if(json != null){
            MLogin model = MLogin.fromJson(json);
            return ApiResponse<MLogin>(result: model);
          }
          return ApiResponse<MLogin>();
        }
    );
  }

  Future<bool> logout({required String userName, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  Future<ApiResponse<MToken>> generateToken({required Map<String, dynamic> post}) {
    // TODO: implement generateToken
    return API.instance.generateToken(
        post: post,
        isApplicationJson: true,
        handleBody: (Map<String, dynamic>? json) {
          if (json != null) {
            MToken token = MToken.fromJson(json);
            return ApiResponse<MToken>(result: token);
          } else {
            return ApiResponse<MToken>();
          }
        }
    );
  }

  // Future<ApiResponse<MUser>> getProfile({required String userId}) {
  //   // TODO: implement getProfile
  //   return API.instance.getProfile(
  //       post: Map<String, dynamic>(),
  //       isApplicationJson: true,
  //       handleBody: (Map<String, dynamic>? json) {
  //         if (json != null) {
  //           // MToken token = MToken.fromJson(json);
  //           return ApiResponse<MUser>(result: MUser());
  //         } else {
  //           return ApiResponse<MUser>();
  //         }
  //       }
  //   );
  // }

}

import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:maztafarma/core/connection/connectivity.dart';
import 'package:maztafarma/core/constant/dialog_constant.dart';
import 'package:maztafarma/core/errors/no_connection_exception.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/auth/auth_datasources.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_login.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_token.dart';
import 'package:maztafarma/feature/maztafarma/domain/repository/auth/auth_repository_interface.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/profile/logout_widget.dart';

class AuthRepository with ConnectivityMixin implements AuthRepositoryInterface{

  final AuthDataSources authDataSources;

  AuthRepository(this.authDataSources);

  @override
  Future<Either<Exception, MLogin>> login({required String userName, required String password}) async {
    // TODO: implement login
    Map<String, String> post = Map();
    post['email']=userName;
    post['password']=password;

    if (await isInConnection()) {
      final response = await authDataSources.login(post: post);
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    } else {
      return Left(NoConnectionException());
    }

  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    DialogConstant.showBottomSheet(
        context: Get.context,
        child: LogoutWidget()
    );
  }

  @override
  Future<Either<Exception, MToken>> generateToken() async {
    // TODO: implement generateToken
    //disini bisa di conver dari model ke entity

    Map<String, String> post = Map();
    post['secret_key']='R832hF48ehgf37gQdr9jH3jhvQrUbJdsAhb3Kd1h';

    if (await isInConnection()) {
      final response = await await authDataSources.generateToken(post: post);
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    } else {
      return Left(NoConnectionException());
    }
  }
  //
  // @override
  // Future<String> getProfile({required String userId}) async {
  //   // TODO: implement getProfile
  //   final response = await authDataSources.getProfile(userId: userId);
  //   if (response.error != null) {
  //     // return Left(response.error!);
  //   } else if (response.result == null) {
  //     // return Left(Exception('Unable to get token from API'));
  //   }
  //   // return Right(EToken.copyFrom(response.result!));
  //   return '';
  // }
  
}
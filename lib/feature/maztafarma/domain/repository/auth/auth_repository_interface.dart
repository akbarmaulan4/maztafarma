
import 'package:either_dart/either.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_login.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_token.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/auth/e_login.dart';

abstract class AuthRepositoryInterface{
  Future<Either<Exception, MToken>> generateToken();
  Future<Either<Exception, ELogin>> login({required String userName, required String password});
  Future<bool> logout();
}
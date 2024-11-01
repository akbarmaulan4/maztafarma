

import 'package:either_dart/either.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_login.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/auth/e_login.dart';
import 'package:maztafarma/feature/maztafarma/domain/repository/auth/auth_repository_interface.dart';

class GetAuth{
  AuthRepositoryInterface repository;
  GetAuth(this.repository);

  // Future<void> generateToken() async {
  //   var token = await repository.generateToken();
  //   print('Result Token : $token');
  // }

  Future<Either<Exception, ELogin>> login(String userName, String password) async {
    return repository.login(userName: userName, password: password);
  }

  Future<void> logout() async {
    repository.logout();
  }
}
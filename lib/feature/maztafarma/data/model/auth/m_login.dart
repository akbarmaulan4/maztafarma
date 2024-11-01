import 'package:maztafarma/feature/maztafarma/data/model/auth/m_user.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/auth/e_login.dart';

part 'm_login.g.dart';

class MLogin extends ELogin{

  MLogin({required String token, required MUser data}):super(token: token, data: data);

  factory MLogin.fromJson(Map<String, dynamic> json) => _$fromJson(json);
}
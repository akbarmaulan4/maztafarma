
import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_user.dart';

class LocalSources {

  saveToken(String token){
    GetStorage().write('token', token);
  }

  getToken(){
    var data = GetStorage().read('token');
    if(data == null) return '';
    return GetStorage().read('token');
  }

  saveUser(MUser data){
    GetStorage().write('user', jsonEncode(data));
  }

  MUser getUser(){
    var data = GetStorage().read('user');
    if(data == null) return MUser();
    return MUser.fromJson(jsonDecode(data));
  }

  clear(){
    GetStorage().erase();
  }
}
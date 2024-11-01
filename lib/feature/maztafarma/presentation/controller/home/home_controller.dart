
import 'package:get/get.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';
import 'package:maztafarma/feature/maztafarma/data/model/auth/m_user.dart';

class HomeController extends GetxController{
  Rx<MUser> dataUser = MUser().obs;

  loadUser(){
    var data = LocalSources().getUser();
    if(data.id_divisi != null){
      dataUser.value = data;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUser();
  }
}
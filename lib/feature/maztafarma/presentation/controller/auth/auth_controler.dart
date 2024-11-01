import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maztafarma/core/constant/dialog_constant.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';
import 'package:maztafarma/feature/maztafarma/domain/usecase/get_auth.dart';
import 'package:maztafarma/feature/skeleton/skeleton.dart';

class AuthController extends GetxController{

  GetAuth auth;
  AuthController(this.auth);

  // BaseController baseController = Get.find();

  RxBool showPassword = true.obs;
  TextEditingController edtUserneme = TextEditingController();
  TextEditingController edtPassword = TextEditingController();

  void showPassswod(val) => showPassword.value = val;

  submitLogin() async {
    if(edtUserneme.text.isEmpty) {
      DialogConstant.alertMessage('Peringatan', 'Username tidak boleh kosong!', () { });
    }else if(edtPassword.text.isEmpty){
      DialogConstant.alertMessage('Peringatan', 'Password tidak boleh kosong!', () { });
    }else{
      DialogConstant.loading();
      final result = await auth.login(edtUserneme.text, edtPassword.text);
      Get.back();
      if(result.isLeft){
        var exception = result.left;
        var message = exception.toString();
        DialogConstant.alertMessage('Peringatan', message, () { });
        return;
      }
      if(result.isRight){
        var right = result.right;
        LocalSources().saveToken(right.token!);
        LocalSources().saveUser(right.data!);
        Get.off(()=>Skeleton());
      }
    }
  }

  void logout() => auth.logout();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // generateToken();
  }

}
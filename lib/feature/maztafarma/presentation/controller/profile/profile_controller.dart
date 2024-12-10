import 'package:get/get.dart';
import 'package:maztafarma/core/constant/dialog_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/profile/logout_widget.dart';

class ProfileControlle extends GetxController{

  logout(){
    DialogConstant.showBottomSheet(
      context: Get.context,
      child: LogoutWidget()
    );
  }
}
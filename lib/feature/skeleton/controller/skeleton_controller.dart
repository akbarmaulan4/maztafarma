
import 'package:get/get.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/home/home_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/profile/profile_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/statistic/statistic_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/task/task_page.dart';

class SkeletonController extends GetxController{

  /*
  * Menu Navigation
  * 0 = Home
  * 1 = task
  * 2 = statistic
  * 3 = profile
  * */
  RxInt currentMenu = 0.obs;

  changeMenu(int val){
    currentMenu.value = val;
  }

  changePage(){
    switch (currentMenu.value){
      case 0:
        return HomePage();
      case 1:
        return TaskPage();
      case 2:
        return StatisticPage();
      case 3:
        return ProfilePage();
        default:
          return HomePage();
    }
  }
}
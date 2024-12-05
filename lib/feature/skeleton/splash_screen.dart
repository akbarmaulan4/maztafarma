import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maztafarma/core/constant/image_constant.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/auth/auth_controler.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/auth/login_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/basic/infinity_list_page.dart';
import 'package:maztafarma/feature/skeleton/skeleton.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthController controller = Get.find();

  loading(){
    // controller.generateToken();
    Future.delayed(Duration(seconds: 2), (){
      if(LocalSources().getUser().id_divisi != null)
        Get.off(()=>Skeleton());
      else
        Get.off(()=>LoginPage());
      //   Get.off(()=>InfinityListPage());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Image.asset(logo),
        ),
      ),
    );
  }
}

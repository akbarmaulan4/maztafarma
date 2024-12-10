import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/auth/auth_datasources.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/master/master_datasources.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/task/task_datasources.dart';
import 'package:maztafarma/feature/maztafarma/data/repository/auth/auth_repository_impl.dart';
import 'package:maztafarma/feature/maztafarma/data/repository/master/master_repository_impl.dart';
import 'package:maztafarma/feature/maztafarma/data/repository/task/task_repository_impl.dart';
import 'package:maztafarma/feature/maztafarma/domain/usecase/get_auth.dart';
import 'package:maztafarma/feature/maztafarma/domain/usecase/get_master.dart';
import 'package:maztafarma/feature/maztafarma/domain/usecase/get_task.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/auth/auth_controler.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/home/home_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/master/master_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/profile/profile_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/task/task_controller.dart';
import 'package:maztafarma/feature/skeleton/splash_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  // final authDataSources = AuthDataSources();
  // final authRepository = AuthRepository(authDataSources);
  // Get.lazyPut(() => AuthController(GetAuth(authRepository)));

  HttpOverrides.global = new MyHttpOverrides();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: greenPrimaryColor),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder((){
        Get.put(AuthController(GetAuth(AuthRepository(AuthDataSources()))));
        Get.put(HomeController());
        Get.put(MasterController(GetMaster(MasterRepository(MasterDataSources()))));
        Get.put(TaskController(GetTask(TaskRepository(TaskDataSources()))));
        Get.put(ProfileControlle());
      }),
      home: SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/image_constant.dart';
import 'package:maztafarma/core/theme/typography.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/auth/auth_controler.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/button_app_widget.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(logoNoText, height: 50,),
              SizedBox(height: 45),
              Text('Login', style: mBigHeading),
              SizedBox(height: 45),
              Container(
                child: TextField(
                  controller: controller.edtUserneme,
                  style: GoogleFonts.rubik(),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.person_alt, color: Colors.black26,),
                    hintText: 'Username/Email',
                    hintStyle: GoogleFonts.rubik().copyWith(fontSize: 14, color: Colors.black26),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12))
                  ),
                ),
              ),
              SizedBox(height: 30),
              Obx(() => Container(
                child: TextField(
                  controller: controller.edtPassword,
                  obscureText: controller.showPassword.value,
                  style: GoogleFonts.rubik(),
                  decoration: InputDecoration(
                      prefixIcon: Icon(controller.showPassword.value ? CupertinoIcons.lock_fill:CupertinoIcons.lock_open_fill, color: Colors.black26,),
                      suffixIcon: GestureDetector(
                          onTap: ()=>controller.showPassswod(!controller.showPassword.value),
                          child: Icon(controller.showPassword.value ? CupertinoIcons.eye_slash_fill:CupertinoIcons.eye_fill, color: Colors.black26,)
                      ),
                      hintText: 'Password',
                      hintStyle: mParagraph.copyWith(color: Colors.black26), //GoogleFonts.rubik().copyWith(fontSize: 14, color: Colors.black26),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12))
                  ),
                ),
              )),
              SizedBox(height: 30),
              ButtonAppWidget(title: 'Login', onPressed: ()=>controller.submitLogin())
            ],
          ),
        ),
      ),
    );
  }
}

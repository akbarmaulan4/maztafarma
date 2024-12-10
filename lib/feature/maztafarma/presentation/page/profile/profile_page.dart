import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/color_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/auth/auth_controler.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/profile/profile_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/profile/header_profile_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/profile/profile_menu_widget.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ProfileControlle controlle = Get.find();
    AuthController authController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Profile', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600, color: bluePrimaryColor)),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //header
                HeaderProfileWidget(),
                Divider(),
                SizedBox(height: 35,),
                ProfileMenuWidget(
                  icon: Icons.bar_chart,
                  title: 'Statistic',
                  onClick: (){}
                ),
                SizedBox(height: 20,),
                ProfileMenuWidget(
                  icon: Icons.password,
                  title: 'Change Password',
                  onClick: (){}
                ),
                SizedBox(height: 20,),
                Divider(),
                SizedBox(height: 20,),
                ProfileMenuWidget(
                    icon: Icons.logout,
                    title: 'Logout',
                    onClick: ()=>authController.logout()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

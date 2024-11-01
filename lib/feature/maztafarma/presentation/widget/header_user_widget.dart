import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/home/home_controller.dart';

class HeaderUserWidget extends StatelessWidget {
  const HeaderUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Obx(() => Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.dataUser.value.id_user != null ? controller.dataUser.value.name!:'Hallo', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600)),
                Text(controller.dataUser.value.id_user != null ? controller.dataUser.value.role!:'Selamat Datang',  style: GoogleFonts.rubik().copyWith(fontSize: 15))
              ],
            ),
          ),
          SizedBox(
            height: 50, width: 50,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
                //set border radius more than 50% of height and width to make circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black12,
                  backgroundImage: NetworkImage(
                    'https://cdn.prod.website-files.com/6318be76dbd6930c5f04cb53/631a5b3cda08e18ebf63f147_AdobeStock_246344306-scaled.jpeg',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

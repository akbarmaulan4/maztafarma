import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/home/home_controller.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Row(
      children: [
        SizedBox(
          height: 65, width: 65,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
              //set border radius more than 50% of height and width to make circle
            ),
            child: const Padding(
              padding: EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black12,
                backgroundImage: NetworkImage(
                  'https://cdn.prod.website-files.com/6318be76dbd6930c5f04cb53/631a5b3cda08e18ebf63f147_AdobeStock_246344306-scaled.jpeg',
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.dataUser.value.id_user != null ? controller.dataUser.value.name!:'Anggun Sasmita', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600)),
              Text(controller.dataUser.value.id_user != null ? controller.dataUser.value.role!:'Senior Sales',  style: GoogleFonts.rubik().copyWith(fontSize: 15)),
            ],
          ),
        )
      ],
    );
  }
}

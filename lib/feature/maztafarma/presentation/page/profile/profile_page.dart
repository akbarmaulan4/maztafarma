import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/color_constant.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Profile', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600, color: bluePrimaryColor)),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80, width: 80,
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
                ),
                Text('Anggun Sasmita', style: GoogleFonts.rubik().copyWith(fontSize: 25, fontWeight: FontWeight.w600)),
                Text('Senior Sales',  style: GoogleFonts.rubik().copyWith(fontSize: 15)),
                SizedBox(height: 35,),
                itemMenu(),
                SizedBox(height: 10),
                itemMenu(),
                SizedBox(height: 10),
                itemMenu()
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemMenu(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxStyleConstant.boxButton(
              radius: 16, color: Colors.purple.shade200
          ),
          width: MediaQuery.of(context).size.width * 0.30,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxStyleConstant.boxButton(
                    radius: 16, color: Colors.purple
                ),
                padding: EdgeInsets.all(10),
                child: Icon(CupertinoIcons.person_alt, color: Colors.white, size: 35,),
              ),
              SizedBox(height: 10),
              Text('Personal',  style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('4 Task',  style: GoogleFonts.rubik().copyWith(fontSize: 14))
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxStyleConstant.boxButton(
              radius: 16, color: Colors.purple.shade200
          ),
          width: MediaQuery.of(context).size.width * 0.30,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxStyleConstant.boxButton(
                    radius: 16, color: Colors.purple
                ),
                padding: EdgeInsets.all(10),
                child: Icon(CupertinoIcons.person_alt, color: Colors.white, size: 35,),
              ),
              SizedBox(height: 10),
              Text('Work',  style: GoogleFonts.rubik().copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 5),
              Text('4 Task',  style: GoogleFonts.rubik().copyWith(fontSize: 14))
            ],
          ),
        ),
      ],
    );
  }
}

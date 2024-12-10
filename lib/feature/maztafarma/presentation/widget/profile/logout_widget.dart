import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maztafarma/core/theme/typography.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/auth/login_page.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('Peringatan',  style: mButtonTitle,),
              ),
              Divider(),
              Text('Apakah kamu mau keluar aplikasi?',  style: mButtonTitle,),
              SizedBox(height: 35),
              Container(
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                          onPressed: (){
                            LocalSources().clear();
                            Get.back();
                            Get.offAll(()=>LoginPage());
                          },
                          child: Text('Ya',  style: mButtonTitle,),
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                              foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  )
                              )

                          ),
                        )
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextButton(
                        onPressed: ()=>Get.back(),
                        child: Text('Tidak',  style: mButtonTitle,),
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.redAccent,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.redAccent),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            )
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

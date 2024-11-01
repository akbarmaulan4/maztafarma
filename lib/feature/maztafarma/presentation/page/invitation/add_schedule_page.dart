import 'package:flutter/material.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/button_app_widget.dart';

import '../../../../../core/constant/box_style_constant.dart';
import '../../widget/header_user_widget.dart';

class AddSchedulePage extends StatelessWidget {
  const AddSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Tambah Jadwal Kunjungan', style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
      ),
      // bottomSheet: Container(
      //   width: double.infinity,
      //   height: 80,
      //   decoration: BoxStyleConstant.boxShadowButonRadius(
      //     color: Colors.white,
      //     topLeft: 15, topRight: 15,
      //     blurRadius: 5,
      //     spreadRadius: 6,
      //     colorShadow: Colors.grey.shade200,
      //     offset: Offset(4, 0),
      //   ),
      //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       Container(
      //         decoration: BoxStyleConstant.boxButton(
      //             color: Colors.green,
      //             radius: 15
      //         ),
      //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      //         child: Text('Simpan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      //       )
      //     ],
      //   ),
      // ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              // Container(
              //   decoration: BoxStyleConstant.boxShadowButonRadius(
              //       blurRadius: 5,
              //       color: Colors.green,
              //       spreadRadius: 2,
              //       colorShadow: Colors.grey.shade200,
              //       offset: Offset(0, 4),
              //       bottomLeft: 25, bottomRight: 25
              //   ),
              //   padding: EdgeInsets.symmetric(vertical: 25),
              //   child: Column(
              //     children: [
              //       HeaderUserWidget(),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 25),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Tambah Jadwal Kunjungan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ),
              textFieldWidget('Tipe Kunjungan'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tujuan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                    SizedBox(height: 5),
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              tristate: true,
                              value: true,
                              onChanged: (bool? value) {
                              },
                            ),
                            Text('Dokter')
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              isError: true,
                              tristate: true,
                              value: false,
                              onChanged: (bool? value) {
                              },
                            ),
                            Text('Klinik')
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              isError: true,
                              tristate: true,
                              value: false,
                              onChanged: null,
                            ),
                            Text('Rumah Sakit')
                          ],
                        )

                      ],
                    )
                  ],
                ),
              ),
              textFieldWidget('Alamat'),
              textFieldWidget('Produk'),
              textFieldWidget('Jadwal Kunjungan'),
              textFieldWidget('Alamat'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Join Visit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                    SizedBox(height: 5),
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              tristate: true,
                              value: true,
                              onChanged: (bool? value) {
                              },
                            ),
                            Text('Yes')
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              isError: true,
                              tristate: true,
                              value: false,
                              onChanged: (bool? value) {
                              },
                            ),
                            Text('No')
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              textFieldWidget('Perkiraan Penjualan'),
              ButtonAppWidget(title: 'Simpan', onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
  
  Widget textFieldWidget(String title){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          SizedBox(height: 5),
          SizedBox(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Ketik ${title}',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

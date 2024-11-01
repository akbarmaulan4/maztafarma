import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maztafarma/core/constant/box_style_constant.dart';
import 'package:maztafarma/core/constant/image_constant.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/task/task_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/page/task/add_task_page.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/header_user_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/home/schedule_section_home_widget.dart';

class PreviewAddTaskPage extends StatefulWidget {
  const PreviewAddTaskPage({super.key});

  @override
  State<PreviewAddTaskPage> createState() => _PreviewAddTaskPageState();
}

class _PreviewAddTaskPageState extends State<PreviewAddTaskPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  GoogleMapController? mapController;
  TaskController taskController = Get.find();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.1513144, 106.6928631), // <== location mazta farma default
    zoom: 14.4746,
  );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskController.getTodayTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 30),
            HeaderUserWidget(),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sebelum memulai,', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                  Text('Pastikan kamu berada pada lokasi yang tepat', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxStyleConstant.boxShadowButon(
                  radius: 28, color: Colors.grey.shade100,
                  spreadRadius: 2, colorShadow: Colors.grey.shade400,
                  offset: Offset(0, 3), blurRadius: 5
              ),
              height: 180,
              child: GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) async {
                  var startLocation = LatLng(-6.252300, 106.847336);
                  mapController = controller;
                  _controller.complete(controller);
                  Position pos = await taskController.getcurrentLocation();
                  if(pos.longitude != null){
                    startLocation = LatLng(pos.latitude, pos.longitude);
                  }
                  _goToSpecifiedPosition(startLocation);
                },
              ),
            ),

            Obx(() => ScheduleSectionHomeWidget(
              data: taskController.dataTask.value,
              title: 'Kunjungan Terlaksana',
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: Image.asset(icLocationYellow, height: 35, width: 35,),
        onPressed: ()=>Get.to(()=>AddTaskPage()),
        // child: Icon(CupertinoIcons., size: 32, color: Colors.white,),
      ),
    );
  }

  Future<void> _goToSpecifiedPosition(LatLng latLng) async {
    mapController = await _controller.future;
    mapController!.animateCamera(CameraUpdate.newLatLng(latLng));
  }
}

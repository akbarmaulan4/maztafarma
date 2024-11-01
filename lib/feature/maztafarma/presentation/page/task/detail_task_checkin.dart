import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maztafarma/core/utils/utils.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_doctor.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_product.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_schedule_type.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/master/master_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/task/task_controller.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_bar_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_checklist_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_input_date_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_input_widget.dart';
import 'package:maztafarma/feature/maztafarma/presentation/widget/app_selected_input_widget.dart';
import 'dart:math' as math;

import 'package:maztafarma/feature/maztafarma/presentation/widget/button_app_widget.dart';

class DetailTaskCheckin extends StatefulWidget {
  ETask? data;
  DetailTaskCheckin({this.data});

  @override
  State<DetailTaskCheckin> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<DetailTaskCheckin> {
  MasterController masterController = Get.find();
  TaskController taskController = Get.find();
  // final picker = ImagePicker();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    masterController.getShceduleType();
    masterController.getDoctorClinic();
    masterController.getProducts();
    masterController.changeTujuan(Utils().toCamelCase(widget.data!.tujuan!));
    masterController.changeWaktuKunjungan(Utils().toCamelCase(widget.data!.shift!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(title: 'Detail Task', onBackPressed: ()=>Get.back()),
            Expanded(child: ListView(
              children: [
                SizedBox(height: 35),
                Obx(() => AppSelectedInputWidget(
                  title: 'Tipe Kunjungan',
                  hint: 'Pilih Tipe Kunjungan',
                  type: TYPE_FIELD.VISIT_TYPE,
                  data: masterController.dataScheduleType.value,
                  valueDefault: masterController.fillScheduleType(widget.data!.tipe_schedule!),
                  onSelecteditem: (val){
                    EScheduleType model = val as EScheduleType;
                    taskController.addScheduleParam.value.type_schedule = model.id.toString();
                  },
                )),
                SizedBox(height: 25),
                AppSelectedInputWidget(
                    title: 'Jenis Kunjungan',
                    hint: 'Pilih Jenis Kunjungan',
                    data: masterController.jenisKunjungan.value,
                    valueDefault: widget.data!.jenis! == 'monthly' ? 'Bulanan':'Dadakan',
                    onSelecteditem: (val){
                      taskController.addScheduleParam.value.jenis = val.toString() == 'Bulanan' ? 'monthly':'suddenly';
                    }
                ),
                SizedBox(height: 25),
                Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppChecklistWidget(
                      title: 'Tujuan',
                      data: masterController.dataTujuan.value,
                      selected: masterController.selectedTujuan.value,
                      onSelect: (val)=>masterController.changeTujuan(val),
                    ),
                    SizedBox(height: masterController.selectedTujuan.value != '' ? 25:0),
                    if(masterController.selectedTujuan.value == 'Dokter')
                      AppSelectedInputWidget(
                        title: 'Dokter',
                        hint: 'Pilih Dokter',
                        data:masterController.dokterKlinik.value.doctors,
                        type: TYPE_FIELD.DOCTOR,
                        valueDefault: masterController.fillDocter(widget.data!.nama_tujuan!),
                        onSelecteditem: (val){
                          EDoctor model = val as EDoctor;
                          taskController.addScheduleParam.value.tujuan = 'dokter';
                          taskController.addScheduleParam.value.dokter = model.id_dokter.toString();
                        },
                      )
                    else if(masterController.selectedTujuan.value == 'Klinik')
                      AppSelectedInputWidget(title: 'Klinik', hint: 'Pilih Klinik', onSelecteditem: (val){
                        taskController.addScheduleParam.value.tujuan = 'klinik';
                      })
                    else if(masterController.selectedTujuan.value == 'Rumah Sakit')
                        AppSelectedInputWidget(title: 'Rumah Sakit', hint: 'Pilih Rumah Sakit', onSelecteditem: (val){
                          taskController.addScheduleParam.value.tujuan = 'rs';
                        })
                  ],
                )),
                SizedBox(height: 25),
                Container(
                  child: AppInputDateTimeWidget(
                    title: 'Tanggal Visit',
                    valueDefault: widget.data!.tgl_visit,
                    onChangeDate: (val){
                      taskController.addScheduleParam.value.tgl_visit = val;
                    },
                  ),
                ),
                SizedBox(height: 25),
                Obx(() => AppChecklistWidget(
                  title: 'Waktu Kunjungan',
                  data: masterController.waktuKunjungan.value,
                  selected: masterController.selectedWaktuKunjungan.value,
                  onSelect: (val){
                    masterController.changeWaktuKunjungan(val);
                    taskController.addScheduleParam.value.shift = val.toString().toLowerCase();
                  },
                )),
                SizedBox(height: 25),
                Obx(() => AppSelectedInputWidget(
                  title: 'Produk',
                  hint: 'Pilih Produk',
                  data: masterController.dataProducts.value,
                  type: TYPE_FIELD.PRODUCT,
                  valueDefault: masterController.fillProduct(widget.data!.nama_product!),
                  onSelecteditem: (val){
                    EProduct model = val as EProduct;
                    taskController.addScheduleParam.value.product = model.id_product.toString();
                    taskController.addScheduleParam.value.product_for_id_spesialis = model.id_spesialis.toString();
                    taskController.addScheduleParam.value.product_for_id_divisi = model.id_divisi_sales.toString();
                  },
                )),
                SizedBox(height: 25),
                AppInputWidget(
                  title: 'Notes',
                  defaultValue: widget.data!.note!,
                  onChange: (val){
                    taskController.addScheduleParam.value.note = val.toString();
                  }
                ),
                SizedBox(height: 45),
                // ButtonAppWidget(title: 'Check-In', onPressed: ()=>imgFromCamera())
                ButtonAppWidget(title: 'Check-In', onPressed: ()=>taskController.imgFromCamera(widget.data!))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

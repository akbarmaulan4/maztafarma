
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:maztafarma/core/connection/connectivity.dart';
import 'package:maztafarma/core/constant/dialog_constant.dart';
import 'package:maztafarma/core/params/params.dart';
import 'package:maztafarma/core/utils/utils.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/home/e_home_task_view.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/week_date_entity.dart';
import 'package:maztafarma/feature/maztafarma/domain/usecase/get_task.dart';

class TaskController extends GetxController with ConnectivityMixin{

  GetTask task;
  TaskController(this.task);

  RxList<WeekDateEntity> dateOfTheWeek = <WeekDateEntity>[].obs;
  RxList<ETask> dataTask = <ETask>[].obs;
  RxString currentMonth = ''.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxInt selectedDate = 0.obs;

  //param add schedule;
  Rx<AddScheduleParams> addScheduleParam = AddScheduleParams().obs;
  Rx<EHomeTaskView> menuDashboard = EHomeTaskView().obs;
  final picker = ImagePicker();


  changeSelectedDate(int date) => selectedDate.value = date;

  getDayInWeek(){
    var today = DateTime.now();
    List<WeekDateEntity> dateList = [];

    var todayDate = today.day;
    currentMonth.value == DateFormat("MMMM").format(today);

    changeSelectedDate(todayDate);

    //sunday
    DateTime sunday = today.subtract(new Duration(days: today.weekday));
    WeekDateEntity entity = WeekDateEntity(date: sunday.day, name: DateFormat.EEEE().format(sunday).substring(0,3), currentDate: sunday.day == todayDate);
    dateList.add(entity);

    //monday
    DateTime monday = today.subtract(new Duration(days: today.weekday - 1));
    entity = WeekDateEntity(date: monday.day, name: DateFormat.EEEE().format(monday).substring(0,3), currentDate: monday.day == todayDate);
    dateList.add(entity);

    //tuesday
    DateTime tuesday = today.subtract(new Duration(days: today.weekday - 2));
    entity = WeekDateEntity(date: tuesday.day, name: DateFormat.EEEE().format(tuesday).substring(0,3), currentDate: tuesday.day == todayDate);
    dateList.add(entity);

    //wednesday
    DateTime wednesday = today.subtract(new Duration(days: today.weekday - 3));
    entity = WeekDateEntity(date: wednesday.day, name: DateFormat.EEEE().format(wednesday).substring(0,3), currentDate: wednesday.day == todayDate);
    dateList.add(entity);

    //thursday
    DateTime thursday = today.subtract(new Duration(days: today.weekday - 4));
    entity = WeekDateEntity(date: thursday.day, name: DateFormat.EEEE().format(thursday).substring(0,3), currentDate: thursday.day == todayDate);
    dateList.add(entity);

    //friday
    DateTime friday = today.subtract(new Duration(days: today.weekday - 5));
    entity = WeekDateEntity(date: friday.day, name: DateFormat.EEEE().format(friday).substring(0,3), currentDate: friday.day == todayDate);
    dateList.add(entity);

    //saturday
    DateTime saturday = today.subtract(new Duration(days: today.weekday - 6));
    entity = WeekDateEntity(date: saturday.day, name: DateFormat.EEEE().format(saturday).substring(0,3), currentDate: saturday.day == todayDate);
    dateList.add(entity);

    dateOfTheWeek.clear();
    dateOfTheWeek.value.addAll(dateList);
    dateOfTheWeek.refresh();
  }

  Future<Position> getcurrentLocation() async{
    Position position = await Utils().determineCurrentLocation();
    if(position.latitude != null){
      latitude.value = position.latitude;
      longitude.value = position.longitude;
    }
    return position;
  }

  getTodayTask() async{
    // if(await isHasLogin()){
    //   final result = await task.getTodayTask();
    var date = DateTime.now();
    var today = DateFormat("MM/dd/yyyy").format(date);
    final result = await task.getTaskByDate(today, today);
      if(result.isRight){
        var right = result.right;
        dataTask.value = right;
        dataTask.refresh();
      }else{
        DialogConstant.alertMessage('Informasi', result.left.toString(), () { });
      }
    // }
  }
  
  getTaskByDate(int dateParam) async {
    var date = DateTime.now();
    var today = DateFormat("MM/dd/yyyy").format(date.copyWith(day: dateParam));
    final result = await task.getTaskByDate(today, today);
    if(result.isRight){
      var right = result.right;
      dataTask.value = right;
      dataTask.refresh();
    }else{
      DialogConstant.alertMessage('Informasi', result.left.toString(), () { });
    }
  }

  getViewTotalTask() async {
    final result = await task.getViewTotalTask();
    if(result.isRight){
      var right = result.right;
      menuDashboard.value = right;
    }else{
      DialogConstant.alertMessage('Informasi', result.left.toString(), () { });
    }
  }

  addSchedule() async {
    addScheduleParam.value.id_user = Utils().gertUserID();
    if(addScheduleParam.value.type_schedule == null){
      DialogConstant.alertMessage('Informasi', 'Pilih Tipe Kunjungan terlebih dahulu!', () { });
      return;
    }
    if(addScheduleParam.value.jenis == null){
      DialogConstant.alertMessage('Informasi', 'Pilih Jenis Kunjungan terlebih dahulu!', () { });
      return;
    }
    if(addScheduleParam.value.tujuan == null){
      DialogConstant.alertMessage('Informasi', 'Pilih Tujuan Kunjungan terlebih dahulu!', () { });
      return;
    }
    if(addScheduleParam.value.tujuan == 'dokter'){
      if(addScheduleParam.value.dokter == null){
        DialogConstant.alertMessage('Informasi', 'Pilih Dokter terlebih dahulu!', () { });
        return;
      }
    }
    if(addScheduleParam.value.tujuan == 'klinik'){
      if(addScheduleParam.value.klinik == null){
        DialogConstant.alertMessage('Informasi', 'Pilih Klinik terlebih dahulu!', () { });
        return;
      }
    }
    if(addScheduleParam.value.tujuan == 'rs'){
      if(addScheduleParam.value.dokter == null){
        DialogConstant.alertMessage('Informasi', 'Pilih Rumah Sakit terlebih dahulu!', () { });
        return;
      }
    }
    if(addScheduleParam.value.shift == null){
      DialogConstant.alertMessage('Informasi', 'Pilih Waktu Kunjungan Kunjungan terlebih dahulu!', () { });
      return;
    }
    if(addScheduleParam.value.product == null){
      DialogConstant.alertMessage('Informasi', 'Pilih Produk terlebih dahulu!', () { });
      return;
    }
    DialogConstant.loading();
    final result = await task.postScheduleTask(addScheduleParam.value);
    Get.back();
    if(result.isRight){
      DialogConstant.alertMessage('Informasi', result.right.toString(), ()=>Get.back());
    }else{
      DialogConstant.alertMessage('Informasi', result.left.toString(), () { });
    }
  }

  imgFromCamera(ETask data) async {
    Map<String, dynamic> post = Map();
    post['id_schedule']=data.id.toString();
    post['lokasi']=data.nama_tujuan;
    post['note']=data.note;
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxWidth: 1024,
        maxHeight: 768);
    if (pickedFile != null) {
      var image = File(pickedFile.path);
      postCheckin(data, image.path);
    }else{
      DialogConstant.alertMessage('Informasi', 'Gagal mengambil foto', () { });
    }
  }

  postCheckin(ETask eTask, String pathImage) async {
    DialogConstant.loading();
    final result = await task.postCheckin(eTask, pathImage);
    Get.back();
    if(result.isRight){
      DialogConstant.alertMessage('Informasi', result.right.toString(), ()=>Get.back());
    }else{
      DialogConstant.alertMessage('Informasi', result.left.toString(), () { });
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDayInWeek();
    // getTodayTask();
  }
}
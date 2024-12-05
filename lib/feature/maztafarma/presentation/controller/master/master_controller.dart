
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:maztafarma/core/constant/dialog_constant.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_doctor_klinik.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_product.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_schedule_type.dart';
import 'package:maztafarma/feature/maztafarma/domain/usecase/get_master.dart';


enum TYPE_FIELD { VISIT_TYPE,VISIT_OBJ, DOCTOR, CLINIK, HOSPITAL, PRODUCT, VISIT_KIND }

class MasterController extends GetxController{

  RxList<EScheduleType> dataScheduleType = <EScheduleType>[].obs;
  RxList<String> dataTujuan = <String>['Dokter', 'Klinik', 'Rumah Sakit'].obs;
  RxList<String> waktuKunjungan = <String>['Pagi', 'Siang'].obs;
  RxList<String> jenisKunjungan = <String>['Bulanan', 'Dadakan'].obs;
  RxList<EProduct> dataProducts = <EProduct>[].obs;

  Rx<EDoctorClinik> dokterKlinik = EDoctorClinik().obs;

  RxString selectedTujuan = ''.obs;
  RxString selectedWaktuKunjungan = ''.obs;
  // RxString selectedJenisKunjungan = ''.obs;

  GetMaster master;
  MasterController(this.master);

  getShceduleType()async {
    final result = await master.getScheduleType();
    if(result.isLeft){
      var exception = result.left;
      var message = exception.toString();
      DialogConstant.alertMessage('Peringatan', message, () { });
      return;
    }
    if(result.isRight){
      var right = result.right;
      dataScheduleType.value = right;
      dataScheduleType.refresh();
    }
  }

  getProducts() async{
    final result = await master.getProducts();
    if(result.isLeft){
      var exception = result.left;
      var message = exception.toString();
      DialogConstant.alertMessage('Peringatan', message, () { });
      return;
    }
    if(result.isRight){
      var right = result.right;
      dataProducts.value = right;
      dataProducts.refresh();
    }
  }
  getDoctorClinic() async {
    final result = await master.getDoctorClinic();
    if(result.isLeft){
      var exception = result.left;
      var message = exception.toString();
      DialogConstant.alertMessage('Peringatan', message, () { });
      return;
    }
    if(result.isRight){
      var right = result.right;
      dokterKlinik.value = right;
    }
  }

  changeTujuan(val)=> selectedTujuan.value = val;
  changeWaktuKunjungan(val)=> selectedWaktuKunjungan.value = val;

  fillScheduleType(String value){
    var data = dataScheduleType.value.where((element) => element.name == value).first;
    if(data != null){
      return data.name;
    }
    return '';
  }

  fillDocter(String value){
    if(dokterKlinik.value.doctors == null) return '';
    var data = dokterKlinik.value.doctors!.where((element) => element.nama_dokter == value).first;
    if(data != null){
      return data.nama_dokter;
    }
    return '';
  }

  fillProduct(String value){
    if(dataProducts.value == null) return '';
    var data = dataProducts.value!.where((element) => element.nama_product == value).first;
    if(data != null){
      return data.nama_product;
    }
    return '';
  }
}
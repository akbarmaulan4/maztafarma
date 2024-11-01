
import 'package:maztafarma/core/http/api.dart';
import 'package:maztafarma/core/http/path_api.dart';
import 'package:maztafarma/feature/maztafarma/data/model/master/m_doctor_clinic.dart';
import 'package:maztafarma/feature/maztafarma/data/model/master/m_product.dart';
import 'package:maztafarma/feature/maztafarma/data/model/master/m_schedule_type.dart';

extension APIMaster on API{

  Future<ApiResponse<List<MProduct>>> product({
    required int userID,
    required ApiResponse<List<MProduct>> Function(Map<String, dynamic> data) handleBody
  }){
    return baseGet('$PRODUCT/$userID', handleBody);
  }

  Future<ApiResponse<List<MScheduleType>>> scheduleType({
    required ApiResponse<List<MScheduleType>> Function(Map<String, dynamic> data) handleBody,
  }){
    return baseGet('$SCHEDULE_TYPE', handleBody);
  }

  Future<ApiResponse<MDoctorClinic>> doctorClinic({
    required int userID,
    required ApiResponse<MDoctorClinic> Function(Map<String, dynamic> data) handleBody
  }){
    return baseGet('$DOKTER_KLINIK/$userID', handleBody);
  }

}
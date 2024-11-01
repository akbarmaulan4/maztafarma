
import 'package:maztafarma/core/http/api.dart';
import 'package:maztafarma/core/http/master/api+master.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';
import 'package:maztafarma/feature/maztafarma/data/model/master/m_doctor.dart';
import 'package:maztafarma/feature/maztafarma/data/model/master/m_doctor_clinic.dart';
import 'package:maztafarma/feature/maztafarma/data/model/master/m_product.dart';
import 'package:maztafarma/feature/maztafarma/data/model/master/m_schedule_type.dart';

class MasterDataSources{

  Future<ApiResponse<List<MScheduleType>>> getScheduleType(){
    return API.instance.scheduleType(
        handleBody: (Map<String, dynamic>? json){
          if(json != null){
            List<MScheduleType> data = List.from(json['data'] ?? []).map((e) => MScheduleType.fromJson(e)).toList();
            return ApiResponse<List<MScheduleType>>(result: data);
          }
          return ApiResponse<List<MScheduleType>>();
        },
    );
  }
  Future<ApiResponse<List<MProduct>>> getProducts(){
    var data = LocalSources().getUser();
    return API.instance.product(
      userID: data.id_user != null ? data.id_user!:0,
      handleBody: (Map<String, dynamic>? json){
        if(json != null){
          List<MProduct> data = List.from(json['data'] ?? []).map((e) => MProduct.fromJson(e)).toList();
          return ApiResponse<List<MProduct>>(result: data);
        }
        return ApiResponse<List<MProduct>>();
      },
    );
  }
  Future<ApiResponse<MDoctorClinic>> getDoctorClinic(){
    var data = LocalSources().getUser();
    return API.instance.doctorClinic(
      userID: data.id_user != null ? data.id_user!:0,
      handleBody: (Map<String, dynamic>? json){
        if(json != null){
          MDoctorClinic model = MDoctorClinic.fromJson(json);
          return ApiResponse<MDoctorClinic>(result: model);
        }
        return ApiResponse<MDoctorClinic>();
      },
    );
  }

}

import 'package:maztafarma/core/http/api.dart';
import 'package:maztafarma/core/http/task/api+schedule.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';
import 'package:maztafarma/feature/maztafarma/data/model/task/m_task.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';

class TaskDataSources{

  Future<ApiResponse<List<MTask>>> getTodayTask(){
    var data = LocalSources().getUser();
    return API.instance.getScheduleByDay(
        userID: data.id_user != null ? data.id_user!:0,
        handleBody: (Map<String, dynamic>? json){
          if(json != null){
            List<MTask> data = List.from(json['data']['data'] ?? []).map((e) => MTask.fromJson(e)).toList();
            return ApiResponse<List<MTask>>(result: data);
          }
          return ApiResponse<List<MTask>>();
        }
    );
  }

  Future<ApiResponse<dynamic>> postScheduleTask({required Map<String, dynamic> post}){
    return API.instance.postScheduleTask(
        post: post,
        handleBody: (Map<String, dynamic>? json){
          if(json != null){
            if(json['status'] == true){
              return ApiResponse<String>(result: json['message']);
            }
          }
          return ApiResponse<String>();
        }
    );
  }


  postChekin({required Map<String, dynamic> post, required String pathhImage}){
    return API.instance.postCheckin(
        post: post,
        pathImage: pathhImage,
        handleBody: (Map<String, dynamic>? json){
          if(json != null){
            if(json['status'] == true){
              return ApiResponse<String>(result: json['message']);
            }
          }
          return ApiResponse<String>();
        }
    );
  }

  uploadImageCheckin(){}

  postCheckout(){}
}
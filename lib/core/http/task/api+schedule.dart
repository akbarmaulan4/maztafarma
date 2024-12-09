
import 'package:maztafarma/core/http/api.dart';
import 'package:maztafarma/core/http/path_api.dart';
import 'package:maztafarma/feature/maztafarma/data/model/home/m_home_view_task.dart';
import 'package:maztafarma/feature/maztafarma/data/model/task/m_task.dart';

extension APISchedule on API{

  Future<ApiResponse> postScheduleTask({
    required Map<String, dynamic> post,
    required ApiResponse<dynamic> Function(Map<String, dynamic> data) handleBody,
    bool isApplicationJson = true
  }){
    return basePost('$SCHEDULE_ADD', post, isApplicationJson, handleBody);
  }

  Future<ApiResponse> postCheckin({
    required Map<String, dynamic> post,
    required String pathImage,
    required ApiResponse<dynamic> Function(Map<String, dynamic> data) handleBody,
    bool isApplicationJson = true
  }){
    return basePostUpload('$CHECKIN', pathImage, post, handleBody);
  }

  Future<ApiResponse<List<MTask>>> getScheduleByDay({
    required int userID,
    required ApiResponse<List<MTask>> Function(Map<String, dynamic> data) handleBody,
  }){
    return baseGet('$SCHEDULE_BY_DAY/$userID', handleBody);
  }

  Future<ApiResponse<MHomeTaskView>> getViewTotalTask({
    required int userID,
    required ApiResponse<MHomeTaskView> Function(Map<String, dynamic> data) handleBody,
  }){
    return baseGet('$VIEW_TASK/$userID', handleBody);
  }

  Future<ApiResponse<List<MTask>>> getScheduleByDate({
    required Map<String, dynamic> post,
    required ApiResponse<List<MTask>> Function(Map<String, dynamic> data) handleBody,
    bool isApplicationJson = true
  }){
    return basePost('$SCHEDULE_BY_DATE', post, isApplicationJson, handleBody);
  }

  Future<ApiResponse> scheduleDetail(Map<String, dynamic> post, ApiResponse Function(Map<String, dynamic> data) handleBody, {bool? isApplicationJson}){
    return basePost('$INTERNAL_GATEWAY/$SCHEDULE_DETAIL', post, isApplicationJson!, handleBody);
  }

  Future<ApiResponse> scheduleMontly(Map<String, dynamic> post, ApiResponse Function(Map<String, dynamic> data) handleBody, {bool? isApplicationJson}){
    return basePost('$INTERNAL_GATEWAY/$SCHEDULE_BY_DAY', post, isApplicationJson!, handleBody);
  }

  Future<ApiResponse> scheduleAdd(Map<String, dynamic> post, ApiResponse Function(Map<String, dynamic> data) handleBody, {bool? isApplicationJson}){
    return basePost('$INTERNAL_GATEWAY/$SCHEDULE_BY_DAY', post, isApplicationJson!, handleBody);
  }

  Future<ApiResponse> scheduleUpload(Map<String, dynamic> post, ApiResponse Function(Map<String, dynamic> data) handleBody, {bool? isApplicationJson}){
    return basePost('$INTERNAL_GATEWAY/$SCHEDULE_BY_DAY', post, isApplicationJson!, handleBody);
  }

  Future<ApiResponse> checkinLanjutan(Map<String, dynamic> post, ApiResponse Function(Map<String, dynamic> data) handleBody, {bool? isApplicationJson}){
    return basePost('$INTERNAL_GATEWAY/$SCHEDULE_BY_DAY', post, isApplicationJson!, handleBody);
  }

  Future<ApiResponse> checkout(Map<String, dynamic> post, ApiResponse Function(Map<String, dynamic> data) handleBody, {bool? isApplicationJson}){
    return basePost('$INTERNAL_GATEWAY/$SCHEDULE_BY_DAY', post, isApplicationJson!, handleBody);
  }

  Future<ApiResponse> checkoutLanjutan(Map<String, dynamic> post, ApiResponse Function(Map<String, dynamic> data) handleBody, {bool? isApplicationJson}){
    return basePost('$INTERNAL_GATEWAY/$SCHEDULE_BY_DAY', post, isApplicationJson!, handleBody);
  }
}
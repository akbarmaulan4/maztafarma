
import 'dart:convert';

import 'package:either_dart/src/either.dart';
import 'package:maztafarma/core/connection/connectivity.dart';
import 'package:maztafarma/core/errors/no_connection_exception.dart';
import 'package:maztafarma/core/params/params.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/task/task_datasources.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/home/e_home_task_view.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';
import 'package:maztafarma/feature/maztafarma/domain/repository/task/task_repository_interface.dart';

class TaskRepository with ConnectivityMixin implements TaskRepositoryInterface{
  final TaskDataSources taskDataSources;
  TaskRepository(this.taskDataSources);

  @override
  Future<Either<Exception, String>> postScheduleTask({required AddScheduleParams params}) async {
    // TODO: implement postScheduleTask
    Map<String, String> post = Map();
    post['id-user']=params.id_user!;
    post['type-schedule']=params.type_schedule!;
    post['jenis']=params.jenis!;
    post['tujuan']=params.tujuan!;
    post['tgl-visit']=params.tgl_visit!;
    post['dokter']=params.dokter!;
    post['klinik']=params.klinik ?? '';
    post['product']=jsonEncode([params.product!]);
    post['product_for_id_divisi']=params.product_for_id_divisi!;
    post['product_for_id_spesialis']=params.product_for_id_spesialis!;
    post['note']=params.note!;
    post['shift']=params.shift!;
    if (await isInConnection()) {
      final response = await taskDataSources.postScheduleTask(post: post);
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    }else{
      return Left(NoConnectionException());
    }
  }

  @override
  Future<Either<Exception, String>> postCheckin({required ETask data, required String pathImage}) async {
    // TODO: implement postCheckin
    Map<String, dynamic> post = Map();
    post['id_schedule']=data.id.toString();
    post['lokasi']=data.nama_tujuan;
    post['note']=data.note;

    if (await isInConnection()) {
      final response = await taskDataSources.postChekin(post: post, pathhImage: pathImage);
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    }else{
      return Left(NoConnectionException());
    }
  }

  @override
  Future<Either<Exception, List<ETask>>> getTodayTask() async {
    // TODO: implement getTodayTask
    if (await isInConnection()) {
      final response = await taskDataSources.getTodayTask();
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    } else {
      return Left(NoConnectionException());
    }
  }

  @override
  Future<Either<Exception, EHomeTaskView>> getViewTotalTask() async {
    // TODO: implement getViewTotalTask
    if (await isInConnection()) {
      final response = await taskDataSources.getViewTotalTask();
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    } else {
      return Left(NoConnectionException());
    }
  }

  @override
  Future<Either<Exception, List<ETask>>> getTaskByDate({required String startDate, required String endDate}) async {
    // TODO: implement getTaskByDate
    var data = LocalSources().getUser();

    Map<String, dynamic> post = Map();
    post['id_user']=data.id_user != null ? data.id_user!:0;
    post['range_date']='$startDate - $endDate';

    if (await isInConnection()) {
      final response = await taskDataSources.getTaskByDate(post: post);
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    } else {
    return Left(NoConnectionException());
    }
  }

  @override
  Future<String> detailTask({required String userName, required String password}) {
    // TODO: implement detailTask
    throw UnimplementedError();
  }

  @override
  Future<List<String>> listTask({required String userId}) {
    // TODO: implement listTask
    throw UnimplementedError();
  }

  @override
  Future<List<String>> postCheckout({required String userId}) {
    // TODO: implement postCheckout
    throw UnimplementedError();
  }

  @override
  Future<List<String>> uploadImageCheckin({required String userId}) {
    // TODO: implement uploadImageCheckin
    throw UnimplementedError();
  }
}

import 'package:either_dart/either.dart';
import 'package:maztafarma/core/params/params.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/home/e_home_task_view.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';

abstract class TaskRepositoryInterface{

  Future<Either<Exception, String>> postScheduleTask({required AddScheduleParams params});
  Future<Either<Exception, String>> postCheckin({required ETask data, required String pathImage});
  Future<Either<Exception, List<ETask>>> getTodayTask();
  Future<Either<Exception, List<ETask>>> getTaskByDate({required String startDate, required String endDate});
  Future<Either<Exception, EHomeTaskView>> getViewTotalTask();
  Future<String> detailTask({required String userName, required String password});
  Future<List<String>> listTask({required String userId});
  Future<List<String>> uploadImageCheckin({required String userId});
  Future<List<String>> postCheckout({required String userId});
}
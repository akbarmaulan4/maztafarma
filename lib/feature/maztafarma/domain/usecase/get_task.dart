
import 'package:either_dart/either.dart';
import 'package:maztafarma/core/params/params.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/home/e_home_task_view.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';
import 'package:maztafarma/feature/maztafarma/domain/repository/task/task_repository_interface.dart';

class GetTask{
  final TaskRepositoryInterface repository;
  GetTask(this.repository);

  Future<Either<Exception, String>> postScheduleTask(AddScheduleParams params) async {
    return repository.postScheduleTask(params: params);
  }

  Future<Either<Exception, String>> postCheckin(ETask data, String pathImage) async {
    return repository.postCheckin(data: data, pathImage: pathImage);
  }

  Future<Either<Exception, List<ETask>>> getTodayTask() async {
    return repository.getTodayTask();
  }

  Future<Either<Exception, EHomeTaskView>> getViewTotalTask() async {
    return repository.getViewTotalTask();
  }

  Future<Either<Exception, List<ETask>>> getTaskByDate(String startDate, String endDate) async {
    return repository.getTaskByDate(
      startDate: startDate,
      endDate: endDate
    );
  }
}
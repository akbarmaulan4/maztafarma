import 'package:maztafarma/feature/maztafarma/domain/entity/home/e_home_task_view.dart';
part 'm_home_view_task.g.dart';

class MHomeTaskView extends EHomeTaskView{

  MHomeTaskView({
    required int today,
    required int today_done,
    required int montly,
    required int montly_done,
    required int reject,
  }):super(
    schedule_today: today,
    schedule_today_done: today_done,
    schedule_monthly: montly,
    schedule_monthly_done: montly_done,
    schedule_reject: reject
  );

  factory MHomeTaskView.fromJson(Map<String, dynamic> json) => _$fromJson(json);
}
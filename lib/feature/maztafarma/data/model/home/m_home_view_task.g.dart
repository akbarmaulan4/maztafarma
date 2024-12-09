
part of 'm_home_view_task.dart';

MHomeTaskView _$fromJson(Map<String, dynamic> json) => MHomeTaskView(
  today: json['schedule_today'] ?? 0,
  today_done: json['schedule_today_done'] ?? 0,
  montly: json['schedule_monthly'] ?? 0,
  montly_done: json['schedule_monthly_done'] ?? 0,
  reject: json['schedule_reject'] ?? 0,
);
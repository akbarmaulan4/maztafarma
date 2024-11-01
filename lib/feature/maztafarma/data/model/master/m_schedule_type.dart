import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_schedule_type.dart';

part 'm_schedule_type.g.dart';

class MScheduleType extends EScheduleType{

  MScheduleType({
    int? id,
    String? name,
    String? created_at,
  }):super(id: id, name: name, created_at: created_at);

  factory MScheduleType.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}
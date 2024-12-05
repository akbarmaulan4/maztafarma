import 'package:maztafarma/feature/maztafarma/domain/entity/basic/e_list.dart';
part 'm_list.g.dart';

class MList extends EList{
  MList({
    int? id, String? title,
    String? label, int? year,
    String? color, String? cover,
    int? artistId, int? listens
  }):super(
    id: id, title: title,
    label: label, year: year,
    color: color, cover: cover,
    artistId: artistId, listens: listens
  );

  factory MList.fromJson(Map<String, dynamic> json) => _$fromJson(json);
}
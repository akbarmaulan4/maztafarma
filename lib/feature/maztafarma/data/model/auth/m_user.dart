part 'm_user.g.dart';

class MUser{

  final int? id_user;
  final String? name;
  final String? email;
  final String? role;
  final String? id_divisi;

  MUser({
    this.id_user,
    this.name,
    this.email,
    this.role,
    this.id_divisi,
  });

  factory MUser.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


MUser _$fromJson(Map<String, dynamic> json) => MUser(
  id_user: json['id_user'],
  name: json['name'],
  email: json['email'],
  role: json['role'],
  id_divisi: json['id_divisi']
);

Map<String, dynamic> _$toJson(MUser instance) => <String, dynamic>{
  'id_user': instance.id_user,
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
  'id_divisi': instance.id_divisi,
};

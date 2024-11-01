part of 'm_product.dart';

MProduct _$fromJson(Map<String, dynamic> json) => MProduct(
  id_product: json['id_product'],
  nama_product: json['nama_product'],
  desc: json['desc'],
  id_divisi_sales: json['id_divisi_sales'],
  id_spesialis: json['id_spesialis'],
  image: json['image'],
  exp_date: json['exp_date'],
);

Map<String, dynamic> _$toJson(MProduct instance) => <String, dynamic>{
  'id_product': instance.id_product,
  'nama_product': instance.nama_product,
  'desc': instance.desc,
  'id_divisi_sales': instance.id_divisi_sales,
  'id_spesialis': instance.id_spesialis,
  'image': instance.image,
  'exp_date': instance.exp_date,
};
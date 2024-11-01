part of 'm_doctor.dart';

MDoctor _$fromJson(Map<String, dynamic> json) => MDoctor(
  id_dokter: json['id_dokter'],
  nama_dokter: json['nama_dokter'],
  alamat_dokter: json['alamat_dokter'],
  kode_pelanggan: json['kode_pelanggan'],
  spesialis: json['spesialis'],
  jalan: json['jalan'],
  kecamatan: json['kecamatan'],
  kelurahan: json['kelurahan'],
  kota: json['kota'],
  provinsi: json['provinsi'],
);

Map<String, dynamic> _$toJson(MDoctor instance) => <String, dynamic>{
  'id_dokter': instance.id_dokter,
  'nama_dokter': instance.nama_dokter,
  'alamat_dokter': instance.alamat_dokter,
  'kode_pelanggan': instance.kode_pelanggan,
  'spesialis': instance.spesialis,
  'jalan': instance.jalan,
  'kecamatan': instance.kecamatan,
  'kelurahan': instance.kelurahan,
  'kota': instance.kota,
  'provinsi': instance.provinsi,
};
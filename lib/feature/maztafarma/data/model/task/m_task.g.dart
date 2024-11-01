part of 'm_task.dart';

MTask _$fromJson(Map<String, dynamic> json) => MTask(
  id: json['id'],
  nama_user: json['nama_user'],
  email_user: json['email_user'],
  tipe_schedule: json['tipe_schedule'],
  tujuan: json['tujuan'],
  tgl_visit: json['tgl_visit'],
  nama_product: json['nama_product'],
  note: json['note'],
  created_at: json['created_at'],
  jalan: json['jalan'],
  kota: json['kota'],
  tgl_submit_schedule: json['tgl_submit_schedule'],
  approved: json['approved'],
  shift: json['shift'],
  jenis: json['jenis'],
  nama_tujuan: json['nama_tujuan'],
  alamat_tujuan: json['alamat_tujuan'],
  status_checkin: json['status_checkin'],
  nama_divisi: json['nama_divisi'],
  nama_spesialis: json['nama_spesialis'],
);

Map<String, dynamic> _$toJson(MTask instance) => <String, dynamic>{
  'id': instance.id,
  'nama_user': instance.nama_user,
  'email_user': instance.email_user,
  'tipe_schedule': instance.tipe_schedule,
  'tujuan': instance.tujuan,
  'tgl_visit': instance.tgl_visit,
  'nama_product': instance.nama_product,
  'note': instance.note,
  'created_at': instance.created_at,
  'jalan': instance.jalan,
  'kota': instance.kota,
  'tgl_submit_schedule': instance.tgl_submit_schedule,
  'approved': instance.approved,
  'shift': instance.shift,
  'jenis': instance.jenis,
  'nama_tujuan': instance.nama_tujuan,
  'alamat_tujuan': instance.alamat_tujuan,
  'status_checkin': instance.status_checkin,
  'nama_divisi': instance.nama_divisi,
  'nama_spesialis': instance.nama_spesialis,
};
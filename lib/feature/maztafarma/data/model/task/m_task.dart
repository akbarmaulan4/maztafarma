

import 'package:maztafarma/feature/maztafarma/domain/entity/task/e_task.dart';
part 'm_task.g.dart';

class MTask extends ETask{
  MTask({
    int? id,
    String? nama_user,
    String? email_user,
    String? tipe_schedule,
    String? tujuan,
    String? tgl_visit,
    String? nama_product,
    String? note,
    String? created_at,
    String? jalan,
    String? kota,
    String? tgl_submit_schedule,
    int? approved,
    String? shift,
    String? jenis,
    String? nama_tujuan,
    String? alamat_tujuan,
    String? status_checkin,
    String? nama_divisi,
    String? nama_spesialis,
  }):super(
      id: id,
      nama_user: nama_user,
      email_user: email_user,
      tipe_schedule: tipe_schedule,
      tujuan: tujuan,
      tgl_visit: tgl_visit,
      nama_product: nama_product,
      note: note,
      created_at: created_at,
      jalan: jalan,
      kota: kota,
      tgl_submit_schedule: tgl_submit_schedule,
      approved: approved,
      shift: shift,
      jenis: jenis,
      nama_tujuan: nama_tujuan,
      alamat_tujuan: alamat_tujuan,
      status_checkin: status_checkin,
      nama_divisi: nama_divisi,
      nama_spesialis: nama_spesialis,
  );

  factory MTask.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}
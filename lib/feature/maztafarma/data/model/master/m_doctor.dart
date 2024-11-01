
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_doctor.dart';
part 'm_doctor.g.dart';

class MDoctor extends EDoctor{
  MDoctor({
    int? id_dokter,
    String? nama_dokter,
    String? alamat_dokter,
    String? kode_pelanggan,
    int? spesialis,
    String? jalan,
    String? kecamatan,
    String? kelurahan,
    String? kota,
    String? provinsi,
  }):super(
      id_dokter: id_dokter,
      nama_dokter: nama_dokter,
      alamat_dokter: alamat_dokter,
      kode_pelanggan: kode_pelanggan,
      spesialis: spesialis,
      jalan: jalan,
      kecamatan: kecamatan,
      kelurahan: kelurahan,
      kota: kota,
      provinsi: provinsi);

  factory MDoctor.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}
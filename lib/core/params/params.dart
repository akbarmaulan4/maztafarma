class NoParams {}

class CheckInParam {}

class AddScheduleParams {
  String? type_schedule;
  String? tujuan;
  String? tgl_visit;
  String? product;
  String? note;
  String? id_user;
  String? dokter;
  String? klinik;
  String? product_for_id_divisi;
  String? product_for_id_spesialis;
  String? shift;
  String? jenis;
  AddScheduleParams({
    this.type_schedule,
    this.tujuan,
    this.tgl_visit,
    this.product,
    this.note,
    this.id_user,
    this.dokter,
    this.klinik,
    this.product_for_id_divisi,
    this.product_for_id_spesialis,
    this.shift,
    this.jenis,
  });
}
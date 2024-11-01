import 'package:maztafarma/feature/maztafarma/data/model/master/m_doctor.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_doctor.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_doctor_klinik.dart';

part 'm_doctor_clinic.g.dart';

class MDoctorClinic extends EDoctorClinik{
  MDoctorClinic({List<EDoctor>? doctors, List? clinic}):super(doctors: doctors, clinic: clinic);

  factory MDoctorClinic.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}
part of 'm_doctor_clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


MDoctorClinic _$fromJson(Map<String, dynamic> json) => MDoctorClinic(
  doctors: List.from(json['dokter'] ?? []).map((e) => MDoctor.fromJson(e)).toList(),
  clinic: List.from(json['klinik'] ?? []).map((e) => MDoctor.fromJson(e)).toList(),
);

Map<String, dynamic> _$toJson(MDoctorClinic instance) => <String, dynamic>{
  'doctors': instance.doctors,
  'clinic': instance.clinic,
};

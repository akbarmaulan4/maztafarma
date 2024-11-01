import 'package:either_dart/either.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_doctor_klinik.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_product.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_schedule_type.dart';

abstract class MasterRepositoryInterface{

  Future<Either<Exception, List<EScheduleType>>> getScheduleType();
  Future<Either<Exception, List<EProduct>>> getProducts();
  Future<Either<Exception, EDoctorClinik>> getDoctorClinic();
}
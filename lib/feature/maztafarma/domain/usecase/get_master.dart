
import 'package:either_dart/either.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_schedule_type.dart';
import 'package:maztafarma/feature/maztafarma/domain/repository/master/master_repository_interface.dart';

class GetMaster{
  final MasterRepositoryInterface repository;
  GetMaster(this.repository);

  Future<Either<Exception, List<EScheduleType>>> getScheduleType() async {
    return repository.getScheduleType();
  }

  Future<Either<Exception, dynamic>> getDoctorClinic() async {
    return repository.getDoctorClinic();
  }

  Future<Either<Exception, dynamic>> getProducts() async {
    return repository.getProducts();
  }
}
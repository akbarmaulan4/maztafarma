
import 'package:either_dart/either.dart';
import 'package:maztafarma/core/connection/connectivity.dart';
import 'package:maztafarma/core/errors/no_connection_exception.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/master/master_datasources.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_doctor_klinik.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_product.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_schedule_type.dart';
import 'package:maztafarma/feature/maztafarma/domain/repository/master/master_repository_interface.dart';

class MasterRepository with ConnectivityMixin implements MasterRepositoryInterface{

  final MasterDataSources masterDataSources;
  MasterRepository(this.masterDataSources);

  @override
  Future<Either<Exception, EDoctorClinik>> getDoctorClinic() async{
    // TODO: implement getDoctorClinic
    if (await isInConnection()) {
      final response = await masterDataSources.getDoctorClinic();
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    } else {
      return Left(NoConnectionException());
    }
  }

  @override
  Future<Either<Exception, List<EProduct>>> getProducts() async{
    // TODO: implement getProducts
    if (await isInConnection()) {
      final response = await masterDataSources.getProducts();
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    } else {
      return Left(NoConnectionException());
    }
  }

  @override
  Future<Either<Exception, List<EScheduleType>>> getScheduleType() async {
    // TODO: implement getScheduleType
    if (await isInConnection()) {
      final response = await masterDataSources.getScheduleType();
      if (response.error != null) {
        return Left(response.error!);
      } else if (response.result == null) {
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    } else {
      return Left(NoConnectionException());
    }
  }

}
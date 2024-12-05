
import 'package:either_dart/src/either.dart';
import 'package:maztafarma/core/connection/connectivity.dart';
import 'package:maztafarma/core/errors/no_connection_exception.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/basic/infinity_list_datasources.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/basic/e_list.dart';
import 'package:maztafarma/feature/maztafarma/domain/repository/basic/infinity_repository_interface.dart';

class InfinityListRepository with ConnectivityMixin implements InfinityListRepositoryInterface{

  final InfinityDataSources dataSources;
  InfinityListRepository(this.dataSources);

  @override
  Future<Either<Exception, List<EList>>> getDataList({required int page}) async {

    // TODO: implement getDataList
    if(await isInConnection()){
      final response = await dataSources.getDataList(page);
      if(response.error != null){
        return Left(response.error!);
      }else if(response.result == null){
        return Left(Exception('Unable to get token from API'));
      }
      return Right(response.result!);
    }else{
      return Left(NoConnectionException());
    }
  }

}
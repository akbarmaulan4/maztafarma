
import 'package:either_dart/either.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/basic/e_list.dart';

abstract class InfinityListRepositoryInterface{

  Future<Either<Exception, List<EList>>> getDataList({required int page});
}
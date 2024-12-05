
import 'package:either_dart/either.dart';
import 'package:maztafarma/feature/maztafarma/data/repository/basic/infinity_list_repository.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/basic/e_list.dart';

class GetInfinityList{
  final InfinityListRepository repository;
  GetInfinityList(this.repository);

  Future<Either<Exception, List<EList>>> getDataList(int page) async {
    return repository.getDataList(page: page);
  }
}
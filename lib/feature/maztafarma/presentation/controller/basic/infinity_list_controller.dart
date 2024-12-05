
import 'package:get/get.dart';
import 'package:maztafarma/core/constant/dialog_constant.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/basic/infinity_list_datasources.dart';
import 'package:maztafarma/feature/maztafarma/data/repository/basic/infinity_list_repository.dart';
import 'package:maztafarma/feature/maztafarma/domain/entity/basic/e_list.dart';
import 'package:maztafarma/feature/maztafarma/domain/usecase/get_infinity_list.dart';

class InfinityListController extends GetxController{

  RxBool isLoading = false.obs;
  RxInt page = 1.obs;
  RxList<EList> dataList = <EList>[].obs;

  GetInfinityList useCase = GetInfinityList(new InfinityListRepository(new InfinityDataSources()));

  getDataList() async {
    final result = await useCase.getDataList(page.value);
    if(result.isLeft){
      var exception = result.left;
      var message = exception.toString();
      DialogConstant.alertMessage('Peringatan', message, () { });
      return;
    }
    if(result.isRight){
      var right = result.right;
      dataList.value.addAll(right);
      dataList.refresh();
      page++;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getDataList();
  }

}
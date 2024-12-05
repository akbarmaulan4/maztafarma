
import 'package:maztafarma/core/http/api.dart';
import 'package:maztafarma/feature/maztafarma/data/model/basic/m_list.dart';

class InfinityDataSources{

  final String _baseUrl = "https://fake-api.sandbox.koodalabs.com";
  Future<ApiResponse<List<MList>>> getDataList(int page){

    return API.instance.baseGetURL(url: '${_baseUrl}/albums?_page=${page}&_limit=20', handleBody: (List? json){
      if(json != null){
        List<MList> data = List.from(json ?? []).map((e) => MList.fromJson(e)).toList();
        return ApiResponse<List<MList>>(result: data);
      }
      return ApiResponse<List<MList>>();
    });
  }
}
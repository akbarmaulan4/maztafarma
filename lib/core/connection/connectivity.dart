
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:maztafarma/feature/maztafarma/data/datasources/local_sources.dart';

mixin ConnectivityMixin{
  final connectivity = Connectivity();
  Future<bool> isInConnection() async {
    var connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<bool> isHasLogin() async {
    String token = LocalSources().getToken();
    return token != '' ? true:false;
  }

}
import 'package:base/infrastructure/api_service.dart';
import 'package:get_it/get_it.dart';

final services = GetIt.instance;

class Services {

  static Future init() async {

    services.registerSingletonAsync<APIService>(() async => await APIService().init());

    await services.allReady();
  }
}

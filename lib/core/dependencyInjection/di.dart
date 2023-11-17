import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
class AppContainer {
  static GetIt getIt = GetIt.instance;

  static Future<void> init() async {
    getIt.init();
  }
}

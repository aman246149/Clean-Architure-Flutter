
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

@injectableInit
Future<GetIt> _initDependencies(GetIt getIt) async => $initGetIt(getIt);

class AppContainer {
  static GetIt getIt = GetIt.instance;

  static Future<void> init() async {
    await _initDependencies(getIt);
  }
}

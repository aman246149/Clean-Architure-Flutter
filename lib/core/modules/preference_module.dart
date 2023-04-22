import 'package:injectable/injectable.dart';
import 'package:localstore/localstore.dart';

@module
abstract class PreferenceModule {
  @lazySingleton
  Localstore provideSharedPreferences() {
    return Localstore.instance;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:localstore/localstore.dart' as _i7;

import '../bloc/auth/auth_bloc.dart' as _i8;
import '../blocobserver/bloc_observer.dart' as _i3;
import '../data/db/db_client.dart' as _i9;
import '../data/repository/auth_repository.dart' as _i4;
import '../domain/usecases/auth_usecase.dart' as _i5;
import '../modules/network_module.dart' as _i12;
import '../modules/preference_module.dart' as _i11;
import '../utils/loader.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final preferenceModule = _$PreferenceModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppBlocObserver>(() => _i3.AppBlocObserver());
  gh.lazySingleton<_i4.AuthRepository>(() => _i4.AuthRepository());
  gh.lazySingleton<_i5.AuthUseCase>(
      () => _i5.AuthUseCase(get<_i4.AuthRepository>()));
  gh.lazySingleton<_i6.Loader>(() => _i6.Loader());
  gh.lazySingleton<_i7.Localstore>(
      () => preferenceModule.provideSharedPreferences());
  gh.lazySingleton<_i8.AuthBloc>(
      () => _i8.AuthBloc(authUseCase: get<_i5.AuthUseCase>()));
  gh.lazySingleton<_i9.DBClient>(() => _i9.DBClient(get<_i7.Localstore>()));
  gh.lazySingleton<_i10.Dio>(
      () => networkModule.provideDio(get<_i7.Localstore>()));
  return get;
}

class _$PreferenceModule extends _i11.PreferenceModule {}

class _$NetworkModule extends _i12.NetworkModule {}

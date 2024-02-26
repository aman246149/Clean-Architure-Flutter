// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:localstore/localstore.dart' as _i6;

import '../bloc/auth/auth_bloc.dart' as _i12;
import '../blocobserver/bloc_observer.dart' as _i3;
import '../data/db/db_client.dart' as _i7;
import '../data/network/api_client.dart' as _i10;
import '../data/repository/auth_repository.dart' as _i4;
import '../data/repository/db_repository.dart' as _i8;
import '../domain/usecases/auth_usecase.dart' as _i11;
import '../modules/network_module.dart' as _i14;
import '../modules/preference_module.dart' as _i13;
import '../utils/loader.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final preferenceModule = _$PreferenceModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.AppBlocObserver>(() => _i3.AppBlocObserver());
    gh.lazySingleton<_i4.AuthRepository>(() => _i4.AuthRepository());
    gh.lazySingleton<_i5.Loader>(() => _i5.Loader());
    gh.lazySingleton<_i6.Localstore>(
        () => preferenceModule.provideSharedPreferences());
    gh.lazySingleton<_i7.DBClient>(() => _i7.DBClient(gh<_i6.Localstore>()));
    gh.lazySingleton<_i8.DatabaseRepository>(
        () => _i8.DatabaseRepository(gh<_i7.DBClient>()));
    gh.lazySingleton<_i9.Dio>(
        () => networkModule.provideDio(gh<_i6.Localstore>()));
    gh.lazySingleton<_i10.ApiClient>(() => _i10.ApiClient(gh<_i9.Dio>()));
    gh.lazySingleton<_i11.AuthUseCase>(() => _i11.AuthUseCase(
          gh<_i4.AuthRepository>(),
          gh<_i8.DatabaseRepository>(),
        ));
    gh.lazySingleton<_i12.AuthBloc>(
        () => _i12.AuthBloc(authUseCase: gh<_i11.AuthUseCase>()));
    return this;
  }
}

class _$PreferenceModule extends _i13.PreferenceModule {}

class _$NetworkModule extends _i14.NetworkModule {}

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

import '../bloc/auth/auth_bloc.dart' as _i24;
import '../blocobserver/bloc_observer.dart' as _i3;
import '../data/db/db_client.dart' as _i7;
import '../data/network/api_client.dart' as _i10;
import '../data/repository/article_repository.dart' as _i11;
import '../data/repository/auth_repository.dart' as _i4;
import '../data/repository/db_repository.dart' as _i8;
import '../data/repository/event_repository.dart' as _i14;
import '../data/repository/groupbyin_repository.dart' as _i16;
import '../data/repository/intership_repository.dart' as _i18;
import '../data/repository/profile_repository.dart' as _i20;
import '../data/repository/search_repository.dart' as _i22;
import '../domain/usecases/article_usecase.dart' as _i12;
import '../domain/usecases/auth_usecase.dart' as _i13;
import '../domain/usecases/events_usecase.dart' as _i15;
import '../domain/usecases/groupbyin_usecase.dart' as _i17;
import '../domain/usecases/internship_usecase.dart' as _i19;
import '../domain/usecases/profile_usecase.dart' as _i21;
import '../domain/usecases/search_usecase.dart' as _i23;
import '../modules/network_module.dart' as _i26;
import '../modules/preference_module.dart' as _i25;
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
    gh.lazySingleton<_i11.ArticleRepository>(
        () => _i11.ArticleRepository(gh<_i10.ApiClient>()));
    gh.lazySingleton<_i12.ArticleUseCase>(
        () => _i12.ArticleUseCase(gh<_i11.ArticleRepository>()));
    gh.lazySingleton<_i13.AuthUseCase>(() => _i13.AuthUseCase(
          gh<_i4.AuthRepository>(),
          gh<_i8.DatabaseRepository>(),
        ));
    gh.lazySingleton<_i14.EventRepository>(
        () => _i14.EventRepository(gh<_i10.ApiClient>()));
    gh.lazySingleton<_i15.EventUseCase>(
        () => _i15.EventUseCase(gh<_i14.EventRepository>()));
    gh.lazySingleton<_i16.GroupByInRepository>(
        () => _i16.GroupByInRepository(gh<_i10.ApiClient>()));
    gh.lazySingleton<_i17.GroupByInUseCase>(
        () => _i17.GroupByInUseCase(gh<_i16.GroupByInRepository>()));
    gh.lazySingleton<_i18.InternShipRepository>(
        () => _i18.InternShipRepository(gh<_i10.ApiClient>()));
    gh.lazySingleton<_i19.InternShipUseCase>(
        () => _i19.InternShipUseCase(gh<_i18.InternShipRepository>()));
    gh.lazySingleton<_i20.ProfileRepository>(() => _i20.ProfileRepository(
          gh<_i10.ApiClient>(),
          gh<_i8.DatabaseRepository>(),
        ));
    gh.lazySingleton<_i21.ProfileUseCase>(
        () => _i21.ProfileUseCase(gh<_i20.ProfileRepository>()));
    gh.lazySingleton<_i22.SearchRepository>(
        () => _i22.SearchRepository(gh<_i10.ApiClient>()));
    gh.lazySingleton<_i23.SearchUseCase>(
        () => _i23.SearchUseCase(gh<_i22.SearchRepository>()));
    gh.lazySingleton<_i24.AuthBloc>(
        () => _i24.AuthBloc(authUseCase: gh<_i13.AuthUseCase>()));
    return this;
  }
}

class _$PreferenceModule extends _i25.PreferenceModule {}

class _$NetworkModule extends _i26.NetworkModule {}

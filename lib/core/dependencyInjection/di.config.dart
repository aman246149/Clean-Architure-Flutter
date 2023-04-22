// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:dio/dio.dart' as _i13;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:localstore/localstore.dart' as _i10;

import '../bloc/auth/auth_bloc.dart' as _i11;
import '../blocobserver/bloc_observer.dart' as _i3;
import '../data/db/db_client.dart' as _i12;
import '../data/repository/auth_repository.dart' as _i4;
import '../domain/usecases/auth_usecase.dart' as _i5;
import '../modules/firebasemodules.dart' as _i14;
import '../modules/network_module.dart' as _i16;
import '../modules/preference_module.dart' as _i15;
import '../utils/loader.dart' as _i9; // ignore_for_file: unnecessary_lambdas

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
  final firebaseAuthIns = _$FirebaseAuthIns();
  final firebaseDb = _$FirebaseDb();
  final firebaseStorageIns = _$FirebaseStorageIns();
  final preferenceModule = _$PreferenceModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppBlocObserver>(() => _i3.AppBlocObserver());
  gh.lazySingleton<_i4.AuthRepository>(() => _i4.AuthRepository());
  gh.lazySingleton<_i5.AuthUseCase>(
      () => _i5.AuthUseCase(get<_i4.AuthRepository>()));
  gh.lazySingleton<_i6.FirebaseAuth>(() => firebaseAuthIns.auth);
  gh.lazySingleton<_i7.FirebaseFirestore>(() => firebaseDb.firebasefiresore);
  gh.lazySingleton<_i8.FirebaseStorage>(() => firebaseStorageIns.storage);
  gh.lazySingleton<_i9.Loader>(() => _i9.Loader());
  gh.lazySingleton<_i10.Localstore>(
      () => preferenceModule.provideSharedPreferences());
  gh.lazySingleton<_i11.AuthBloc>(
      () => _i11.AuthBloc(authUseCase: get<_i5.AuthUseCase>()));
  gh.lazySingleton<_i12.DBClient>(() => _i12.DBClient(get<_i10.Localstore>()));
  gh.lazySingleton<_i13.Dio>(
      () => networkModule.provideDio(get<_i10.Localstore>()));
  return get;
}

class _$FirebaseAuthIns extends _i14.FirebaseAuthIns {}

class _$FirebaseDb extends _i14.FirebaseDb {}

class _$FirebaseStorageIns extends _i14.FirebaseStorageIns {}

class _$PreferenceModule extends _i15.PreferenceModule {}

class _$NetworkModule extends _i16.NetworkModule {}

import 'dart:developer';

import 'package:architecture/core/constants/app_constants.dart';
import 'package:architecture/core/routes/router.gr.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:localstore/localstore.dart';


@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio(Localstore localstore) {
    final dio = Dio();
    dio.options.baseUrl = AppConstants.baseUrl; //Setting baseUrl
    dio
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.data is FormData) {
            // options.headers = {'Content-Type': 'multipart/form-data'};
          }
          handler.next(options);
        },
        // onError:
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // getting token
            log("Getting Token");
            // var data =
            //     await localstore.collection("auth").doc("tokenData").get();
            var bearerTokenData = await localstore
                .collection("auth")
                .doc("bearerTokenData")
                .get();
            // var accessToken = data?[AppConstants.token];
            var bearerToken = bearerTokenData?[AppConstants.token];
            if (bearerToken != null) {
              // options.headers.putIfAbsent('X-Auth-Token', () => "$accessToken");
              options.headers
                  .putIfAbsent("Authorization", () => "$bearerToken");
              // log("X auth token ${options.headers.containsKey("X-Auth-Token")}");
              print(
                  "Authorizations ${options.headers.containsKey("Authorization")}");
              print(options.headers.toString());
            } else {
              print('Auth token is null');
            }

            handler.next(options);
          },
        ),
      )
      ..interceptors
          .add(InterceptorsWrapper(onError: ((DioError e, handler) async {
        print(e.response?.data);
        print(e.response?.data.runtimeType);
        if (e.response?.statusCode == 401) {
          // await localstore.collection("auth").doc("tokenData").delete();
          Localstore.instance
              .collection("auth")
              .doc("bearerTokenData")
              .delete();
          // GetIt.I<AppRouter>().replaceAll([const LoginScreenRoute()]);
          return;
        }
        if (e.response?.data is String) {
          e.response?.data = {"message": e.response?.data};
        } else if (e.response?.data is! Map) {
          e.response?.data = {
            "message": "Some error occurred. Please try again later."
          };
        }
        handler.next(e);
      })));
    return dio;
  }
}

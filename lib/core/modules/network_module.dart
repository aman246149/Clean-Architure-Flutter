import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:localstore/localstore.dart';

import '../../main.dart';
import '../constants/app_constants.dart';

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
            options.headers = {'Content-Type': 'multipart/form-data'};
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
            var bearerTokenData =
                await localstore.collection("auth").doc("tokenData").get();
            // var accessToken = data?[AppConstants.token];
            logger.i(bearerTokenData);
            var bearerToken = bearerTokenData?[AppConstants.token];
            if (bearerToken != null) {
              // options.headers.putIfAbsent('X-Auth-Token', () => "$accessToken");
              options.headers
                  .putIfAbsent("Authorization", () => "Bearer $bearerToken");
              // log("X auth token ${options.headers.containsKey("X-Auth-Token")}");
              logger.d(
                  "Authorizations ${options.headers.containsKey("Authorization")}");
              logger.d(options.headers.toString());
            } else {
              logger.d('Auth token is null');
            }

            handler.next(options);
          },
        ),
      )
      ..interceptors
          .add(InterceptorsWrapper(onError: ((DioError e, handler) async {
        logger.e(e.response?.toString());
        // debugPrint(e.response?.data.runtimeType.toString());
        if (e.response!.data["message"].toString().contains("Token expired") ||
            e.response?.statusCode == 401 ||
            e.response?.statusCode == 403) {
          // await localstore.collection("auth").doc("tokenData").delete();
          Localstore.instance
              .collection("auth")
              .doc("bearerTokenData")
              .delete();
          // GetIt.I<AppRouter>().replaceAll([const LoginRoute()]);
          return;
        }
        if (e.response?.data is String) {
          e.response?.data = {"message": e.response?.data};
        } else if (e.response?.data is! Map) {
          e.response?.data = {
            "message": "Some error occurred. Please try again later."
          };
        }
        logger.e(e);
        handler.next(e);
      })));
    return dio;
  }
}

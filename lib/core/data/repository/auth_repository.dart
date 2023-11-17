import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepository {
  AuthRepository();

  Future<dynamic> signUp(Map data) async {
    try {
      await logoutExistingUser();
      final userAttributes = <AuthUserAttributeKey, String>{
        AuthUserAttributeKey.email: data["email"],
        AuthUserAttributeKey.phoneNumber: "+91" + data["mobile_number"],
        AuthUserAttributeKey.name: data["name"]
        // additional attributes as needed
      };
      await Amplify.Auth.signUp(
        username: data["email"],
        password: data["password"],
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signIn(Map data) async {
    try {
      await logoutExistingUser();
      final result = await Amplify.Auth.signIn(
          username: data["email"], password: data["password"]);
      if (!result.isSignedIn) {
        await Amplify.Auth.resendSignUpCode(username: data["email"]);
      }
      return await getIdToken(result.isSignedIn);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      return await logoutExistingUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      await logoutExistingUser();
      final result =
          await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
      log("Auth Result SUccessful: Google");
      return await getIdToken(result.isSignedIn);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> confirmUserCode(Map data) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: data["email"], confirmationCode: data["code"]);
      if (result.isSignUpComplete) {
        final signInResult = await Amplify.Auth.signIn(
            username: data["email"], password: data["password"]);
        return await getIdToken(signInResult.isSignedIn);
      }
      return "";
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> resendOtp(String email) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getIdToken(bool isSignedIn) async {
    if (isSignedIn) {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      final session = await cognitoPlugin.fetchAuthSession();
      return session.userPoolTokensResult.value.idToken.raw;
    } else {
      return "";
    }
  }

  Future<void> logoutExistingUser() async {
    if ((await Amplify.Auth.fetchAuthSession()).isSignedIn) {
      log("User was signed in. Now logging out");
      await Amplify.Auth.signOut(
        options: const SignOutOptions(globalSignOut: true),
      );
    } else {
      log("User was already logged out");
    }
  }

  Future<dynamic> forgortPassword(String email) async {
    try {
      await Amplify.Auth.resetPassword(username: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> confirmPassword(Map data) async {
    try {
    return  await Amplify.Auth.confirmResetPassword(
          username: data["email"],
          newPassword: data["password"],
          confirmationCode: data["code"]);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:architecture/core/constants/icons.dart';
import 'package:architecture/core/presentation/widgets/appbar.dart';
import 'package:architecture/core/presentation/widgets/custom_text.dart';
import 'package:architecture/core/presentation/widgets/hspace.dart';
import 'package:architecture/core/presentation/widgets/primary_button.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:architecture/core/routes/router.gr.dart';
import 'package:architecture/core/utils/common_methods.dart';
import 'package:architecture/core/utils/validator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/auth/auth_bloc.dart';
import '../widgets/login_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = false;
  String emailValidError = "";
  String passwordValidError = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void validateAndCheck() {
    String? validateEmail = Validator.validateEmail(email.text);
    String? validatePassword = Validator.validatePassword(password.text);

    setState(() {
      emailValidError = "";
      passwordValidError = "";
      if (validateEmail != null) {
        emailValidError = validateEmail;
        return;
      }

      if (validatePassword != null) {
        passwordValidError = validatePassword;
        return;
      }
    });

    if (emailValidError.isEmpty && passwordValidError.isEmpty) {
      debugPrint("Sign in succes");
      context
          .read<AuthBloc>()
          .add(SignInEvent(email: email.text, password: password.text));
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppBar(text: "Sign In"),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignInLoadingState) {
            showOverlayLoader(context);
          } else if (state is SignInSuccessState) {
            hideOverlayLoader(context);
            // context.router.replaceAll([const BottomBarRoute()]);
          } else if (state is AuthErrorState) {
            hideOverlayLoader(context);
            showErrorSnackbar(context, state.error);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Vspace(10),
              const TextLabel(
                text: "Email",
              ),
              const Vspace(4),
              CustomTextField(
                hintText: "Enter your email",
                controller: email,
              ),
              emailValidError.isNotEmpty
                  ? ValidationError(
                      error: emailValidError,
                    )
                  : const SizedBox.shrink(),
              const Vspace(16),
              const TextLabel(
                text: "Password",
              ),
              const Vspace(4),
              CustomTextField(
                hintText: "Enter your password",
                isIconRequired: true,
                hidePassword: hidePassword,
                controller: password,
                hideText: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
              passwordValidError.isNotEmpty
                  ? ValidationError(
                      error: passwordValidError,
                    )
                  : const SizedBox.shrink(),
              const Vspace(4),
              const Expanded(child: Vspace(0)),
              PrimaryButton(
                text: "Sign in",
                onTap: () {
                  validateAndCheck();
                },
              ),
              const Vspace(26),
              TextButtonWidget(
                first: "Don’t have an account?",
                second: " Sign up",
                onTap: () {
                  context.router.push(const SignUpScreenRoute());
                },
              ),
              const Vspace(26),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:architecture/core/presentation/widgets/appbar.dart';
import 'package:architecture/core/presentation/widgets/custom_text.dart';
import 'package:architecture/core/presentation/widgets/primary_button.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:architecture/core/utils/common_methods.dart';
import 'package:architecture/features/auth/presentation/widgets/login_widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/bloc/auth/auth_bloc.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/presentation/widgets/hspace.dart';
import '../../../../core/routes/router.gr.dart';
import '../../../../core/utils/validator.dart';
import '../widgets/signup_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  String nameValidError = "";
  String emailValidError = "";
  String mobileValidError = "";
  String passwordValidError = "";
  bool hidePassword = false;
  bool isVerifyMobileClicked = false;

  void validateAndSave() {
    FocusManager.instance.primaryFocus?.unfocus();

    String? validateEmail = Validator.validateEmail(email.text);
    String? validatePassword = Validator.validatePassword(password.text);
    String? validateName = Validator.validateName(name.text);
    String? validateMobileNumber =
        Validator.validateMobileNumber(mobileNumber.text);

    setState(() {
      emailValidError = "";
      passwordValidError = "";
      nameValidError = "";
      mobileValidError = "";

      if (validateEmail != null) {
        emailValidError = validateEmail;
      }

      if (validatePassword != null) {
        passwordValidError = validatePassword;
      }
      if (validateName != null) {
        nameValidError = validateName;
      }
      if (validateMobileNumber != null) {
        mobileValidError = validateMobileNumber;
      }
    });

    if (emailValidError.isEmpty &&
        mobileValidError.isEmpty &&
        nameValidError.isEmpty &&
        passwordValidError.isEmpty) {
      debugPrint("Sign up succes");
      // showVerificationBottomModal();
      // goToConfirmationCode();
      //! Todo unComment here
      context.read<AuthBloc>().add(SignUpEvent(
          email: email.text,
          mobileNumber: mobileNumber.text,
          name: name.text,
          password: password.text));
    }
  }

  void showVerificationBottomModal() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 24, top: 12),
          decoration: const BoxDecoration(
              color: Color(0xff191B1C),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: IntrinsicHeight(
            child: Column(
              children: [
                SvgPicture.asset(AppIcons.rect),
                const Vspace(16),
                SvgPicture.asset(AppIcons.ellipse),
                const Vspace(8),
                TextWidget(
                  text:
                      "Verify your mobile number or email for registering in our application.",
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const Vspace(24),
                CommonVerifyButton(
                  imagePath: AppIcons.phone,
                  text: "Verify Mobile number",
                  onTap: () {
                    isVerifyMobileClicked = true;
                    context
                        .read<AuthBloc>()
                        .add(GetVerificationCodeEvent(mobileNumber.text));
                  },
                ),
                const Vspace(16),
                CommonVerifyButton(
                  imagePath: AppIcons.main,
                  text: "Verify Email",
                  onTap: () {
                    isVerifyMobileClicked = false;
                    context
                        .read<AuthBloc>()
                        .add(GetVerificationCodeEvent(email.text));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void goToConfirmationCode() {
    // if (isVerifyMobileClicked) {
    //   context.router.push(OtpScreenRoute(
    //       text: mobileNumber.text, isFromSignUp: true, userName: name.text));
    // } else {
    //   context.router.push(OtpScreenRoute(
    //       text: email.text, isFromSignUp: true, userName: name.text));
    // }
  }

  @override
  void dispose() {
    // email.dispose();
    // password.dispose();
    // mobileNumber.dispose();
    // password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is VerifyDataLoadingState || state is SignUpLoadingState) {
          showOverlayLoader(context);
        } else if (state is VerifyDataSuccessState) {
          hideOverlayLoader(context);
          goToConfirmationCode();
        } else if (state is AuthErrorState) {
          hideOverlayLoader(context);
          showErrorSnackbar(context, state.error);
        } else if (state is SignUpSuccessState) {
          hideOverlayLoader(context);
          showVerificationBottomModal();
        }
      },
      child: Scaffold(
        appBar: const CommonAppBar(
          text: "Sign Up",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Vspace(8),
              const TextLabel(text: "Name"),
              const Vspace(4),
              CustomTextField(
                hintText: "Enter your name",
                controller: name,
              ),
              nameValidError.isNotEmpty
                  ? ValidationError(
                      error: nameValidError,
                    )
                  : const SizedBox.shrink(),
              const Vspace(16),
              const TextLabel(text: "Email"),
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
              const TextLabel(text: "Mobile number"),
              const Vspace(4),
              CustomTextField(
                hintText: "Enter your mobile number",
                controller: mobileNumber,
                textInputType: TextInputType.number,
              ),
              mobileValidError.isNotEmpty
                  ? ValidationError(
                      error: mobileValidError,
                    )
                  : const SizedBox.shrink(),
              const Vspace(16),
              const TextLabel(text: "Password"),
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
              const Vspace(16),
              const SignupPrivacyText(),
              const Vspace(40),
              PrimaryButton(
                text: "Sign up",
                onTap: () {
                  validateAndSave();
                },
              ),
              const Vspace(26),
              TextButtonWidget(
                onTap: () {
                  context.router.pop();
                },
                first: "Already have an account?",
                second: "Sign In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonVerifyButton extends StatelessWidget {
  const CommonVerifyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.imagePath,
  });
  final Function() onTap;
  final String text;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath),
          const Hspace(11),
          TextWidget(
            text: text,
            fontSize: 16,
            color: const Color(0xff111314),
          ),
        ],
      ),
    );
  }
}

import 'package:architecture/core/constants/images.dart';
import 'package:architecture/core/presentation/widgets/primary_button.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:architecture/core/routes/router.gr.dart';
import 'package:architecture/core/theme/app_color.dart';
import 'package:architecture/core/theme/apptheme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/gradient_background.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GradientBackGround(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Vspace(21),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Discover Amazing Events In Your City",style: AppTheme.bodyText1.copyWith(fontSize: 32),),
                    ),
                    const Vspace(9),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('The best event we prepared for you today',style: AppTheme.bodyText3.copyWith(color: AppColors.white.withOpacity(0.8)),),
                    ),
                    const Vspace(27),
                    Image.asset(AppImages.onBoarding1)
                  ],
                ),
              ),
            ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: PrimaryButton(text: "Get Started",
                          icon:const Icon(Icons.arrow_forward,color: AppColors.white,size: 20,),
                          onTap: () {
                          // context.router.push(const LoginScreenRoute());
                        },
                      ),
              ),
          ],
        ),
        
      ),    
    );
  }
}



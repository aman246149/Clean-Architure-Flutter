
import 'package:architecture/core/constants/images.dart';
import 'package:architecture/core/presentation/widgets/gradient_background.dart';
import 'package:architecture/core/presentation/widgets/hspace.dart';
import 'package:architecture/core/presentation/widgets/primary_button.dart';
import 'package:architecture/core/presentation/widgets/vspace.dart';
import 'package:architecture/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/presentation/widgets/border_textfield.dart';
import '../../../core/presentation/widgets/common_border.dart';
import '../../../core/theme/apptheme.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  int currentPage=0;
  String phoneNumber="";
  List<String> images=[
    "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
    "https://images.unsplash.com/photo-1415886541506-6efc5e4b1786?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/2.3,
              child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                    currentPage=value;
                      
                    });
                  },
                  children: images.map((e) => Image.network(e,fit: BoxFit.cover,width: double.infinity,)).toList(),
              ),
            ),
            Expanded(child: GradientBackGround(
                height: MediaQuery.of(context).size.height/2,
              color: [Colors.black.withOpacity(0),const Color(0xFF2C110B)],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Vspace(35),
                      Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          spacing: 10,
                          children: images.map((e) {
                            int index=images.indexOf(e);
                            return CircleAvatar(backgroundColor:currentPage==index? AppColors.white:AppColors.grey,radius: 3,);
                          }).toList(),
                        ),
                      ),
                      const Vspace(16),
                      Text("Login",style: AppTheme.bodyText1,),
                      const Vspace(9),
                      Text("Enter your mobile number to signup or login to your existing account",style: AppTheme.bodyText3.copyWith(color: AppColors.white.withOpacity(0.8)),),
                      const Vspace(24),
                      CommonBorder(
                        child: Row(
                          children: [
                            Image.asset(AppImages.indiaFlag),
                            const Hspace(10),
                            Text("+91",style: AppTheme.bodyText2.copyWith(fontWeight: FontWeight.w400),),
                            const Hspace(10),
                            Expanded(child: BorderedTextFormField(
                              maxLength: 10,
                              hintText: "Enter Your Mobile Number",
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChange: (value) {
                                setState(() {
                                  phoneNumber=value;
                               
                                });
                              },
                            )),
                          ],
                        ),
                      ),
                      const Vspace(48),
                      PrimaryButton(text: "Get Otp",onTap:phoneNumber.isEmpty || phoneNumber.length<10?null: () {
                        
                      },
                      padding: EdgeInsets.zero,
                      ),
                      const Vspace(25),
                      RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'By signing up you agree to our, ',
                        style: AppTheme.bodyText3.copyWith(fontSize: 12,color: AppColors.white.withOpacity(0.8)),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms & Condition',
                            style: AppTheme.bodyText3.copyWith(fontSize: 12,color: const Color(0xFFFF4655)),
                          ),
                          TextSpan(
                            text: ' and  ',
                            style: AppTheme.bodyText3.copyWith(fontSize: 12,color: AppColors.white.withOpacity(0.8)),
                          ),
                          TextSpan(
                            text: 'Privacy and Policies',
                            style: AppTheme.bodyText3.copyWith(fontSize: 12,color: const Color(0xFFFF4655)),
                          ),
                
                        ],
                      ),
                    )
                    ],
                  ),
                ),
              ),
            ),
            )
          ],
        ),
      ),
    )
    ;
  }
}


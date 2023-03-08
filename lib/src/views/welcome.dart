import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_theme.dart';
import 'authentication/login.dart';


class WelcomeScreen extends StatelessWidget {
  static const id ='welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
        AppTheme.lightGreen,
        body: Padding(
          padding: const EdgeInsets.only(left:24.0,right:24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(24.h),

              Gap(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Use\n',
                            style: GoogleFonts.dmSans(

                                fontSize: 32.sp,
                                color: AppTheme.lightBlack,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Consult today',
                            style: GoogleFonts.poppins(
                                fontSize: 24.sp,
                                color: AppTheme.lightBlack,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom:5.0),
                    child: Image.asset('assets/app_logo.png',width: 87.w, height: 77.h,),
                  )
                ],),
              Gap(20.h),
              Stack(

                // alignment:Alignment.bottomCenter,
                children: [
                  Container(height:416.h,width: 382.w,margin:
                  EdgeInsets.only(top: 80.h),padding: EdgeInsets.only(
                    top: Consts.avatarRadius + Consts.padding +40,
                    bottom: Consts.padding,
                    left: Consts.padding,
                    right: Consts.padding,
                  ),
                    child:
                    Column
                      (
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Get professional consultation from the best consultants around you.',textAlign:TextAlign.left,style: GoogleFonts.poppins(color: AppTheme.primary,fontSize: 20.sp,fontWeight: FontWeight.w600,fontStyle: FontStyle.normal),)
                      ],
                    ),
                    decoration:
                    BoxDecoration
                      (borderRadius: BorderRadius.circular(20),color: AppTheme.white),),
                  Positioned(
                    left: 90.w,
                    bottom: 300.h,
                    child: CircleAvatar(
                      radius: 80,
                      foregroundColor: AppTheme.lightGreen,
                      backgroundColor: AppTheme.lightGreen,
                      backgroundImage: AssetImage('assets/welcome.png'),),
                  ),
                ],
              ),
              Gap(64.h),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);

              }, child:Text('Get Started',style: GoogleFonts.poppins(

                  color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(382.w,58.h),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), )

            ],
          ),
        ),
      ),
    );
  }
}


class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
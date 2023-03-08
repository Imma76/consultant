import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import 'confirmation_screen.dart';


class GreatJob extends StatelessWidget {
  static const id ='great_job';
  const GreatJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
     body: Padding(
       padding:  EdgeInsets.only(left:24.0.w,right:24.w),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
         Center(
           child: Image.asset("assets/app_logo.png",width:
             161.w,height: 142.h,),
         ),

           Gap(24.h),
           Text('Great job, you are almost signed up as a consultant, click “Next” to get to the last phase of your sign up process',style: GoogleFonts.poppins(color: AppTheme.lightBlack,fontSize: 24.sp,fontWeight: FontWeight.w500),),

          Gap(181.h),
           ElevatedButton(onPressed: (){
             Navigator.pushNamed(context, ConfirmationScreen.id);

           }, child:Text('Next',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(382.w,58.h)), ),

         ],),
     ),
    );
  }
}

import 'package:consultant/src/views/home/base.dart';
import 'package:consultant/src/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';


class ConfirmationScreen extends StatelessWidget {
  static const id ='confirm_screen';
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding:  EdgeInsets.only(left:18.0.w,right:18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400.h,
              decoration: BoxDecoration(color: AppTheme.primary,borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset("assets/app_logo.png",width:
                      161.w,height: 142.h,color: AppTheme.white,),
                    ),

                    Gap(24.h),
                    Text('Congratulations on your sign up completion.Your account will undergo a 5 day verification process after which you will receive a mail for your oral interview.',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 20.sp,fontWeight: FontWeight.w500),),



                  ],
                ),
              ),
            ),
            Gap(181.h),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, Base.id);
            }, child:Text('Next',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(382.w,58.h)), ),


          ],),
      ),
    );
  }
}

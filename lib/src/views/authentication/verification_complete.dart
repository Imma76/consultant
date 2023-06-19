import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../home/base.dart';

class VerificationComplete extends ConsumerStatefulWidget {
  static const id = 'vrification_complete';
  const VerificationComplete({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _VerificationCompleteState();
}

class _VerificationCompleteState extends ConsumerState<VerificationComplete> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Timer timer = Timer.periodic(Duration(seconds: 3), (timer) async{
      print('waiting verification');
      if(FirebaseAuth.instance.currentUser != null){
        await FirebaseAuth.instance.currentUser!.reload();
        if( FirebaseAuth.instance.currentUser!.emailVerified){
          print('verified');
          timer.cancel();
          Navigator.pushNamedAndRemoveUntil(context,Base.id, (route) => false);
        }
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(64.h),
          Center(
            child: Image.asset("assets/app_logo.png",width:
            161.w,height: 142.h,),
          ),

          Gap(64.h),
          Text('Verification complete',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w400)),
          Gap(15.h),
          Center(
            child: Image.asset("assets/check.png",width:
            64.w,height: 64.h,),
          ),
          Gap(24.h),
          Text('A link has been sent to your email \naddress, click the link to commense \nthe final phase of your signup process.',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500)),

          Spacer(),


        ],
      ),
    );
  }
}

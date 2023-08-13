
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';
import '../../all_providers/all_providers.dart';
import '../../controllers/central_state.dart';
import '../../themes/app_theme.dart';


class ForgotPassword extends ConsumerStatefulWidget {
  static const id = 'forget_password';
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<ForgotPassword> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final  authController = ref.read(authProvider);
    final centralController = ref.read(centralProvider);
  }
  @override
  Widget build(BuildContext context) {
    final  authController = ref.watch(authProvider);
    final centralController = ref.watch(centralProvider);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(left:24.w,right:24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Gap(24.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: Image.asset('assets/app_logo.png',width:87.w, height:77.h),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Text('Reset password',style: GoogleFonts.poppins(color: AppTheme.lightBlack,fontSize: 24.sp,fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),Gap(104.h),
                Text('Email address',style: GoogleFonts.poppins(color: AppTheme.lightBlack
                    ,fontSize: 16.sp,fontWeight: FontWeight.w400),),
                Gap(8.h),
                SizedBox(
                  height:
                  60.h,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      cursorColor: AppTheme.primary,
                      controller: authController.emailController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                          focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
                      ),
                    ),
                  ),
                ),



                Gap(104.h),


                centralController.isAppLoading?SpinKitDoubleBounce(color: AppTheme.primary,)
                    :ElevatedButton(onPressed: ()async{



                    await authController.resetPassword(centralController);

                }, child:Text('Continue',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary2,minimumSize: Size(382.w,58.h),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), ),
                Gap(24.h),



              ],
            ),
          ),
        ),
      ),
    );
  }
}

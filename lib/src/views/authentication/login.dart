import 'package:consultant/src/utils/widgets/loader.dart';
import 'package:consultant/src/views/authentication/sign_up.dart';
import 'package:consultant/src/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_providers/all_providers.dart';
import '../../themes/app_theme.dart';
import '../appointments/appointment_reschedule.dart';
import '../home/base.dart';


class LoginScreen extends ConsumerStatefulWidget {
  static const id = 'login';
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: Image.asset('assets/app_logo.png',width:87.w, height:77.h),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:13.0),
                      child: Text('Consultant Sign in',style: GoogleFonts.poppins(color: AppTheme.lightBlack,fontSize: 24.sp,fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),Gap(104.h),
                Text('Username',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
                Gap(8.h),
                SizedBox(
                  height:
                  60.h,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      controller: authController.emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                        focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
                      ),
                    ),
                  ),
                ),
                Gap(24.h),
                Text('Password',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400),),
                Gap(8.h),
                SizedBox(
                  height:
                  60.h,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      controller: authController.passwordController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2)),

                          focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: AppTheme.white2))
                      ),
                    ),
                  ),
                ),

                Gap(104.h),
                centralController.isAppLoading?Indicator2(color: AppTheme.white,):   ElevatedButton(onPressed: ()async{


                  if(authController.checkInputForSignIn()){

                    await authController.signIn(centralController);
                  }
                //  Navigator.pushNamed(context, Base.id);

                }, child:Text('Sign in',style: GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w700),),style: ElevatedButton.styleFrom(primary: AppTheme.primary,minimumSize: Size(382.w,58.h)), ),
            Gap(24.h),
                GestureDetector(
              onTap: () {
                authController.clearController();
                Navigator.pushNamed(context, SignUpScreen.id );
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Don\'t have an account?',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: AppTheme.black,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: ' Sign up',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: AppTheme.primary,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ))


              ],
            ),
          ),
        ),
      ),
    );
  }
}

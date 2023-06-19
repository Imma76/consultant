import 'package:consultant/src/all_providers/all_providers.dart';
import 'package:consultant/src/controllers/central_state.dart';
import 'package:consultant/src/controllers/user_controller.dart';
import 'package:consultant/src/themes/app_theme.dart';
import 'package:consultant/src/views/home/home_page.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class CountDownPage extends ConsumerStatefulWidget {
  static const id = 'confirm_page';
  const CountDownPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CountDownPageState();
}

class _CountDownPageState extends ConsumerState<CountDownPage>with SingleTickerProviderStateMixin {
  DateTime now = DateTime.now();
  late CustomTimerController _controller = CustomTimerController(
      vsync: this,
     // begin: Duration(hours: now.hour,days: now.day,minutes:  now.minute),
      // begin: Duration(hours: userController.consultant!.verificationDate!.hour,days: userController.consultant!.verificationDate!.day,minutes:  userController.consultant!.verificationDate!.minute),
      begin: userController.consultant!.verificationDate!.difference(now),
      //Duration(hours: now.difference(userController.consultant!.verificationDate!).inHours,days: now.difference(userController.consultant!.verificationDate!).inDays,minutes: now.difference( userController.consultant!.verificationDate!).inMinutes),
      end: Duration(),
      initialState: CustomTimerState.counting,
      interval: CustomTimerInterval.milliseconds
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  userController.init();
    ref.read(authProvider).updateConsultant(centralState);
    _controller.start();
    _controller.addListener(() {
      print('listening');
      if(DateTime.now().isAfter(userController.consultant!.verificationDate!)){
        _controller.removeListener(() { });
        ref.read(authProvider).updateConsultant(centralState);
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    print(now.difference(userController.consultant!.verificationDate!).inDays);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/app_logo.png',width: 161.w,height:142.h),
          Gap(24.h),
          Text('Verification ongoing...',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w400)),
          Gap(24.h),
          Center(
            child: CircleAvatar(
              radius: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('Countdown',style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 16.sp,fontWeight: FontWeight.w500)),
                  Gap(27.h),

                  CustomTimer(
                      controller: _controller,
                      builder: (state, time) {


                        // Build the widget you want!🎉


                        return   Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Gap(21.w),

                              Column(
                                children: [
                                  TimeWidget(time: '${time.days.replaceAll('-', '')}',height: 53,width: 47,),
                                  Gap(5.h),
                                  Text('Days',style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 10.sp,fontWeight: FontWeight.w500)),

                                ],
                              ),
                              Gap(21.w),
                              Column(
                                children: [
                                  TimeWidget(time: '${time.hours.replaceAll('-', '')}',height: 53,width: 47,),
                                  Gap(5.h),
                                  Text('Hours',style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 10.sp,fontWeight: FontWeight.w500)),

                                ],
                              ),
                              Gap(21.w),
                              Column(
                                children: [
                                  TimeWidget(time: '${time.minutes.replaceAll('-', '')}',height: 53,width: 47,),
                                  Gap(5.h),
                                  Text('Minutes',style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 10.sp,fontWeight: FontWeight.w500)),

                                ],
                              ),
                              Gap(21.w),
                              Column(
                                children: [
                                  TimeWidget(time: '${time.seconds.replaceAll('-', '')}',height: 53,width: 47,),
                                  Gap(5.h),
                                  Text('Seconds',style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 10.sp,fontWeight: FontWeight.w500)),

                                ],
                              ),

                              Gap(21.w),



                            ],
                          ),
                        );
                      }
                  ),

                ],
              ),
              backgroundColor: AppTheme.primary,
            ),
          )
        ],
      ),
    );
  }
}

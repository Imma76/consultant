import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:consultant/src/services/consultant_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_providers/all_providers.dart';
import '../../controllers/user_controller.dart';
import '../../themes/app_theme.dart';


class Homepage extends ConsumerStatefulWidget {
  static const id='home_page';

  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  List<String> healthTips = [
    "Exercise regularly and be physically active",
    "Take multivitamin supplements",
    "Go easy on alcohol and stay sober",
    "Eat a well balanced, low-fat diet with lots of fruits, vegetables and grains",
    "Cut down on saturated fat and sugar",
    "Eat less salt: no more than 6g a day for adults",
    "Eat more fish, including a portion of oily fish",
    "Base your meals on higher fibre starchy carbohydrates",
    "Wash or sanitize your hands regularly",
    "Do not eat immediately after a workout, wait for 20-25 minutes before eating after a workout",
    "Have atleast 20-25 grams of raw onion daily",
    "Laugh and smile",
    "Monitor your caffeine intake",
    "Do not eat heavy meals before bed",
    "Spend more time in the sun for more vitamin D",
    "Always use healthier oils when making meals",
    "Eat Whole Foods instead of processed foods",
    "Reject food or drinks made of artificial colors",
    "Try to eat a piece of fruit everyday"
  ];
  String getRandomTip() {
    Random random = Random();
    int index = random.nextInt(healthTips.length);
    return healthTips[index];
  }
 // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final centralController = ref.read(centralProvider);
  // }

  @override
  Widget build(BuildContext context) {
   // final userController = ref.watch(userProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
        AppTheme.lightGreen,
        body: Padding(
          padding: const EdgeInsets.only(left:24.0,right:24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30.h),
                Row(

                  children: [
                    Image.asset('assets/app_logo.png',width: 87.w,height:77.h),
                    Spacer(),
                    // Icon(Icons.notification_add
                    // ,size: 16,color: AppTheme.primary,),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: Avatar(),
                    )

                  ],
                ),
                Gap(16.h),
                Row(
                  children: [
                    Icon(Icons.home_filled,color: AppTheme.primary,size:
                      21.h,),Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:3.0),
                        child: Text('Home',style:  GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500) ),
                      ),
                    ),
                    Spacer(),
                    Column(

                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Row(

                            children: [
                              TimeWidget(time: DateTime.now().day.toString(),),Gap(8.w), TimeWidget(time: DateTime.now().month.toString(),),Gap(8.w), TimeWidget(time: '${DateTime.now().year}'.split('0')[1],)

                            ],
                          ),
                        ),
                        Gap(5),
                        Text('Date',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500) )
                      ],
                    )
                    ],
                ),
                Gap(16.h),

                Gap(16.h),

                GestureDetector(
                  onTap: ()async{
                    // await FirebaseAuth.instance.signOut();
                    print('heree');
                    },
                  child: Center(
                    child: Container(width: 295.w,height:259.h,
                      child: Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('15 tips to make your doctor\'s consultation better',textAlign:TextAlign.center,style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w500) ,),
                      )),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:[
                      Color.fromRGBO(
                        224, 239, 48, 0.74),
                      Color.fromRGBO(72, 181, 83, 0.3922)
                    ],)),),
                  ),
                ),
                Gap(24.h),
                Center(
                  child: Container(width: 295.w,height:259.h,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(getRandomTip(),textAlign:TextAlign.center,style:  GoogleFonts.poppins(color: AppTheme.white,fontSize: 24.sp,fontWeight: FontWeight.w500) ,),
                    )),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors:[
                        Color.fromRGBO(
                            8, 204, 239, 0.5254),
                        Color.fromRGBO(172, 181, 72, 0.5624)
                      ],)),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Avatar extends ConsumerWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {

    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Welcome',
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' Dr.${userController.consultant?.firstName}',
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: AppTheme.black2,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),

       Gap(5),
        CircleAvatar(
          backgroundImage:  CachedNetworkImageProvider(userController.consultant!.photoUrl.toString() ,),
          backgroundColor: AppTheme.white,
        ),

       ],
    );
  }
}

class ConsultantAvatar extends StatelessWidget {
  const ConsultantAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
         backgroundImage: AssetImage('assets/consultant_image.png'),
          backgroundColor: AppTheme.white,
        ),
        Gap(8.h),
        Row(
          children: [
            Text('Dr Margaret Elom',style: GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500)),
            Gap(5),
            CircleAvatar(radius: 3,backgroundColor: AppTheme.primary,),

          ],
        )
      ],
    );
  }
}

class TimeWidget extends StatelessWidget {
  String? time;
  double? width;
  double? height;
  TimeWidget({
    Key? key,this.time,this.height = 32,this.width=32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height:
      height,width:width,child:Center(child: Text('$time',style: GoogleFonts.inter(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w400))),decoration:
      BoxDecoration(borderRadius: BorderRadius
      .circular(5),color: AppTheme.white),);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../utils/widgets/app_bar.dart';


class ConsultantProfile extends ConsumerStatefulWidget {
  static const id='consultant profile';
  const ConsultantProfile({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ConsultantProfileState();
}

class _ConsultantProfileState extends ConsumerState<ConsultantProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
      //  appBar: PrimaryAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 21),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Gap(5.h),
                Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Image.asset(
                          'assets/app_logo.png', width: 87.w, height: 77.h),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text('Your profile', style: GoogleFonts.poppins(
                          color: AppTheme.lightBlack,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,),),
                    ),
                  ],
                ),
                Gap(16.h),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/consultant_image.png'),
                  backgroundColor: AppTheme.white,
                  radius: 58,
                ),
                Gap(16),
                Text('Dr. Henry Onah',style: GoogleFonts
                    .poppins(
                    fontSize: 16.sp,
                    color: AppTheme.black2,
                    fontWeight: FontWeight.w600)),
                Gap(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 274.h,
                      width: 180.w,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Consultant\'s Bio', style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: AppTheme.black2,
                                fontWeight: FontWeight.w500)),
                            Gap(16.h),
                            Row(
                              children: [
                                CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'First Name:',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: AppTheme.black2,
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: ' Ikechukwu',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: AppTheme.black2
                                              ,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(4),
                            Row(
                              children: [
                                CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Last Name:',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: AppTheme.black2,
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: ' Ikechukwu',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: AppTheme.black2
                                              ,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(4),
                            Row(
                              children: [
                                CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'State of origin:',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: AppTheme.black2,
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: ' Enugu',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: AppTheme.black2
                                              ,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(4),
                            Row(
                              children: [
                                CircleAvatar(backgroundColor: AppTheme.lightBlack,radius: 2,),Gap(4),

                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Specialty:',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: AppTheme.black2,
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: ' Gynacology',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: AppTheme.black2
                                              ,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.lightGreen
                      ),
                    ),
                    Gap(20),
                    Container(
                      height: 274.h,
                      width: 180.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text('Consultant\'s ratings', style: GoogleFonts
                              .poppins(
                              fontSize: 12.sp,
                              color: AppTheme.black2,
                              fontWeight: FontWeight.w500))
                        ],),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.lightGreen
                      ),
                    ),
                  ],
                ),
                Gap(58.h),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
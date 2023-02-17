import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../home/home_page.dart';


class Appointments extends ConsumerStatefulWidget {
  static const id ='appointment';
  const Appointments({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AppointmentsState();
}

class _AppointmentsState extends ConsumerState<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      AppTheme.lightGreen,
      body: Padding(
        padding: const EdgeInsets.only(left:24.0,right:24),
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
                Avatar()

              ],
            ),
            Gap(16.h),
            Row(
              children: [
                Icon(Icons.notification_add
                  ,size: 16,color: AppTheme.primary,),
                Text('Appointments',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500) ),
                Spacer(),
                Column(
                  children: [
                    Row(

                      children: [
                        TimeWidget(time: '06',),Gap(8.w), TimeWidget(time: '1',),Gap(8.w), TimeWidget(time: '23',)

                      ],
                    ),
                    Gap(5),
                    Text('Date',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500) )
                  ],
                )
              ],
            ),
            Gap(16.h),
            Text('Today',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700) ),
           Gap(24.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context,indec) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppointmentCard(),
                );
              }
            ),
            Gap(20),
            Text('Yesterday',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700) ),
            Gap(10.h),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context,indec) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppointmentCard(),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:48.h,width:382.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('John Dalton 1:00 - 1:45 PM  ',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500)),


            Spacer(),
            Text('(Session not open)',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500))
          ],
        ),
      ),
      decoration: BoxDecoration(color: AppTheme.white),
    );
  }
}

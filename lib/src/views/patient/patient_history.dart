import 'package:consultant/src/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../home/home_page.dart';


class PatientMedicalHistory extends ConsumerStatefulWidget {
  static const id='medical_history';
  const PatientMedicalHistory({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PatientMedicalHistoryState();
}

class _PatientMedicalHistoryState extends ConsumerState<PatientMedicalHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGreen,
      appBar: PrimaryAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(left:24.0,right:24),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10.h),
            Row(
              children: [
                Image.asset('assets/app_logo.png',width: 87.w,height:77.h),
                Spacer(),

                Avatar()

              ],
            ),
            Gap(16.h),
            Row(
              children: [
                Icon(Icons.notification_add
                  ,size: 16,color: AppTheme.primary,),
                Text('Patient medical history',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500) ),
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
            Text('JOHN DALTON',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700),),
            Gap(8),
            Text('Weight - 74kg',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
            Gap(8),
            Text('Height - 74kg',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
            Gap(8),
            Text('Allergies',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
            Gap(8),
            Text('Medical Conditions',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),


          ],
        ),
      ),
    );
  }
}

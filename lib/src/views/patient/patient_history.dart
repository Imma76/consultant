import 'package:consultant/src/models/patient_model.dart';
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
    PatientModel patient = ModalRoute.of(context)!.settings.arguments as PatientModel;
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
                Image.asset("assets/history.png",height: 16.h,width: 16.h,),Gap(5),
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
            Text('${patient.firstName!.toUpperCase()} ${patient.lastName!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700),),
            Gap(8),
            Text('Weight - ${patient.weight!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
            Gap(8),
            Text('Height - ${patient.height!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
            Gap(8),
            Text('Allergies - ${patient.allergies!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
            Gap(8),
            Text('Medical Conditions - ${patient.medicalConditions!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),


          ],
        ),
      ),
    );
  }
}

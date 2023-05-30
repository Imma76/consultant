import 'package:consultant/src/all_providers/all_providers.dart';
import 'package:consultant/src/models/appointment_model.dart';
import 'package:consultant/src/models/patient_model.dart';
import 'package:consultant/src/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../themes/app_theme.dart';
import '../../utils/widgets/loader.dart';
import '../home/home_page.dart';


class PatientMedicalHistory extends ConsumerStatefulWidget {
  final AppointmentModel?appointmentModel;
  static const id='medical_history';
  const PatientMedicalHistory({
    Key? key,this.appointmentModel
  }) : super(key: key);

  @override
  ConsumerState createState() => _PatientMedicalHistoryState();
}

class _PatientMedicalHistoryState extends ConsumerState<PatientMedicalHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(appointmentProvider).fetchPatientMedicalHistory( widget.appointmentModel!.patient!.userId!);
  }
  @override
  Widget build(BuildContext context) {
    final appointmentController= ref.watch(appointmentProvider);
    //PatientModel patient = ModalRoute.of(context)!.settings.arguments as PatientModel;
    return Scaffold(
      backgroundColor: AppTheme.lightGreen,
      appBar: PrimaryAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:24.0,right:24),
          child:appointmentController.load? Indicator2():Column(

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
                          TimeWidget(time: DateTime.now().day.toString(),),Gap(8.w), TimeWidget(time: DateTime.now().month.toString(),),Gap(8.w), TimeWidget(time: '${DateTime.now().year}'.split('0')[1],)

                        ],
                      ),
                      Gap(5),
                      Text('Date',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500) )
                    ],
                  )
                ],
              ),
              Gap(16.h),
              Text('${widget.appointmentModel!.patient!.firstName!.toUpperCase()} ${widget.appointmentModel!.patient!.lastName!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700),),
              Gap(8),
              Row(
                children: [
                  CircleAvatar(radius: 2,backgroundColor: AppTheme.black2,),Gap(5),
                  Text('Weight - ${widget.appointmentModel!.patient!.weight!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                ],
              ),
              Gap(8),
              Row(
                children: [
                  CircleAvatar(radius: 2,backgroundColor: AppTheme.black2,),Gap(5),
                  Text('Height - ${widget.appointmentModel!.patient!.height!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                ],
              ),
              Gap(8),
              Row(
                children: [
                  CircleAvatar(radius: 2,backgroundColor: AppTheme.black2,),Gap(5),
                  Text('Allergies - ${widget.appointmentModel!.patient!.allergies!.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                ],
              ),
              Gap(8),
              Row(
                children: [
                  CircleAvatar(radius: 2,backgroundColor: AppTheme.black2,),Gap(5),
                  Text('Medical Conditions - ${widget.appointmentModel!.patient!.medicalConditions?.toUpperCase()}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500),),
                ],
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: appointmentController.appointmentHistory!.length,
                shrinkWrap: true,
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom:10.0),
                    child: Container(
                      height: 172.h,
                      width: 382.w,
                      padding: EdgeInsets.only(top: 12,left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Date: ${ DateFormat('dd-MM-yyyy').format(appointmentController.appointmentHistory![index].appointmentStart!)}',style:  GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w400),),
                     Gap(5),
                      Text('Duration ${appointmentController.appointmentHistory![index].appointmentStartTime}-${appointmentController.appointmentHistory![index].appointmentEndTime}',style:  GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w400),),
                          Gap(5),
                       Text('Consultant Dr.${appointmentController.appointmentHistory![index].consultant!.firstName} ${appointmentController.appointmentHistory![index].consultant!.lastName}',style:  GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w400),),

                          Gap(5),     Text('Consultant\'s report :',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500), ),
                              Text('${appointmentController.appointmentHistory![index].report}',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w400),),
                        ],),
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  );
                }
              )

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant/src/all_providers/all_providers.dart';
import 'package:consultant/src/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_theme.dart';
import '../../utils/widgets/loader.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(appointmentProvider);
  }
  @override
  Widget build(BuildContext context) {
    final appointmentController= ref.watch(appointmentProvider);
    return SafeArea(
      child: Scaffold(

        backgroundColor:
        AppTheme.lightGreen,

        body: StreamBuilder<QuerySnapshot>(
          stream: appointmentController.getAppointmentStream(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){

              print('waiting');
              return Indicator();

            }
            if(snapshot.hasError ){
              return Text('Unable to load appointments');
            }
            List<AppointmentModel> todayAppointment=[];
            List<AppointmentModel> yesterdayAppointment=[];
            List<AppointmentModel> totalAppointment = snapshot.data!.docs.map((e) => AppointmentModel.fromJson(e.data()as Map)).toList();

            for(var appointment in totalAppointment){
              if(appointment.appointmentStart!.day == DateTime.now().day){
                todayAppointment.add(appointment);
              }
              if(DateTime.now().isBefore(appointment!.appointmentStart!)==true && DateTime.now().difference(appointment!.appointmentStart!)==1){
                yesterdayAppointment.add(appointment);
              }
            }
            return Padding(
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
                      Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: Avatar(),
                      )

                    ],
                  ),
                  Gap(16.h),
                  Row(
                    children: [
                      Image.asset('assets/notification_bell.png',height:16.h, width:16.w),Gap(5.w),

                      Padding(
                        padding: const EdgeInsets.only(top:5.0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:3.0),
                          child: Text('Appointments',style:  GoogleFonts.dmSans(color: AppTheme.black2,fontSize: 16.sp,fontWeight: FontWeight.w500) ),
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
                  Text('Today',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700) ),
                 Gap(24.h),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: todayAppointment.length,
                    itemBuilder: (context,index) {
                      AppointmentModel appointment = todayAppointment[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppointmentCard(appointmentModel: appointment,),
                      );
                    }
                  ),
                  Gap(20),
                  Text('Yesterday',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700) ),
                  Gap(10.h),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: yesterdayAppointment.length,
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppointmentCard(),
                        );
                      }
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final AppointmentModel? appointmentModel;
  const AppointmentCard({
    Key? key,this.appointmentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:48.h,width:382.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('${appointmentModel!.patient!.firstName} ${appointmentModel!.patient!.lastName} ${appointmentModel!.appointmentStart!.hour}:${appointmentModel!.appointmentStart!.minute} - ${appointmentModel!.appointmentEnd!.hour}:${appointmentModel!.appointmentEnd!.minute}  ',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500)),


            Spacer(),
            Text(DateTime.now().isAfter(appointmentModel!.appointmentStart!)?'(Session Ended)':'(Session not open)',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500))
          ],
        ),
      ),
      decoration: BoxDecoration(color: AppTheme.white),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant/src/all_providers/all_providers.dart';
import 'package:consultant/src/controllers/user_controller.dart';
import 'package:consultant/src/models/appointment_model.dart';
import 'package:consultant/src/services/chat_service.dart';
import 'package:consultant/src/views/patient/patient_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../services/consultant_service.dart';
import '../../themes/app_theme.dart';
import '../../utils/widgets/loader.dart';
import '../chats/chat_screen.dart';
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
              return Indicator2();

            }
            if(snapshot.hasError ){
              return Text('Unable to load appointments');
            }

            List<AppointmentModel> todayAppointment=[];
            List<AppointmentModel> yesterdayAppointment=[];
            List<AppointmentModel> totalAppointment = snapshot.data!.docs.map((e) {
              final snapshotData = e.data()as Map;
              snapshotData['appointmentId']=e.id;
              return AppointmentModel.fromJson(snapshotData);} ).toList();
            for(var appointment in totalAppointment){
              if(appointment.appointmentStart!.day == DateTime.now().day && appointment.consultant!.userId==userController.consultant!.userId ){
                todayAppointment.add(appointment);
              }else if(DateTime.now().isAfter(appointment!.appointmentStart!)==true  && appointment.consultant!.userId==userController.consultant!.userId ){
                print((DateTime.now().day-1)== appointment!.appointmentStart!.day);
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
                        child: AppointmentCard(appointment: appointment,),
                      );
                    }
                  ),
                  Gap(20),
                  Text('Previous',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 24.sp,fontWeight: FontWeight.w700) ),
                  Gap(10.h),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: yesterdayAppointment.length,
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppointmentCard(appointment: yesterdayAppointment[index],),
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

class AppointmentCard extends ConsumerWidget {
  final AppointmentModel? appointment;
   AppointmentCard({
    Key? key,this.appointment,
  }) : super(key: key);


  DropdownMenuItem value = DropdownMenuItem(child: Text('View medical history >'));
  @override
  Widget build(BuildContext context,ref) {

    return Container(
      height:48.h,width:382.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
                ( appointment!.appointmentEnd!.hour >12
                    &&appointment!.appointmentStart!.hour >
                    12)?'${appointment!.patient!.firstName} ${appointment!.patient!.lastName} ${ appointment!.appointmentStartTime} -${ appointment!.appointmentEndTime}':'${appointment!.patient!.firstName} ${appointment!.patient!.lastName} ${appointment!.appointmentStartTime}: - ${appointment!.appointmentEndTime
                }',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500)),


            Spacer(),
            DateTime.now().isAfter(appointment!.appointmentStart!) &&DateTime.now().isBefore(appointment!.appointmentEnd!) && appointment!.sessionEnded==false?
            GestureDetector(
                onTap: (){

                  showDialog(context: context, builder: (context, ){
                  return  Dialog(
                    child: Container(
                      height: 80.h,
                      width: 210.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return PatientMedicalHistory(appointmentModel:  appointment,);
                                }));
                      //Navigator.pushNamed(context, PatientMedicalHistory.id,arguments: appointment!.patient);
                    },
                              child: Text('View medical history >',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500))),
                          Gap(10),
                          GestureDetector(
                              onTap: ()async{
                                await ConsultantService.sendEmail('Your session with ${appointment!.patient!.firstName} ${appointment!.patient!.lastName} at ${ DateFormat('MMM d, H:mm y').format(appointment!.appointmentStart!)} has started');
                                await ConsultantService.sendEmail('Your session with ${appointment!.consultant!.firstName} ${appointment!.consultant!.lastName} at ${ DateFormat('MMM d, H:mm y').format(appointment!.appointmentStart!)} has started',email: appointment!.patient!.email);


                                String? chatRoomId = getChatRoomId(appointment!.patient!.firstName!, userController!.consultant!.firstName!);
                                List<String?> users = [appointment!.patient!.firstName!, userController!.consultant!.firstName!];
                                Map<String, dynamic> chatRoomMap = {
                                  'users':users,
                                  'chatroomid':chatRoomId,
                                };
                                await FirebaseMessageService.createChatRoom(chatRoomId, chatRoomMap);
                                // _provider.removeAndGoToChatScreen(context, adsOwnerNumber, adsOwner, chatRoomId);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return ChatScreen(appointment: appointment,);
                                }));

                              },
                              child: Text('Continue session >',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500)))
                        ],
                      ),
                    ),
                  );
                  });

                },
                child: Container(
                  height: 24,
                    width: 137,
                    decoration: BoxDecoration(color: AppTheme.primary,borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Text('Begin session >',style:  GoogleFonts.poppins(color: AppTheme.white
                        ,fontSize: 12.sp,fontWeight: FontWeight.w500)))))
            :Text(DateTime.now().isAfter(appointment!.appointmentEnd!)==true?'(Session Ended)':'(Session not open)',style:  GoogleFonts.poppins(color: AppTheme.black2,fontSize: 12.sp,fontWeight: FontWeight.w500))
          ],
        ),
      ),
      decoration: BoxDecoration(color: AppTheme.white),
    );
  }
  getChatRoomId(String receiverName , String senderName){
    if (receiverName.substring(0,1).codeUnitAt(0) > senderName.substring(0,1).codeUnitAt(0)){
      return "$senderName\_$receiverName";

    }else{
      return "$receiverName\_$senderName";
    }
  }
}


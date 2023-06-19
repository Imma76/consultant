
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant/src/all_providers/all_providers.dart';
import 'package:consultant/src/collections/collection.dart';
import 'package:consultant/src/controllers/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/appointment_model.dart';
import '../models/consultant_model.dart';
import '../services/appointment_service.dart';
import '../services/consultant_service.dart';

class AppointmentController extends ChangeNotifier{
  bool load = false;

  DateTime? selectedDate; bool updateAppointmentCheck=false;


  TextEditingController hourController = TextEditingController();
  TextEditingController reportController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  List<AppointmentModel>? appointmentHistory = [];
  bool timeZone = true;
  int? index;
  changeColor(int newIndex){
    index=newIndex;
    notifyListeners();
    if(index==0){

    }
  }



  String? startTime1='8:00';
  String? startTime2='10:00';
  String? startTime3='2:00';
  String? startTime4='4:34';
  String? startTime5='6:25';
  String? endTime1 = '9:30';
  String? endTime2 = '11:00';
  String? endTime3 = '3:45';
  String? endTime4 = '6:25';
  String? endTime5 = '7:30';

  String? selectedEndTime;
  String? selectedStartTime;
  String? appointmentTime;
  ConsultantModel? consultantModel;

  selectedConsultant(ConsultantModel? newConsultantModel){

    consultantModel=newConsultantModel;
    notifyListeners();
  }

  Stream<QuerySnapshot> getAppointmentStream(){
    return Collections.appointment.where("consultant.userId",isEqualTo:userController.consultant!.userId).snapshots();
  }

  changeSelectedDate(DateTime? sDate){
    selectedDate= sDate;
    notifyListeners();
  }
  //
  // selectedTimeSlot(AppointmentModel appointmentModel)async{
  //
  //   // selectedEndTime= endTime;
  //   // selectedStartTime=startTime;
  //   // appointmentTime='$selectedStartTime - $selectedEndTime';
  //   // print(appointmentTime);
  //   notifyListeners();
  //   await updateAppointment(appointmentModel);
  //
  // }

  updateAppointment(AppointmentModel appointmentModel)async{
  //  print(userController.patient!.lastName);
    print('k');
   // PatientModel? patientModel = PatientModel(firstName: userController.patient!.firstName,lastName: userController.patient!.lastName);
    //ConsultantModel? _consultantModel= ConsultantModel(firstName: consultantModel!.firstName,lastName: consultantModel!.firstName);

    // AppointmentModel _appointmentModel = AppointmentModel(
    //   appointmentDate: '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}',
    //   appointmentEnd: DateTime(
    //     selectedDate!.year,
    //     selectedDate!.month,
    //     selectedDate!.day,
    //     index==0?int.parse(hourController.text):(12+int.parse(hourController.text)),
    //     int.parse(minuteController.text),
    //
    //   ),
    //   appointmentStart: DateTime(
    //     selectedDate!.year,
    //     selectedDate!.month,
    //     selectedDate!.day,
    //     index==0?int.parse(hourController.text):(12+int.parse(hourController.text)),
    //     int.parse(minuteController.text),
    //
    //   ),
    //   appointmentId: appointmentModel.appointmentId,
    //   updates: [
    //    DateTime.now(),
    //   ],
    //   createdAt: DateTime.now(),
    //
    //   appointmentStartTime
    //       : '${hourController.text}-${minuteController.text}',
    //   patient:appointmentModel.patient,
    //   consultant:appointmentModel.consultant);
    // load = true;
    // notifyListeners();
    // print('lll');
    appointmentModel.appointmentStartTime = '${hourController.text}:${minuteController.text }${index  == 0? 'AM':'PM'}';
    DateTime oldStartTime = appointmentModel.appointmentStart!;
    appointmentModel.appointmentDate= '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}';
    appointmentModel.appointmentStart =  DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      index==0?int.parse(hourController.text):(12+int.parse(hourController.text)),
      int.parse(minuteController.text),
    );
    appointmentModel.appointmentEnd  =  appointmentModel.appointmentStart!.add(Duration(minutes: 30));
    appointmentModel.appointmentEndTime = '${appointmentModel.appointmentEnd!.hour}:${DateFormat('mm').format(appointmentModel.appointmentEnd!)}${index  == 0? 'AM':'PM'}';
   updateAppointmentCheck =  await AppointmentService.updateAppointment(appointmentModel);
   notifyListeners();
   load = false;
   notifyListeners();
   hourController.clear();
   minuteController.clear();
    await ConsultantService.sendEmail('You have updated your appointment from ${ DateFormat('MMM d, H:mm y').format(oldStartTime)} to ${ DateFormat('MMM d, H:mm y').format(appointmentModel.appointmentStart!)}');

    if(updateAppointmentCheck){
    // Navigator.pushNamed(navigatorKey!.currentContext!,ConfirmationScreen.id);
   }
  }
updateAppointmentReport(AppointmentModel appointmentModel)async{
  load = true;
  notifyListeners();
    appointmentModel.report = reportController.text.trim();
    appointmentModel.sessionEnded = true;
  updateAppointmentCheck =  await AppointmentService.updateAppointment(appointmentModel);
    load = false;
    notifyListeners();
}

 // List<String> appointmentTime =[  '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00','20:00','21:00'];

  init(){

  }
  fetchPatientMedicalHistory(String patientId)async{
    load = true;
    notifyListeners();
   appointmentHistory =  await AppointmentService.getPatientAppointmentHistory(patientId);

    load = false;
   notifyListeners();
  }


}
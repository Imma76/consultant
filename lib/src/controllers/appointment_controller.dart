
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant/src/collections/collection.dart';
import 'package:consultant/src/controllers/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/appointment_model.dart';
import '../models/consultant_model.dart';
import '../services/appointment_service.dart';

class AppointmentController extends ChangeNotifier{
  bool load = false;

  DateTime? selectedDate; bool updateAppointmentCheck=false;


  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();

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
    return Collections.appointment.snapshots();
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

    AppointmentModel _appointmentModel = AppointmentModel(
      appointmentDate: '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}',
      appointmentEnd: DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        index==0?int.parse(hourController.text):(12+int.parse(hourController.text)),
        int.parse(minuteController.text),

      ),
      appointmentStart: DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        index==0?int.parse(hourController.text):(12+int.parse(hourController.text)),
        int.parse(minuteController.text),

      ),
      appointmentId: appointmentModel.appointmentId,
      updates: [
       DateTime.now(),
      ],
      createdAt: DateTime.now(),

      appointmentTime: '${hourController.text}-${minuteController.text}',
      patient:appointmentModel.patient,
      consultant:appointmentModel.consultant);
    load = true;
    notifyListeners();
    print('lll');
   updateAppointmentCheck =  await AppointmentService.updateAppointment(_appointmentModel);
   notifyListeners();
   load = false;
   notifyListeners();
   hourController.clear();
   minuteController.clear();
   if(updateAppointmentCheck){
    // Navigator.pushNamed(navigatorKey!.currentContext!,ConfirmationScreen.id);
   }
  }


 // List<String> appointmentTime =[  '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00','20:00','21:00'];

  init(){

  }


}


import 'package:cloud_firestore/cloud_firestore.dart';

import '../collections/collection.dart';
import '../models/appointment_model.dart';

class AppointmentService{
  static Future updateAppointment(AppointmentModel appointmentModel)async{
    print('ooo');
    try{

      final create = await Collections.appointment.doc(appointmentModel.appointmentId.toString()).update(appointmentModel.toJson());

      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }
  static Future addReport()async{
    
  }
  static Future<List<AppointmentModel>?>? getPatientAppointmentHistory(String patientId)async{
    try{
      QuerySnapshot query = await Collections.appointment.where("patient.userId",isEqualTo:patientId).get();
      return query.docs.map((e)=> AppointmentModel.fromJson(e.data() as Map<String,dynamic>)).toList();
    }catch(e){
      return [];
    }
  }
}
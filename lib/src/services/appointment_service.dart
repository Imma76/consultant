

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
}
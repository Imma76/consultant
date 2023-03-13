

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant/src/models/patient_model.dart';

import 'consultant_model.dart';

class AppointmentModel{
  DateTime? appointmentStart;
  DateTime ? appointmentEnd;
  ConsultantModel? consultant;
  PatientModel? patient;
  List<String>? updates;
  DateTime? createdAt;
  String? appointmentDate;
  String? appointmentTime;
  AppointmentModel({this.patient,this.consultant,this.createdAt,this.appointmentDate
    ,this.appointmentEnd,this.appointmentStart,this.appointmentTime,this.updates,});

  AppointmentModel.fromJson(Map data){

    appointmentStart=Timestamp(data['appointmentStart'].seconds,data['appointmentStart'].nanoseconds).toDate();
    appointmentEnd=Timestamp(data['appointmentEnd'].seconds,data['appointmentEnd'].nanoseconds).toDate();
    appointmentDate=data['appointmentDate'];
    patient=PatientModel.fromJson(data['patient']);
    consultant=ConsultantModel.fromJson(data['consultant']);
    updates=data['updates'];
    createdAt=Timestamp(data['createdAt'].seconds,data['createdAt'].nanoseconds).toDate();
    appointmentTime=data['appointmentTime'];
  }

  Map<String,dynamic>toJson(){
    Map<String,dynamic> data={};
    data['appointmentStart']=appointmentStart;
    data['appointmentEnd']=appointmentEnd;
    data['appointmentDate']= appointmentDate;
    data['patient']=patient?.toJson();
    data['consultant'] =consultant?.toJson();
    data['updates'] =updates;
    data['createdAt']=createdAt;
    data['appointmentTime']=appointmentTime;
    return data;
  }
}
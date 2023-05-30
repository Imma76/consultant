

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant/src/models/patient_model.dart';

import 'consultant_model.dart';

class AppointmentModel{
  DateTime? appointmentStart;
  DateTime ? appointmentEnd;
  ConsultantModel? consultant;
  PatientModel? patient;
  List<DateTime>? updates;
  bool? sessionEnded;
  DateTime? createdAt;
  String? appointmentDate;
  String? appointmentStartTime;
  String? appointmentEndTime;
  String? appointmentId;
  String? report;
  AppointmentModel({this.patient,this.sessionEnded,this.consultant,this.createdAt,this.appointmentDate
    ,this.appointmentEnd,this.report,this.appointmentStart,this.appointmentStartTime,this.appointmentEndTime,this.updates,this.appointmentId});

  AppointmentModel.fromJson(Map data){

    appointmentStart=Timestamp(data['appointmentStart'].seconds,data['appointmentStart'].nanoseconds).toDate();
    appointmentEnd=Timestamp(data['appointmentEnd'].seconds,data['appointmentEnd'].nanoseconds).toDate();
    appointmentDate=data['appointmentDate'];
    patient=PatientModel.fromJson(data['patient']);
    consultant=ConsultantModel.fromJson(data['consultant']);
    report = data['report']??'';
    if(updates!=null)
      data['updates'].map((e){
        updates!.add(Timestamp(e.seconds,e.nanoseconds).toDate());
      });
    //updates=List<DateTime>.from(Timestamp(data['updates'].seconds,data['updates'].nanoseconds).toDate());
    createdAt=Timestamp(data['createdAt'].seconds,data['createdAt'].nanoseconds).toDate();
    appointmentStartTime=data['appointmentStartTime'];
    appointmentEndTime
    = data['appointmentEndTime'];
    sessionEnded = data['sessionEnded']??false;
    appointmentId=data['appointmentId'];
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
    data['appointmentStartTime'] = appointmentStartTime;
    data['appointmentEndTime'] = appointmentEndTime;
    data['appointmentId']=appointmentId;
    data['report'] = report;
    data['sessionEnded'] = sessionEnded;
    return data;
  }
}
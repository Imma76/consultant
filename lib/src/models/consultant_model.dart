import 'package:cloud_firestore/cloud_firestore.dart';

class ConsultantModel{

   String? userName;
  String? email;
  String? firstName;

  String? verificationStatus;
  String? lastName;
  String? age;
  String? phoneNumber;
  String? stateOfOrigin;
  String? gender;
  String? lga;
  String? residentialAddress;
  DateTime? createdAt;
  DateTime? verificationDate;
  String? userId;
  String? cv;
  String? areaOfSpecialty;
  String? medicalLicense;
  String? photoUrl;
  String?history;
  double? ratings;
  bool? isVerified;
  ConsultantModel({this.email,this.userName,this.lastName,this.userId,this.firstName,this.phoneNumber,this.areaOfSpecialty,this.cv
    ,this.createdAt,this.age,this.gender,this.history
  ,this.medicalLicense,this.photoUrl
  ,this.residentialAddress
  ,this.stateOfOrigin,this.lga,this.verificationStatus,this.ratings,this.isVerified,this.verificationDate });

  ConsultantModel.fromJson(Map<dynamic,dynamic> data){

    userName=data['userName'];
    email=data['email'];
    firstName=data['firstName'];
    verificationStatus=data['verificationStatus']??'';
    lastName=data['lastName'];
    age=data['age'];
    cv=data['url'];
    residentialAddress
    =data['residentialAddress'];
    gender=data['gender'];
    photoUrl=data['photoUrl'];
    history=data['history'];
    userId=data['userId'];
    lga=data['lga'];
    phoneNumber=data['phoneNumber'];
    ratings=data['ratings'];
    stateOfOrigin=data['stateOfOrigin'];
    isVerified =data['isVerified'];
    areaOfSpecialty=data['areaOfSpecialty'];
    if(data['verificationDate'] != null){
      verificationDate= Timestamp(data['verificationDate'].seconds,data['verificationDate'].nanoseconds).toDate();

    }
    // else{
    //   verificationDate = DateTime(2023, 7,10);
    // }

  }

  toJson(){
    Map<String,dynamic> data={};
     data['userName']=userName;
    data['email']=email;
    data['firstName']=firstName;
    data['lastName']=lastName;
    data['age']=age;

   data['cvUrl']= cv;
   data['medicalLicense']=medicalLicense;
    data['residentialAddress']=residentialAddress;
    data['gender']=gender;
   data['photoUrl']= photoUrl;
  data['history']=  history;
  data['userId']=  userId;
   data['lga']= lga;
    data['createdAt']=createdAt;
    data['phoneNumber']=phoneNumber;
    data['ratings']=ratings;
    data['stateOfOrigin']=stateOfOrigin;
    data['isVerified'] = isVerified;
    data['areaOfSpecialty']=areaOfSpecialty;
    data['verificationDate'] = verificationDate;
    return data;
  }
}
class Consultant{

  String? userName;
  String? email;
  String? firstName;
  String? lastName;
  String? age;
  String? phoneNumber;
  String? stateOfOrigin;
  String? gender;
  String? lga;
  String? residentialAddress;
  DateTime? createdAt;
  String? userId;
  String? cv;
  String? areaOfSpecialty;
  String? medicalLicense;
  String? photoUrl;
  String?history;
  Consultant({this.email,this.userName,this.lastName,this.userId,this.firstName,this.phoneNumber,this.areaOfSpecialty,this.cv
    ,this.createdAt,this.age,this.gender,this.history
  ,this.medicalLicense,this.photoUrl
  ,this.residentialAddress
  ,this.stateOfOrigin,this.lga});

  Consultant.fromJson(Map<dynamic,dynamic> data){
    userName=data['userName'];
    email=data['email'];
    firstName=data['firstName'];
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

  }

  toJson(){
    Map<String,dynamic> data={};
    data['userName']=userName;
    data['email']=email;
    data['firstName']=firstName;
    data['lastName']=lastName;
    data['age']=age;
   data['url']= cv;
    data['residentialAddress']=residentialAddress
    ;
    data['gender']=gender;
   data['photoUrl']= photoUrl;
  data['history']=  history;
  data['userId']=  userId;
   data['lga']= lga;
    data['createdAt']=createdAt;
    data['phoneNumber']=phoneNumber;
    return data;
  }
}
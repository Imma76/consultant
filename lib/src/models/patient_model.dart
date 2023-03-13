class PatientModel{

  String? userName;
  String? email;
  String? firstName;
  String? lastName;
  String? age;
  String? weight;
  String? height;
  String? gender;
  String? allergies;
  DateTime? createdAt;
  String? userId;
  String? medicalConditions;
  PatientModel({this.email,this.userName,this.lastName,this.userId,this.firstName,this.medicalConditions,this.allergies,this.height,this.createdAt,this.age,this.gender,this.weight});

  PatientModel.fromJson(Map<dynamic,dynamic> data){
    userName=data['userName'];
    email=data['email'];
    firstName=data['firstName'];
    lastName=data['lastName'];
    age=data['age'];
    weight=data['weight'];
    height=data['height'];
    gender=data['gender'];
    allergies=data['allergies'];
    medicalConditions=data['medicalConditions'];
    userId=data['userId'];
  }

   toJson(){
    Map<String,dynamic> data=<String, dynamic>{};
    data['userName']=userName;
    data['email']=email;
    data['firstName']=firstName;
    data['lastName']=lastName;
    data['age']=age;
    data['weight']=weight;
    data['height']=height;
    data['gender']=gender;
    data['allergies']=allergies;
    data['userId']=userId;
    data['createdAt']=createdAt;
    return data;
  }
}
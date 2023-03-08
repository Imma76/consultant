import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../collections/collection.dart';
import '../models/consultant_model.dart';
import '../utils/error_codes.dart';

class ConsultantService{
 static Future findPatient(String userName)async{
    try{
      QuerySnapshot user = await Collections.patientCollection.where(userName,isEqualTo:"userName").get();
      if(user.docs.isNotEmpty){
        final userData = user as Map<dynamic,dynamic>;
        return Consultant.fromJson(userData);
      }
      return null;

    }on SocketException{
      return null;
    } catch(e){
      return null;
    }
  }

 static Future findConsultantById(String userId)async{
   try{
     DocumentSnapshot
     user = await Collections.consultant.doc(userId).get();
     if(!user.exists){
       return null;
     }
       return Consultant.fromJson(user.data() as Map
       );

   }on SocketException{
     return null;
   } catch(e){
     return null;
   }
 }

 static Future createPatient(Consultant consultant)async{
   try{
     final user = await Collections.consultant.doc(consultant.userId).set(consultant.toJson());
     return true;
   }on SocketException {
     return null;
   } catch(e){
     print(e.toString());
     return null;
   }
 }
}
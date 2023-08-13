

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/consultant_model.dart';
import '../utils/error_codes.dart';
import '../utils/widgets/reusable_widget.dart';

class AuthService{

  Future resetPassword({String? email,})async{
    try{

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      return true;
    }on SocketException{
      return false;
    }on FirebaseAuthException catch(e){
      showToast(ErrorCodes.getFirebaseErrorMessage(e));
      return false;
    } catch(e){
      print(e.toString());
      return false;
    }
  }
  Future signIn({String? email,String? password})async{
    try{

      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.toString(), password: password.toString());
      return user.user;
    }on SocketException{
      return false;
    }on FirebaseAuthException catch(e){
      showToast(ErrorCodes.getFirebaseErrorMessage(e));

    } catch(e){
      print(e.toString());
      return false;
    }
  }




  Future signUp({String? email,String? password})async{
    try{

      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.toString(), password: password.toString());
      return user.user;
    }on SocketException{
      return false;
    } on FirebaseAuthException catch(e){
     showToast(ErrorCodes.getFirebaseErrorMessage(e));
  }catch(e){
      print(e.toString());
      return false;
    }
  }
}
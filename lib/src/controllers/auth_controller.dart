
import 'package:consultant/src/controllers/user_controller.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../models/consultant_model.dart';
import '../services/auth_service.dart';
import '../services/consultant_service.dart';
import '../utils/widgets/reusable_widget.dart';
import '../views/home/base.dart';

class AuthController extends ChangeNotifier{
  bool load = false;
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController lgaController= TextEditingController();
  TextEditingController specialtyController= TextEditingController();

  TextEditingController genderController= TextEditingController();
  TextEditingController surNameController= TextEditingController();
  TextEditingController firstNameController= TextEditingController();
  TextEditingController lastNameController= TextEditingController();
  TextEditingController ageController= TextEditingController();
  TextEditingController phoneNoController= TextEditingController();
  TextEditingController stateOfOriginController= TextEditingController();
  TextEditingController residentialAddressController= TextEditingController();
  TextEditingController historyController= TextEditingController();

  TextEditingController userNameController= TextEditingController();




  AuthService authService = AuthService();
  Future signIn(centralState)async{
   centralState.startLoading();
   print('hhhs${ centralState.isAppLoading}');

    final user=await authService.signIn(email: emailController.text.trim(),password: passwordController.text);
    if(user==null){
      centralState.stopLoading();
      return;
    }
   await userController.init();
   // if(login ){
   //   load=false;
   //   notifyListeners();
   //
   // }
  centralState.stopLoading();
   Navigator.pushNamedAndRemoveUntil(navigatorKey!
       .currentContext!, Base.id, (route) => false);

  }

  bool checkInputForSignUp(){
    if(surNameController.text.isEmpty){
      showToast('fill in surname');
      return false;;
    }
    if(firstNameController.text.isEmpty){
      showToast('fill in first name');
      return false;;
    }
    if(lastNameController.text.isEmpty){
      showToast('fill in last name');
      return false;;
    }
    if(emailController
        .text.isEmpty){
      showToast('fill in your email address');
      return false;;
    }
    if(genderController.text.isEmpty){
      showToast('fill in your gender');
      return false;;
    }
    if(ageController.text.isEmpty){
      showToast('fill in your age');
      return false;
    }
    if(passwordController.text.isEmpty){
      showToast('fill in your password');
      return false;
    }
    return true;
  }

  bool checkInputForSignIn(){
    if(emailController.text.isEmpty){
      showToast('fill in your email');
      return false;
    }
    if(passwordController.text.isEmpty){
      showToast('fill in your password');
      return false;
    }
    return true;
  }
  Future signUp(centralState)async{
    centralState.stopLoading();
    final user= await  authService.signUp(email: emailController.text.trim(),password: passwordController.text);

    if(user == null){
      centralState.stopLoading();
      return;
    }
    Consultant consultant =Consultant(
      email: emailController.text.trim(),
      userName: userNameController.text.trim(),
      history: historyController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      lga: lgaController.text.trim(),
      residentialAddress: residentialAddressController.text.trim(),
      phoneNumber: phoneNoController.text.trim(),
      medicalLicense:'',
      cv: '',
      stateOfOrigin: stateOfOriginController.text.trim(),
      photoUrl: '',
      createdAt: DateTime.now(),
      age:ageController.text.trim(),
      gender: genderController.text.trim(),
      userId:user.uid,
      areaOfSpecialty: specialtyController.text.trim(),
    );
   final createUser = await ConsultantService.createPatient(consultant);
    if(createUser  == null){
      centralState.stopLoading();
      return;
    }
    await userController.init();
    centralState.stopLoading();
    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(navigatorKey!
        .currentContext!, Base.id, (route) => false);
  }

}

import 'dart:io';

import 'package:consultant/src/controllers/file_controller.dart';
import 'package:consultant/src/controllers/user_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  FileController _fileController = FileController();
   XFile? imageFile;
  FilePickerResult? cvFile;
  FilePickerResult? medicalLicense;
  String? imageUrl ;
  String? cvUrl;
  String? medicalLicenseUrl ;

  clearController(){
    emailController
    .clear();
    passwordController.clear();
  }

  pickImage()async{
    imageFile= await _fileController.pickPhoto();
    notifyListeners();
  }
  pickCv()async{
    cvFile = await _fileController.pickCv();
    notifyListeners();
  }
  pickMedicalLicense()async{
    medicalLicense = await _fileController.pickMedicalLicense();
    notifyListeners();
  }


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
    if(phoneNoController.text.isEmpty){
      showToast('fill in mobile number');
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
    if(stateOfOriginController.text.isEmpty){
      showToast('fill in your state of origin');
      return false;
    }
    if(lgaController.text.isEmpty){
      showToast('fill in your local government');
      return false;
    }

    if(residentialAddressController.text.isEmpty){
      showToast('fill in your residential address');
      return false;
    }
    if(passwordController.text.isEmpty){
      showToast('fill in your password');
      return false;
    }
    if(specialtyController.text.isEmpty){
      showToast('fill in your specialty');
      return false;
    }

    if(historyController
        .text.isEmpty){
      showToast('fill in your history');
      return false;
    }
    // if(cvUrl ==null){
    //   showToast('upload your cv');
    //   return false;
    // }
    // if(medicalLicenseUrl ==null){
    //   showToast('upload your medical license');
    //   return false;
    // }
    // if(imageUrl ==null){
    // showToast('upload your image');
    // return false;
    // }
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

  uploadImage()async{
    print(imageFile);
    if(imageFile!=null){
      load = true;
      notifyListeners();
      imageUrl = await _fileController.uploadFileToDb(File(imageFile!.path),filePath: 'photo',fileName:
      imageFile!.name.toString());
      load = false;
      notifyListeners();
    }


  }
  uploadCv()async{
    if(cvFile!=null){
      load = true;
      notifyListeners();
      cvUrl=await _fileController.uploadFileToDb(File(cvFile!.files.single.path.toString()),filePath: 'cv',fileName: cvFile
      !.files
      .single.name);
      load = false;
      notifyListeners();
    }

  }
  uploadMedicalLicense()async{
    if(medicalLicense!=null){
      load = true;
      notifyListeners();

      medicalLicenseUrl  = await _fileController.uploadFileToDb(File(medicalLicense!.files.single.path.toString()),filePath: 'medicalLicence',fileName: medicalLicense!.files.single.name);
      load = false;
      notifyListeners();
    }

  }


  Future signUp(centralState)async{
    centralState;
    final user= await  authService.signUp(email: emailController.text.trim(),password: passwordController.text);

    if(user == null){
      centralState.stopLoading();
      return;
    }

    ConsultantModel consultant =ConsultantModel(
      email: emailController.text.trim(),
      userName: userNameController.text.trim(),
      history: historyController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      lga: lgaController.text.trim(),
      residentialAddress: residentialAddressController.text.trim(),
      phoneNumber: phoneNoController.text.trim(),
      medicalLicense:medicalLicenseUrl.toString(),
      cv: cvUrl.toString(),
      stateOfOrigin: stateOfOriginController.text.trim(),
      photoUrl: imageUrl.toString(),
      createdAt: DateTime.now(),
      age:ageController.text.trim(),
      gender: genderController.text.trim(),
      userId:user.uid,
      areaOfSpecialty: specialtyController.text.trim(),
    );
   final createUser = await ConsultantService.createConsultant(consultant);
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
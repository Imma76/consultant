
import 'dart:io';

import 'package:consultant/src/controllers/file_controller.dart';
import 'package:consultant/src/controllers/user_controller.dart';
import 'package:consultant/src/views/authentication/great_job.dart';
import 'package:consultant/src/views/authentication/verification_complete.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../collections/collection.dart';
import '../models/consultant_model.dart';
import '../services/auth_service.dart';
import '../services/consultant_service.dart';
import '../themes/app_theme.dart';
import '../utils/widgets/reusable_widget.dart';
import '../views/home/base.dart';

class AuthController extends ChangeNotifier{
  bool load = false;
  bool loadSignUp = false;
  bool loadPhoto = false;
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController lgaController= TextEditingController();
  TextEditingController specialtyController= TextEditingController();

  TextEditingController genderController= TextEditingController(text: '');
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

  changeGender (value) {
    genderController.text =value!;
    notifyListeners();
    notifyListeners();
  }


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
   final patientMail = await ConsultantService.findConsultantByEmail(user.email);
   if(patientMail == null){
     showToast("account does not exist");
     return;
   }
   await userController.init();
   // if(login ){
   //   load=false;
   //   notifyListeners();
   //
   // }


   if(userController.consultant!= null){
     if(userController.consultant!.verificationStatus == 'banned' || userController.consultant!.verificationStatus=='restricted') {



       showDialog(context: navigatorKey.currentState!.context, builder: (context){
         return Dialog(
           backgroundColor:
           AppTheme.white
           ,
           child: Container(
             decoration: BoxDecoration(   color:
             AppTheme.white,borderRadius: BorderRadius.circular(10.r)),
             height:
             165.h,
             width: 390.w,

             child: Column(
               children: [
                 Gap(22.h),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text('Your Account has been ${userController.consultant!.verificationStatus} by the admin ',textAlign: TextAlign.center,style: GoogleFonts.dmSans(
                       color: AppTheme.lightBlack,
                       fontSize: 16.sp,
                       fontWeight: FontWeight.w500),),
                 ),

                 Gap(24.h),
                 ElevatedButton(onPressed: () async{
                   print('rating');
                   Navigator.pop(context);
                 },
                   child: Text('Okay', style: GoogleFonts.poppins(
                       color: AppTheme.white,
                       fontSize: 20.sp,
                       fontWeight: FontWeight.w700),),
                   style: ElevatedButton.styleFrom(primary: AppTheme.primary,
                       minimumSize: Size(108.w, 52.h),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
               ],
             ),
           ),

         );
       });
       centralState.stopLoading();
       return;
     }
   }
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
    if(cvUrl ==null){
      showToast('upload your cv');
      return false;
    }
    if(medicalLicenseUrl ==null){
      showToast('upload your medical license');
      return false;
    }
    if(imageUrl ==null){
    showToast('upload your photo');
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

  uploadImage()async{
    print(imageFile);
    if(imageFile!=null){
      loadPhoto = true;
      notifyListeners();
      imageUrl = await _fileController.uploadFileToDb(File(imageFile!.path),filePath: 'photo',fileName:
      imageFile!.name.toString());
      loadPhoto = false;
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
  Future resetPassword(centralState)async{
    if(emailController.text.isEmpty){
      showToast("Enter your email");
      return;
    }
    centralState.startLoading();

    final getEmailAddress = await ConsultantService.findConsultantByEmail(emailController.text.trim());
    if(getEmailAddress == null){
      showToast("User does not exist");
      centralState.stopLoading();
      return;
    }



    final user=await authService.resetPassword(email: emailController.text.trim(),);
    if(user==null){
      centralState.stopLoading();
      return;
    }

    centralState.stopLoading();
    showDialog(context: navigatorKey!
        .currentContext!, builder: (context) {
      return Dialog(
        backgroundColor:
        AppTheme.white
        ,
        child: Container(
          decoration: BoxDecoration(color:
          AppTheme.white, borderRadius: BorderRadius.circular(10.r)),
          height:
          150.h,
          width: 382.w,

          child: Column(
            children: [
              Gap(22.h),
              Center(
                child: Text('Password reset link has been sent to your email',textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                      color: AppTheme.lightBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),),
              ),
              Gap(24.h),

              ElevatedButton(onPressed: () async {
                Navigator.pop(context);
                Navigator.pop(navigatorKey!
                    .currentContext!,);
              },
                child: Text('Okay', style: GoogleFonts.poppins(
                    color: AppTheme.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),),
                style: ElevatedButton.styleFrom(primary: AppTheme.primary,
                    minimumSize: Size(108.w, 48.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),),
            ],
          ),
        ),

      );
    });



  }



  Future signUp(centralState)async{
    //centralState.startLoading();
    loadSignUp = true;
    notifyListeners();
    final user= await  authService.signUp(email: emailController.text.trim(),password: passwordController.text);

    if(user == null){
     // centralState.stopLoading();
      loadSignUp = false;
      notifyListeners();
      return;
    }
    final checkUser = await ConsultantService.findConsultantByEmail(emailController.text.trim());
    if(checkUser != null){
      showToast("user exist already");
     // centralState.stopLoading();
      loadSignUp = false;
      notifyListeners();
      return;
    }
    DateTime now = DateTime.now();

    ConsultantModel consultant =ConsultantModel(
      email: emailController.text.trim(),
      userName: userNameController.text.trim(),
      history: historyController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      lga: lgaController.text.trim(),

      verificationStatus: '',
      residentialAddress: residentialAddressController.text.trim(),
      phoneNumber: phoneNoController.text.trim(),
      medicalLicense:medicalLicenseUrl.toString(),
      cv: cvUrl.toString(),
      stateOfOrigin: stateOfOriginController.text.trim(),
      photoUrl: imageUrl.toString(),
      createdAt: DateTime.now(),
      age:ageController.text.trim(),
      gender: genderController.text.trim(),
      userId:user.uid,ratings: 0,
      areaOfSpecialty: specialtyController.text.trim(),
      isVerified: false,
      verificationDate: now.add(Duration(days: 5,)),
    );
   final createUser = await ConsultantService.createConsultant(consultant);
    if(createUser  == null){
     // centralState.stopLoading();
      loadSignUp = false;
      notifyListeners();
      return;
    }
    await userController.init2();
    await ConsultantService.sendEmail('Welcome to consult, Your account has been created successfully');
   // centralState.stopLoading();
    loadSignUp = false;
    notifyListeners();
    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(navigatorKey!
        .currentContext!, GreatJob.id, (route) => false);
  }



  int sent = 0;

  checkIfConsultantIsVerified(centralState,bool isVerified)async{
    centralState.startLoading();
    notifyListeners();
    if(isVerified== true && FirebaseAuth.instance.currentUser!.emailVerified == false){
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      sent = 1;
      notifyListeners();
      Navigator.pushNamedAndRemoveUntil(navigatorKey!
          .currentContext!, VerificationComplete.id, (route) => false);
    }

    centralState.stopLoading();
    notifyListeners();

  }
  updateConsultant(centralState)async{


    if(DateTime.now().isAfter(userController.consultant!.verificationDate!)){
      centralState.startLoading();
      await Collections.consultant.doc(FirebaseAuth
          .instance.currentUser
      !.uid).update({"isVerified":true});

      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      centralState.stopLoading();
      Navigator.pushNamedAndRemoveUntil(navigatorKey!
          .currentContext!, VerificationComplete.id, (route) => false);
    }

    bool isVerified = false;

    checkVerification(centralState)async{
      load = true;
      notifyListeners();
      if(centralState.user.emailVerified){
        Navigator.pushNamedAndRemoveUntil(navigatorKey!
            .currentContext!, Base.id, (route) => false);
      }
    }


  }

}
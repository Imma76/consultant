


import 'package:consultant/src/views/appointments/appointments.dart';
import 'package:consultant/src/views/authentication/confirmation_screen.dart';
import 'package:consultant/src/views/authentication/count_down_page.dart';
import 'package:consultant/src/views/authentication/great_job.dart';
import 'package:consultant/src/views/authentication/verification_complete.dart';
import 'package:consultant/src/views/patient/patient_history.dart';
import 'package:flutter/material.dart';

import '../views/authentication/login.dart';
import '../views/authentication/sign_up.dart';
import '../views/home/base.dart';
import '../views/home/home_page.dart';
import '../views/welcome.dart';

Map<String,WidgetBuilder>routes={
  WelcomeScreen.id:(context)=> WelcomeScreen(),
  LoginScreen.id:(context)=>LoginScreen(),
  SignUpScreen.id:(context)=>SignUpScreen(),
  Homepage.id:(context)=>Homepage(),
  GreatJob.id:(context)=>GreatJob(),
  ConfirmationScreen.id:(context)=>ConfirmationScreen(),
  Base.id:(context)=>Base(),
  Appointments.id:(context)=>Appointments(),
  PatientMedicalHistory.id:(context)=>PatientMedicalHistory(),
  VerificationComplete.id:(context)=>VerificationComplete(),
  CountDownPage.id:(context)=> CountDownPage()


};



import 'package:consultant/src/views/authentication/great_job.dart';
import 'package:flutter/material.dart';

import '../views/authentication/login.dart';
import '../views/authentication/sign_up.dart';
import '../views/home/home_page.dart';
import '../views/welcome.dart';

Map<String,WidgetBuilder>routes={
  WelcomeScreen.id:(context)=> WelcomeScreen(),
  LoginScreen.id:(context)=>LoginScreen(),
  SignUpScreen.id:(context)=>SignUpScreen(),
  Homepage.id:(context)=>Homepage(),
  GreatJob.id:(context)=>GreatJob()

};
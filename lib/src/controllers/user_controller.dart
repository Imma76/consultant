
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/consultant_model.dart';
import '../services/consultant_service.dart';
import 'central_state.dart';

class UserController extends ChangeNotifier{

 ConsultantModel? consultant;
  init()async{

    centralState.startLoading();
    consultant= await ConsultantService.findConsultantById(FirebaseAuth
       .instance.currentUser
   !.uid);
    print('consultant${consultant}');

   centralState.stopLoading();

   notifyListeners();
  }

}

UserController userController = UserController();
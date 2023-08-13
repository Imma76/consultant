
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
 init2()async{


   consultant= await ConsultantService.findConsultantById(FirebaseAuth
       .instance.currentUser
   !.uid);
   print('consultant${consultant}');



   notifyListeners();
 }
 List<ConsultantModel> consultantList = [];
 List<ConsultantModel> consultantListSearchable = [];

 getAllConsultant(){
   ConsultantService.getConsultant()!.listen((event) {
     consultantList.clear();
     event.forEach((element) => consultantList!.add(element));
     print(consultantList);
     notifyListeners();
     onSearchForConsultants(searchString!);
     notifyListeners();

   });
 }
 String? searchString = '';
 onSearchForConsultants(String search) {
   searchString = search.toLowerCase();
   notifyListeners();

   consultantListSearchable.clear();
   if (searchString == '' ||  searchString == null) {
     print(consultantList);
     consultantList!.forEach(
             (ConsultantModel element) =>consultantListSearchable.add(element));
     notifyListeners();
   } else {
     consultantList
     !.forEach((ConsultantModel? consultantModel) {

       if (consultantModel
       !.firstName!
           .toLowerCase()
           .contains(searchString!) || consultantModel!.lastName!
           .toLowerCase()
           .contains(searchString!)) {
         consultantListSearchable.add(consultantModel!);
         notifyListeners();
       }

     });
   }
 }

}

UserController userController = UserController();
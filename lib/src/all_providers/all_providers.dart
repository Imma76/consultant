



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/auth_controller.dart';
import '../controllers/central_state.dart';
import '../controllers/user_controller.dart';

//
// final centralProvider = ChangeNotifierProvider((ref) {
//
//   User? user;
//
//   bool isUserPresent = false;
//   bool isAppLoading=false;
//   bool isPhoneVerified=false;
//   bool? isFirstTime = true;
//
//   print(isUserPresent);
//
//   // Connect to an API using sockets, and decode the output
//      FirebaseAuth.instance.authStateChanges();
//
//
//
//
//   //       .listen((User? firebaseUser) async* {
//   //   if (firebaseUser != null) {
//   //     isAppLoading = true;
//   //     user = firebaseUser;
//   //    // notifyListeners();
//   //     print(user);
//   //     isUserPresent = (user != null);
//   //     print(isUserPresent);
//   //    yield user;
//   //    // notifyListeners();
//   //
//   //     // if (isUserPresent) {
//   //     //   isPhoneVerified =
//   //     //   !(user!.phoneNumber == null || user!.phoneNumber == '');
//   //     //   // add logs
//   //     //   // Status _response = await AdminApi()
//   //     //   //     .checkIfAdminIsLinkedToSalonPhone(user!.uid, user!.phoneNumber);
//   //     //
//   //     //   //.  isAdminLinkedToSalon = (_response == Status.success);
//   //     // }
//   //     isAppLoading = false;
//   //     Future.delayed(Duration(seconds: 3),(){
//   //       print('iiiiii');
//   //       isUserPresent =  true;
//   //    //   notifyListeners();
//   //
//   //     });
//   //   } else{
//   //   //  debugPrint('user is null prod');
//   //     isUserPresent = false;
//   //     user = null;
//   //     isAppLoading = false;
//   //    // notifyListeners();
//   //   }
//   //
//   // });
// });

final centralProvider = ChangeNotifierProvider<CentralState>((ref) =>CentralState());
final userProvider = ChangeNotifierProvider<UserController
>((ref) => UserController());
final authProvider = ChangeNotifierProvider<AuthController>((ref) => AuthController());
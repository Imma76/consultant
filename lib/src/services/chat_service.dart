
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant/src/controllers/user_controller.dart';
import 'package:intl/intl.dart';


class FirebaseMessageService{
  static Future sendMessage({required String message, required String user, required String receiver, required String receiverNo})async{
    await FirebaseFirestore.instance.collection('users').doc(userController.consultant!.email).collection('Dr${userController.consultant!.firstName} messaged').add({'message':message, 'user':user, 'receiver':receiver});
    await FirebaseFirestore.instance.collection('users').doc(receiverNo).collection('$receiver got messaged').add({'message':message,  'sender':user});
  }
  static Future getMessages({required String user})async{
    await FirebaseFirestore.instance.collection('users').doc(user).collection('$user got messaged from').snapshots();
  }

  static Future createChatRoom(var users, data)async{
    await FirebaseFirestore.instance.collection('chatroom').doc(users).set(data).onError((error, stackTrace) => print(error.toString()));
  }
  static  addConversationMessages(var chatRoomId, var message)async{
    await FirebaseFirestore.instance.collection('chatroom').doc(chatRoomId).collection('chats').add({'message':message,
      'sendBy':'${userController.consultant!.firstName}','time':DateTime.now()}).catchError((error)=>print(error)) ;
  }
  static  getConversationMessages(var chatRoomId,){
    return   FirebaseFirestore.instance.collection('chatroom').doc(chatRoomId).collection('chats').orderBy('time', descending:false ).snapshots().handleError((e)=>print(e)) ;
  }
  static Stream<QuerySnapshot> getChatRooms(String username){
    return  FirebaseFirestore.instance.collection('chatroom').where("users",arrayContains: username).snapshots().handleError((e)=>print(e));

  }
}

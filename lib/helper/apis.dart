// /*
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tap_social/constant/service_locator.dart';
// import 'package:tap_social/network/apiService.dart';
// import 'package:tap_social/notifications.dart';
// import 'package:tap_social/persistance/shared_preference_helper.dart';
//
// import '../models/chat_user.dart';
// import '../models/message.dart';
// import '../persistance/preferences.dart';
// // import 'notification_access_token.dart';
//
// class APIs {
//   // for authentication
//   static FirebaseAuth get auth => FirebaseAuth.instance;
//
//   static SharedPreferenceHelper? sharedPreferenceHelper;
//   // for accessing cloud firestore database
//   static FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   // for accessing firebase storage
//   static FirebaseStorage storage = FirebaseStorage.instance;
//
//   // for storing self information
//   static ChatUser me = ChatUser(
//       id: user.uid,
//       name: user.displayName.toString(),
//       email: user.email.toString(),
//       about: "Hey, I'm using We Chat!",
//       image: user.photoURL.toString(),
//       createdAt: '',
//       isOnline: false,
//       lastActive: '',
//       pushToken: '');
//
//   // to return current user
//   static User get user => auth.currentUser!;
//
//   // for accessing firebase messaging (Push Notification)
//   static FirebaseMessaging fMessaging = FirebaseMessaging.instance;
//
//   // for getting firebase messaging token
//
//   static Future<void> getFirebaseMessagingToken() async {
//     await fMessaging.requestPermission();
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await fMessaging.getToken().then((t) {
//       if (t != null) {
//         me.pushToken = t;
//
//         log('Push Token: $t');
//
//         sharedPreferences.setString(Preferences.fcmToken, t);
//         log("Getttt ${getIt<SharedPreferenceHelper>().getFcmToken}");
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       log('Got a onMessageOpenedApp whilst in the foreground!');
//       log('onMessageOpenedApp data: ${message.data}');
//       if (message.notification != null) {
//         log('Message onMessageOpenedApp also contained a notification: ${message.notification!.title}');
//       }
//     });
//
//     // for handling foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       log('Got a message whilst in the foreground!');
//       log('Message data: ${message.data}');
//       if (message.notification != null) {
//         // NotificationService.showNotification(message);
//         // _showNotification(message.notification!.title.toString(),
//         //     message.notification!.body.toString());
//         log('Message also contained a notification: ${message.notification!.body}');
//       }
//     });
//   }
//
//   static void _showNotification(String title, String body) async {
//     log("_showNotification");
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id', // Change this to your channel ID
//       'Your channel name', // Change this to your channel name
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0, // Notification ID
//       title, // Notification title
//       body, // Notification body
//       platformChannelSpecifics,
//       payload: 'item x',
//     );
//   }
//
//   // for sending push notification (Updated Codes)
//   static Future<void> sendPushNotification(
//       String msg, title, String token) async {
//     getFirebaseMessagingToken();
//     try {
//       // final body = {
//       //   "message": {
//       //     "token": chatUser.pushToken,
//       //     "notification": {
//       //       "title": me.name, //our name should be send
//       //       "body": msg,
//       //     },
//       //   }
//       // };
//
//       final body = {
//         "to": token,
//         // "ecSy87aaQk-F7hiGzS3CJB:APA91bGEQ_LeE4EL0N0dC-2gJhXz3S8JzpvYd5NRZeRu9Rn4hIprI688Zqflgfll8acEdOh0DsN9aUI9R4oyEay8WId-qn3HHKy_KY-jCCMlwN0ZTNVtuxTEmFW9Xp35bVlY-he_dXK2",
//         "notification": {
//           "title": title, //our name should be send
//           "body": msg,
//           "android_channel_id": "chats"
//         },
//         // "data": {
//         //   "some_data": "User ID: ${me.id}",
//         // }
//       };
//       // Firebase Project > Project Settings > General Tab > Project ID
//       const projectID = 'chatappwithfirebase-3e539';
//
//       log("body $body");
//       // get firebase admin token
//       // final bearerToken = await NotificationAccessToken.getToken;
//
//       // log('bearerToken: $bearerToken');
//
//       // handle null token
//       // if (bearerToken == null) return;
//
//       var res = await post(
//         Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//           // HttpHeaders.authorizationHeader:
//           //     "Bearer ya29.c.c0AY_VpZiyohidDEGrrR59OWrf32qqc_TW_8GklooPdHZg2JLv9Kpo17QS3qcaXPfWvSYcrAXWRjjuxwXWuja_g0-B5EWBdsUzk586Moq92785pNOdEPMXz-VKVifYSm62-3CBdChp_9mAp75eZVlLonIeUhpPSYNbBugv9hNil9DQvFjyTW3iQwEGm7ibli-oXBtJ0yk6q8WOVLLMhUkmtQzU6-UNWbEQ2QQO9xiP5CwCPqu8G110MKyDd5Hye_WbCTxkOn2Vf4M_1sZz2p86SpkgflaEMtC5cIN_S8DMd_eZfy4h1aIsH_4JQmwR8BpE_o6BknK_8MlmP0XkAa8MJ9-x1EzoCq0mqCiUZZpceOYofkJ6vVcEPijEtwG387Kaim-l-V_SRJjyMyVkJlw9uzpvu91SSl0hX1XOVuv444xpU_etnVXFqaz0wu9tSFUerf6exnQ2Uahnv3ykXbd43g9Ixnq-mizaiVmJhhtOwbv28WeUzj4azJSYQ_Igp4qskY-jh0oa2Wk5_ak0_yU9inU_XFZfUd3YBb7Q23Sdi5WVeVtuQIRcF8l9rxbuBptd3ovtqc1SoSyqiiIB2QFjWqb5U8h4Ry2OrsvxQg8WR0pFb9zjRB6Ije4g4tx5xnulbqFxqQJsd9SSSRw2f08ZUOmhWYqfFVuxaJw8qj7UQ_9pBBrz77eyVcr2JgxiR9Vd4flmmJjVeBfWZ8ZkiQ8c1-ymhuFM1scdBxiryai81-2aRUFXMO5kaqunBZ2wdmbl0vx1O6Smnn8RZ3VIdcqcInVYi3vjkYukeFfM5IXUhr-ObveQMkMoS_x7sutsOxl8F7xptwW7lkuIc5pXQvFtyJvokURwX4BY7-q89zJyMqY-v9o1dvrVyxJBdyjOj2itrr9Ikkl0xMmSSu1tFnY5c_3r-U3k87W_cnMXUixQnZkti_Z2lSd4eIgzBjV52B3W89nhi-r63rMmjWZFSpzekX43iIeQ17p9dJ-s_w2iVOk-hpaBRUZrreM"
//           HttpHeaders.authorizationHeader:
//               'key=AAAA-yf8Jes:APA91bE5uehVCaRCcDfdw_v1YPl7wYET2LQzij8I5JIkOdso39IhPkNhQ4j7u98XODgvSvP1VMvCt2TjzWOZVz9I_cvUGk6NmSmwaGvysd6dKwa6giQTBnaunYvPsDWrk88VpIMlv_gn'
//         },
//         body: jsonEncode(body),
//       );
//
//       log('Response status: ${res.statusCode}');
//       log('Response body: ${res.body}');
//     } catch (e) {
//       log('sendPushNotificationE: $e');
//     }
//   }
//
//   // for checking if user exists or not?
//   static Future<bool> userExists() async {
//     return (await firestore.collection('users').doc(user.uid).get()).exists;
//   }
//
//   // for adding an chat user for our conversation
//   static Future<bool> addChatUser(String email) async {
//     final data = await firestore
//         .collection('users')
//         .where('email', isEqualTo: email)
//         .get();
//
//     log('data: ${data.docs.length}');
//
//     if (data.docs.isNotEmpty && data.docs.first.id != user.uid) {
//       //user exists
//
//       log('user exists: ${data.docs.first.data()}');
//
//       firestore
//           .collection('users')
//           .doc(user.uid)
//           .collection('my_users')
//           .doc(data.docs.first.id)
//           .set({});
//
//       return true;
//     } else {
//       //user doesn't exists
//
//       return false;
//     }
//   }
//
//   // for getting current user info
//   static Future<void> getSelfInfo() async {
//     await firestore.collection('users').doc(user.uid).get().then((user) async {
//       if (user.exists) {
//         me = ChatUser.fromJson(user.data()!);
//
//         log("meeee ${me.email}");
//         await getFirebaseMessagingToken();
//
//         //for setting user status to active
//         APIs.updateActiveStatus(true);
//         log('My Data: ${user.data()}');
//       } else {
//         log("meeee ew ${me.email}");
//         await createUser().then((value) => getSelfInfo());
//       }
//     });
//   }
//
//   static Future<void> createUser() async {
//     final time = DateTime.now().millisecondsSinceEpoch.toString();
//
//     final chatUser = ChatUser(
//         id: user.uid,
//         name: user.displayName.toString(),
//         email: user.email.toString(),
//         about: "Hey, I'm using We Chat!",
//         image: user.photoURL.toString(),
//         createdAt: time,
//         isOnline: false,
//         lastActive: time,
//         pushToken: '');
//
//     return await firestore
//         .collection('users')
//         .doc(user.uid)
//         .set(chatUser.toJson());
//   }
//
//   // for getting id's of known users from firestore database
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getMyUsersId() {
//     return firestore
//         .collection('users')
//         .doc(user.uid)
//         .collection('my_users')
//         .snapshots();
//   }
//
//   // for getting all users from firestore database
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(
//       List<String> userIds) {
//     log('\nUserIds: $userIds');
//
//     return firestore
//         .collection('users')
//         .where('id',
//             whereIn: userIds.isEmpty
//                 ? ['']
//                 : userIds) //because empty list throws an error
//         // .where('id', isNotEqualTo: user.uid)
//         .snapshots();
//   }
//
//   // // for adding an user to my user when first message is send
//   // static Future<void> sendFirstMessage(
//   //     ChatUser chatUser, String msg, Type type) async {
//   //   await firestore
//   //       .collection('users')
//   //       .doc(chatUser.id)
//   //       .collection('my_users')
//   //       .doc(user.uid)
//   //       .set({}).then((value) => sendMessage(chatUser, msg, type));
//   // }
//
//   // for updating user information
//   static Future<void> updateUserInfo() async {
//     await firestore.collection('users').doc(user.uid).update({
//       'name': me.name,
//       'about': me.about,
//     });
//   }
//
//   // update profile picture of user
//   static Future<void> updateProfilePicture(File file) async {
//     //getting image file extension
//     final ext = file.path.split('.').last;
//     log('Extension: $ext');
//
//     //storage file ref with path
//     final ref = storage.ref().child('profile_pictures/${user.uid}.$ext');
//
//     //uploading image
//     await ref
//         .putFile(file, SettableMetadata(contentType: 'image/$ext'))
//         .then((p0) {
//       log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
//     });
//
//     //updating image in firestore database
//     me.image = await ref.getDownloadURL();
//     await firestore
//         .collection('users')
//         .doc(user.uid)
//         .update({'image': me.image});
//   }
//
//   // for getting specific user info
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
//       String chatUser) {
//     return firestore
//         .collection('users')
//         .where('id', isEqualTo: chatUser)
//         .snapshots();
//   }
//
//   // update online or last active status of user
//   static Future<void> updateActiveStatus(bool isOnline) async {
//     firestore.collection('users').doc(user.uid).update({
//       'is_online': isOnline,
//       'last_active': DateTime.now().millisecondsSinceEpoch.toString(),
//       'push_token': me.pushToken,
//     });
//   }
//
//   ///************** Chat Screen Related APIs **************
//
//   // chats (collection) --> conversation_id (doc) --> messages (collection) --> message (doc)
//
//   // useful for getting conversation id
//   static String getConversationID(String id) => user.uid.hashCode <= id.hashCode
//       ? '${user.uid}_$id'
//       : '${id}_${user.uid}';
//
//   // for getting all messages of a specific conversation from firestore database
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
//       String user) {
//     return firestore
//         .collection('chats/$user/messages/')
//         .orderBy('sent', descending: true)
//         .snapshots();
//   }
//
//   // for sending message
//   static Future<void> sendMessage(
//       String msg, String type, String toId, String title, String token) async {
//     //message sending time (also used as id)
//
//     logger.w("======= Push Token =========");
//     logger.w("======= $token =========");
//
//     logger.w("======= Push Token =========");
//
//     final time = DateTime.now().millisecondsSinceEpoch.toString();
//     final time2 = DateTime.now();
//
//     log("timeerer $time");
//
//     log("to idd $toId");
//     log("frim idd ${getIt<SharedPreferenceHelper>().getUserId}");
//
//     //message to send
//     final Messages message = Messages(
//         toId: toId, //161
//         msg: msg,
//         type: type,
//         fromId: getIt<SharedPreferenceHelper>().getUserId, //382
//         sent: time,
//         time: time2.toString(),
//         pushToken: getIt<SharedPreferenceHelper>().getFcmToken);
//
//     log("messsa  sendMessage ${message.fromId}");
//     final ref = firestore.collection(
//         'chats/${getIt<SharedPreferenceHelper>().getUserId}/messages/');
//     await ref
//         .doc(time)
//         .set(message.toJson())
//         .then((value) => sendPushNotification(msg, title, token));
//   }
//
//   //update read status of message
//   static Future<void> updateMessageReadStatus(Messages message) async {
//     firestore
//         .collection('chats/${getConversationID(message.fromId)}/messages/')
//         .doc(message.sent)
//         .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
//   }
//
//   //get only last message of a specific chat
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
//       ChatUser user) {
//     return firestore
//         .collection('chats/${getConversationID(user.id)}/messages/')
//         .orderBy('sent', descending: true)
//         .limit(1)
//         .snapshots();
//   }
//
//   //delete message
//   static Future<void> deleteMessage(Messages message) async {
//     await firestore
//         .collection('chats/${getConversationID(message.toId)}/messages/')
//         .doc(message.sent)
//         .delete();
//
//     if (message.type == Type.image) {
//       await storage.refFromURL(message.msg).delete();
//     }
//   }
//
//   //update message
//   static Future<void> updateMessage(Messages message, String updatedMsg) async {
//     await firestore
//         .collection('chats/${getConversationID(message.toId)}/messages/')
//         .doc(message.sent)
//         .update({'msg': updatedMsg});
//   }
// }
// */

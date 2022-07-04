import 'package:firebase_messaging/firebase_messaging.dart';

import '../../storage/app_storage.dart';

//Firebase Cloud Messaging
class FCMService {
  Future<String?> getTokenDevice(AppStorage appStorage) async {
    try {
      String? token = await appStorage.getFcmToken();
      if (token == null || token.isEmpty) {
        final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
        String vapidKey = '';
        String? tokenMess = await _firebaseMessaging.getToken(vapidKey: vapidKey);
        if (tokenMess == null || tokenMess.isEmpty) {
          return null;
        } else {
          appStorage.saveFcmToken(tokenMess);
          return tokenMess;
        }
      } else {
        return '';
      }
    } catch (e) {
      // ignore: avoid_print
      print('Firebase error ${e.toString()}');
      return '';
    }
  }
}

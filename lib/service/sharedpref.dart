import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app_user/service/repository.dart';

class Sharedpref {
  static FirebaseMessaging fMessage = FirebaseMessaging.instance;
  Sharedpref._();
  static final Sharedpref _instence = Sharedpref._();
  static Sharedpref get instence => _instence;

  static const String email = 'email';
  static const String password = 'password';
  static const String userid = 'userid';
  static const String token = 'token';
  late SharedPreferences sharedpref;

  initeStorage() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  setAuthDetaials(String emails, String passwords) async {
    await sharedpref.setString(email, emails);
    await sharedpref.setString(password, passwords);
  }

  setToken(String userToken) async {
    await sharedpref.setString(token, userToken);
  }

  getToken() {
    String? tokens = sharedpref.getString(token);
    if (tokens != null) {
      return tokens;
    }
    return null;
  }

  addUserId(int id) async {
    await sharedpref.setInt(userid, id);
  }

  signout() async {
    var disabled =
        await Repo.disablePushNotifications(sharedpref.getInt(userid)!);
    if (disabled) {
      sharedpref.remove(email);
      sharedpref.remove(password);
      sharedpref.remove(userid);
    }
    await fMessage.deleteToken();

    // Disable Firebase Messaging
    await fMessage.setAutoInitEnabled(false);
    sharedpref.remove(email);
    sharedpref.remove(password);
    sharedpref.remove(userid);
    
  }

  getId() {
    int? id = sharedpref.getInt(userid);
    if (id != null) {
      return id;
    }
    return null;
  }

  Map<String, dynamic>? getAuthDetails() {
    String? emails = sharedpref.getString(email);
    String? passwords = sharedpref.getString(password);
    if (emails == null || passwords == null) return null;
    Map<String, dynamic> authDetails = {
      'email': emails,
      'password': passwords,
    };
    return authDetails;
  }
}

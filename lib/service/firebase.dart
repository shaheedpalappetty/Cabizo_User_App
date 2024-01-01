import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app_user/service/repository.dart';
import 'package:taxi_app_user/service/sharedpref.dart';

class FirebaseHelper {
  static FirebaseMessaging fMessage = FirebaseMessaging.instance;
  static bool added = false;

  static Future<void> getFirebaseMessagingToken() async {
    await fMessage.requestPermission();

    int id = Sharedpref.instence.getId();

    await fMessage.getToken().then((t) async {
      if (t != null) {
        // print("your token is here =========$t");
        await Sharedpref.instence.setToken(t);
      }
    });
    // print("this your id========${id}");
    // print("this you token get=======${Sharedpref.instence.getToken()}");
    added = await Repo.addTokenToDB(id, await Sharedpref.instence.getToken());
  }

  static Future<void> sendPushNotification(
      String pickupName,
      String dropOffName,
      String drivertoken,
      LatLng pickUp,
      LatLng dropOff) async {
    String token = Sharedpref.instence.getToken();
    final sharedAuth = Sharedpref.instence.getAuthDetails();
    String username = await sharedAuth!['email'];
    int id = await Sharedpref.instence.getId();
    final body = {
      "to": drivertoken,
      "notification": {
        "title": "New Ride Request",
        "body": "Are you ready for this Ride?"
      },
      "data": {
        "pickup": pickupName,
        "dropOff": dropOffName,
        "username": username,
        "userid": id,
        "token": token,
        "pickupLat": pickUp.latitude,
        "pickupLang": pickUp.longitude,
        "dropoffLat": dropOff.latitude,
        "dropoffLang": dropOff.longitude,
        "status": "failed"
      }
    };
    const url = 'https://fcm.googleapis.com/fcm/send';

    await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "key=AAAAOd8TloI:APA91bFR5DQqeZ4sK3pKmCDVG2gycpvL-0k3P37vFfc8dGGiBmTk6etbnucQJJZG2hfdYx_em93yVIcaJFeDWl2QxXYdJurwnE-YvIGmxp5K0Z7zbbYlmCdCsRpxdF0-Et5sHjkzhcjd",
    });
  }

  static Future<void> paymentGet(String status, String token) async {
    // final sharedAuth = Sharedpref.instence.getAuthDetails();
    // String username = await sharedAuth!['email'];
    // int id = await Sharedpref.instence.getId();
    final body = {
      "to": token,
      "notification": {
        "title": "Happy Customer",
        "body": "Payment Sucessfully Credited"
      },
      "data": {"status": status}
    };
    const url = 'https://fcm.googleapis.com/fcm/send';

    await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "key=AAAAOd8TloI:APA91bFR5DQqeZ4sK3pKmCDVG2gycpvL-0k3P37vFfc8dGGiBmTk6etbnucQJJZG2hfdYx_em93yVIcaJFeDWl2QxXYdJurwnE-YvIGmxp5K0Z7zbbYlmCdCsRpxdF0-Et5sHjkzhcjd",
    });
  }
}

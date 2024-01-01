import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:taxi_app_user/models/available_drivers.dart';
import 'package:taxi_app_user/service/payment_model.dart';
import 'package:taxi_app_user/service/sharedpref.dart';
import 'package:taxi_app_user/service/user.dart';

import '../utils/app_endpoint.dart';

class Repo {
  static Future<int?> userSignUp(User user) async {
    var url = Url.baseUrl + Url.user + Url.signUpUser;
    final uri = Uri.parse(url);
    final body = user.toJson();
    var response =
        await http.post(uri, body: jsonEncode(body), headers: Url.headers);
    if (response.statusCode == 200) {
      int id = jsonDecode(response.body);
      return id;
    }
    return null;
  }

  static Future<User?> userSignin(String email, String password) async {
    var url = Url.baseUrl + Url.user + Url.signInUser;
    final uri = Uri.parse(url);
    final body = {"email": email, "password": password};

    var response =
        await http.post(uri, body: jsonEncode(body), headers: Url.headers);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      User user = User.fromJson(responseData['user']);
      return user;
    } else {
      return null;
    }
  }

  static Future<bool> updateUserDetails(User user) async {
    var url = Url.baseUrl + Url.user + Url.editUser;
    final uri = Uri.parse(url);
    final body = user.toJson();
    var response =
        await http.put(uri, body: jsonEncode(body), headers: Url.headers);
    return response.statusCode == 200;
  }

  static Future<bool> deleteUser(int id) async {
    var url = "${Url.baseUrl}${Url.user}${Url.delete}/$id";
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode == 200;
  }

  static Future<List<AvailableDrivers>> booking(
      piclat, piclong, endlat, endlong) async {
    int id = Sharedpref.instence.getId();
    var url = '${Url.baseUrl}/booking/ride';
    var header = {"Content-Type": "application/json"};
    var body = {
      "userid": id,
      "pickuplat": piclat,
      "pickuplong": piclong,
      "droppofflat": endlat,
      "dropofflong": endlong,
      "status": "pending"
    };

    var uri = Uri.parse(url);
    final response =
        await http.post(uri, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey("success")) {
        List<dynamic> driversList = jsonResponse["success"];
        List<AvailableDrivers> driversInfoList =
            driversList.map((e) => AvailableDrivers.fromJson(e)).toList();

        return driversInfoList;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

//to get token
  static Future<String?> confirmRide(int id) async {
    var url = Uri.parse('${Url.baseUrl}${Url.booking}${Url.confirm}/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body);
      return token['success'];
    }
    return null;
  }

  static Future<bool> addTokenToDB(int userId, String token) async {
    var url = Uri.parse(Url.baseUrl + Url.firebase + Url.token);
    var body = {
      'user_id': userId,
      'token': token,
      'status': 'Active',
      'category': 'User'
    };
    var response =
        await http.post(url, body: jsonEncode(body), headers: Url.headers);
    return response.statusCode == 200;
  }

  static Future<bool> disablePushNotifications(int userId) async {
    var url = Uri.parse("${Url.baseUrl}${Url.firebase}${Url.disable}");
    {}
    var body = {
      'user_id': userId,
      'token': '',
      'status': 'InActive',
      'category': 'User'
    };
    var response =
        await http.patch(url, body: jsonEncode(body), headers: Url.headers);
    return response.statusCode == 200;
  }

  static Future<bool> updatePaymentStatus(
      int userId, int driverId, String status) async {
    var url = Uri.parse(Url.baseUrl + Url.user + Url.payment);
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    final body = {
      "userid": userId,
      "driverid": driverId,
      "date": formattedDate,
      "status": status
    };
    final response =
        await http.patch(url, body: jsonEncode(body), headers: Url.headers);
    return response.statusCode == 200;
  }

  static Future<List<Payment>?> paymentDetails(int userid) async {
    final url =
        Uri.parse("${Url.baseUrl}${Url.user}${Url.paymentdetails}/$userid");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List<dynamic> payments = result["payments"] ?? [];
      final List<Payment> paymentsList =
          payments.map((e) => Payment.fromJson(e)).toList();
      return paymentsList;
    }
    return null;
  }
}

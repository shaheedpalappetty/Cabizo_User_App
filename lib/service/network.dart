import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app_user/service/expection/exeption.dart';

typedef EitherResponse = Future<Either<AppException, Map>>;

class Api {
  static const headers = {'Content-Type': 'application/json'};

  static EitherResponse getApi(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return Right(getResponse(response));
    } on SocketException {
      return Left(InternetException());
    } catch (e) {
      return Left(BadRequestException());
    }
  }
  

  static Map<String, dynamic> getResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      throw BadRequestException();
    } else {
      throw BadRequestException();
    }
  }
}

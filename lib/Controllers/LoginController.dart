import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/LoginRequestModel.dart';
import '../Models/LoginResponseModel.dart';

class LoginContoller extends GetxController{
  Future<void>registerUser(LoginRequestModel requestModel) async{
    final url = Uri.parse('https://mock-api.calleyacd.com/api/auth/login');

    try{
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final result = LoginResponseModel.fromJson(data);

        Get.snackbar("Success", result.message);
      } else {
        final data = jsonDecode(response.body);
        Get.snackbar("Failed", data['message'] ?? "Unknown Error");
      }
    }
    catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    }
  }
}

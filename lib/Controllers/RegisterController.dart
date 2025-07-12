import 'dart:convert';

import 'package:csteachassignment/Models/RegisterRequestModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/RegisterResponseModel.dart';

class RegisterController extends GetxController{
  Future<void>registerUser(RegisterRequestModel requestModel) async{
    final url = Uri.parse('https://mock-api.calleyacd.com/api/auth/register');

    try{
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final result = RegisterResponseModel.fromJson(data);

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
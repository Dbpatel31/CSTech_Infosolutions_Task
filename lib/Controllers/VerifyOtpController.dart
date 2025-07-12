import 'dart:convert';

import 'package:csteachassignment/Models/VerifyOtpRequestModel.dart';
import 'package:csteachassignment/Models/VerifyOtpResponseModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerifyOtpController extends GetxController{
  Future<void>verifyOtp(VerifyOtpRequestModel requestVerifyOtp) async{
    final url= Uri.parse("https://mock-api.calleyacd.com/api/auth/verify-otp");

    try{
      final response=  await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestVerifyOtp.toJson()),
      );
      if(response.statusCode==200 || response.statusCode==201){
        final data= jsonDecode(response.body);
        final result= VerifyOtpResponseModel.fromJson(data);

        Get.snackbar("Success", result.message);
      }
      else{
        final data = jsonDecode(response.body);
        Get.snackbar("Failed", data['message'] ?? "Unknown Error");
      }
    }
    catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    }
  }
}
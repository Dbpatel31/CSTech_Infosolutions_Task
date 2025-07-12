import 'dart:convert';

import 'package:csteachassignment/Models/SendOtpRequestModel.dart';
import 'package:csteachassignment/Models/SendOtpResponseModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SendOtpController extends GetxController{


  Future<void>sendOtp(SendOtpRequestModel requestOtp) async{
    final url= Uri.parse("https://mock-api.calleyacd.com/api/auth/send-otp");

    try{
      final response= await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestOtp.toJson()),
      );
      if(response.statusCode==200 || response.statusCode==201){
        final data= jsonDecode(response.body);
        final result= SendOtpResponseModel.fromJson(data);

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
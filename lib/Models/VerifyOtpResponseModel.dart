

class VerifyOtpResponseModel{
  final String message;

  VerifyOtpResponseModel({
    required this.message
});

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic>json){
    return VerifyOtpResponseModel(
        message: json['message'] ?? ''
    );
  }
  
}
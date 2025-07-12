class SendOtpResponseModel{
  final String message;

  SendOtpResponseModel({
    required this.message
});

  factory SendOtpResponseModel.fromJson(Map<String, dynamic>json){
    return SendOtpResponseModel(
        message: json['message'] ?? ''
    );
  }
}
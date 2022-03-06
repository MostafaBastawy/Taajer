class OtpVerificationModel {
  bool? verificationResult;
  String? verificationMessage;

  OtpVerificationModel({
    this.verificationResult,
    this.verificationMessage,
  });

  OtpVerificationModel.fromJson(Map<String, dynamic> json) {
    verificationResult = json['result'];
    verificationMessage = json['message'];
  }
}

class ForgetPasswordOtpVerificationModel {
  bool? verificationResult;
  String? verificationMessage;
  int? userId;

  ForgetPasswordOtpVerificationModel({
    this.verificationResult,
    this.verificationMessage,
    this.userId,
  });

  ForgetPasswordOtpVerificationModel.fromJson(Map<String, dynamic> json) {
    verificationResult = json['result'];
    verificationMessage = json['message'];
    userId = json['user'];
  }
}

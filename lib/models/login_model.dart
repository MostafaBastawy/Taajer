class LoginModel {
  bool? registerResult;
  String? registerMessage;
  int? registerUserId;

  LoginModel({
    this.registerResult,
    this.registerMessage,
    this.registerUserId,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    registerResult = json['result'];
    registerMessage = json['message'];
    registerUserId = json['user_id'];
  }
}

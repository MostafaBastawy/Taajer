class UserRegistrationModel {
  bool? registerResult;
  String? registerMessage;
  int? registerUserId;

  UserRegistrationModel({
    this.registerResult,
    this.registerMessage,
    this.registerUserId,
  });

  UserRegistrationModel.fromJson(Map<String, dynamic> json) {
    registerResult = json['result'];
    registerMessage = json['message'];
    registerUserId = json['user_id'];
  }
}

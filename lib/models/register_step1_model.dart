class RegisterStep1Model {
  bool? registerResult;
  String? registerMessage;
  int? registerUserId;

  RegisterStep1Model({
    this.registerResult,
    this.registerMessage,
    this.registerUserId,
  });

  RegisterStep1Model.fromJson(Map<String, dynamic> json) {
    registerResult = json['result'];
    registerMessage = json['message'];
    registerUserId = json['user_id'];
  }
}

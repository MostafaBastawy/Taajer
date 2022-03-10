class ChangePasswordModel {
  bool? changePasswordResult;
  String? changePasswordMessage;

  ChangePasswordModel({
    this.changePasswordResult,
    this.changePasswordMessage,
  });

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    changePasswordResult = json['result'];
    changePasswordMessage = json['message'];
  }
}

class LoginModel {
  bool? loginResult;
  String? loginMessage;
  String? loginAccessToken;
  String? loginTokenType;
  String? loginAccessTokenExpiresAt;
  UserDataModel? userDataModel;

  LoginModel({
    this.loginResult,
    this.loginMessage,
    this.loginAccessToken,
    this.loginTokenType,
    this.loginAccessTokenExpiresAt,
    this.userDataModel,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    loginResult = json['result'];
    loginMessage = json['message'];
    loginAccessToken = json['access_token'];
    loginTokenType = json['token_type'];
    loginAccessTokenExpiresAt = json['expires_at'];
    userDataModel = UserDataModel.fromJson(json['user']);
  }
}

class UserDataModel {
  int? userId;
  String? userType;
  String? userName;
  String? userEmail;
  String? userAvatar;
  String? userAvatarOriginal;
  String? userPhone;
  UserDataModel({
    this.userId,
    this.userType,
    this.userName,
    this.userEmail,
    this.userAvatar,
    this.userAvatarOriginal,
    this.userPhone,
  });
  UserDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['id'];
    userType = json['type'];
    userName = json['name'];
    userEmail = json['email'];
    userAvatar = json['avatar'];
    userAvatarOriginal = json['avatar_original'];
    userPhone = json['phone'];
  }
}

class PreLoginModel {
  bool? preLoginResult;
  String? preLoginMessage;
  String? preLoginCompanyName;
  int? preLoginUserId;

  PreLoginModel({
    this.preLoginResult,
    this.preLoginMessage,
    this.preLoginCompanyName,
    this.preLoginUserId,
  });

  PreLoginModel.fromJson(Map<String, dynamic> json) {
    preLoginResult = json['result'];
    preLoginMessage = json['message'];
    preLoginCompanyName = json['company_name'];
    preLoginUserId = json['user_id'];
  }
}

class PreLoginModel {
  bool? preLoginResult;
  String? preLoginMessage;
  String? preLoginCompanyName;

  PreLoginModel({
    this.preLoginResult,
    this.preLoginMessage,
    this.preLoginCompanyName,
  });

  PreLoginModel.fromJson(Map<String, dynamic> json) {
    preLoginResult = json['result'];
    preLoginMessage = json['message'];
    preLoginCompanyName = json['company_name'];
  }
}

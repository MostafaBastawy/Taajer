class OnBoardingModel {
  String? onBoardingImage;
  String? onBoardingText;
  String? onBoardingBoldText;

  OnBoardingModel({
    this.onBoardingImage,
    this.onBoardingText,
    this.onBoardingBoldText,
  });

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    onBoardingImage = json['onBoardingImage'];
    onBoardingText = json['onBoardingText'];
    onBoardingBoldText = json['onBoardingBoldText'];
  }
}

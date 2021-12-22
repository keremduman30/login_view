class ImageConstant {
  static ImageConstant? _instace;
  static ImageConstant get instance {
    _instace ??= ImageConstant._init();
    return _instace!;
  }

  ImageConstant._init();
  final loginSvg1 = "login".toSvg;
  final loginSvg = "login1".toSvg;
  final loginGooglePng = "google".toPng;
  final loginFaceookPng1 = "facebook".toPng;
  final loginFaceookPng = "face".toPng;
  final h1toJpg = "h1".toJpg;
  final h2toJpg = "h2".toJpg;
  final h3toJpg = "h3".toJpg;
  final message = "message".toPng;
  final security = "security".toPng;
  final share = "share".toPng;
}

extension _ImageConstantExtension on String {
  String get toSvg => "assets/images/svg/$this.svg";
  String get toPng => "assets/images/png/$this.png";
  String get toJpg => "assets/images/jpg/$this.jpg";
}

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
}

extension _ImageConstantExtension on String {
  String get toSvg => "assets/images/svg/$this.svg";
  String get toPng => "assets/images/png/$this.png";
}

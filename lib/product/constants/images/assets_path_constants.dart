class AssetsPath {
  static AssetsPath? _instace;
  static AssetsPath get instance {
    if (_instace != null) return _instace!;
    _instace = AssetsPath._init();
    return _instace!;
  }

  AssetsPath._init();

  final eror404 = '404-error'.toJson;
  final cubeLoader = 'cube-loader-3'.toJson;
  final erorDoodleAnimation = 'error-doodle-animation'.toJson;
  final liquidBlobbyLoaderGreen = 'liquid-blobby-loader-green'.toJson;
  final wifi = 'wifi'.toJson;
  final cloudDownloading = 'cloud-downloading'.toJson;
  langAsset(String langCode) => '$langCode-${langCode.toUpperCase()}'.toLangJson;
}

extension _AssetsPathExtension on String {
  String get toJson => 'assets/lottie/$this.json';
  String get toLangJson => 'assets/lang/$this.json';
  /*  
  String get toPng => 'assets/images/$this.png';
  String get toJpg => 'assets/images/$this.jpg';
  String get toJpeg => 'assets/images/$this.jpeg';
  String get toSvg => 'assets/svg/$this.svg';
  */
}

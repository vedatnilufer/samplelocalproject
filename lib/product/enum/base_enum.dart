enum BaseEnum { baseUrl, baseHeader }

extension BaseEnumExtension on BaseEnum {
  get rawValue {
    switch (this) {
      case BaseEnum.baseUrl:
        String? _baseUrl = "http://jsonplaceholder.typicode.com";
        return _baseUrl;
      case BaseEnum.baseHeader:
        var _header = <String, String>{'Content-Type': 'application/json; charset=UTF-8'};
        return _header;
      default:
    }
  }
}

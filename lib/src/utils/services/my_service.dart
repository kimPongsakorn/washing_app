String? selectRadio;

class MyService {
  MyService._internal();

  static final MyService _instance = MyService._internal();

  factory MyService() => _instance;

  Future<String?> setValueOption(String? message) async {
    selectRadio = message;
  }
}

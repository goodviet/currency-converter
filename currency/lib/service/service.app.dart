import 'dart:convert';
import 'package:http/http.dart' as http;

class AppService {
  static const String URL_API = "https://api.exchangerate-api.com/v4/latest/";
  Future<List<String>> getCurrencies() async {
    var response = await http
        .get(Uri.parse(URL_API + "USD"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<String> currencies =
          (data['rates'] as Map<String, dynamic>).keys.toList();
      return currencies;
    } else {
      throw Exception('Error: Unable to fetch currencies');
    }
  }

  Future<double> getRate(String fromCurrency, String toCurrency) async {
    var response = await http.get(
        Uri.parse(URL_API+fromCurrency));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['rates'][toCurrency];
    } else {
      throw Exception('Error: Unable to fetch rate');
    }
  }
}

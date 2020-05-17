import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

String baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
String apiKey = 'D4CAEFBD-0DCC-4E38-A371-FD8A69855B47';

class CoinData {

  Future getCoinData(String quote) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {

      http.Response response = await http.get('$baseUrl/$crypto/$quote?apikey=$apiKey');
      if (response.statusCode == 200) {
        double lastPrice = jsonDecode(response.body)['rate'];

        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}

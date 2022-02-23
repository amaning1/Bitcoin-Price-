import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

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

class CoinData {
  Future<dynamic> getCoinData(String currency, String coin) async {
    Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=98490645-5332-43A2-8D56-55603903011F'));

    if (response.statusCode == 200) {
      String data = response.body;
      // return jsonDecode(data);
      var coinPrice = jsonDecode(data)['rate'];
      return coinPrice;
      print(coinPrice);
    } else {
      print(response.statusCode);
    }
  }
}

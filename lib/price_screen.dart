import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coin_data.dart';
import 'package:http/http.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropdownValue = 'USD';
  String priceBTC;
  String priceETH;
  String priceLTC;

  void updatePrice() async {
    //var coinPrice = jsonDecode(data)['rate'];
    //print(coinPrice);
    double dataBTC = await CoinData().getCoinData(dropdownValue, 'BTC');
    double dataETH = await CoinData().getCoinData(dropdownValue, 'ETH');
    double dataLTC = await CoinData().getCoinData(dropdownValue, 'LTC');

    setState(() {
      priceBTC = dataBTC.toStringAsFixed(0);
      priceETH = dataETH.toStringAsFixed(0);
      priceLTC = dataLTC.toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    super.initState();
    updatePrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $priceBTC $dropdownValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $priceETH $dropdownValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $priceLTC $dropdownValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 266.3),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30.0),
                color: Colors.lightBlue,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  //icon: const Icon(Icons.arrow_downward),
                  elevation: 10,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      updatePrice();
                    });
                  },
                  items: <String>[
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
                    'ZAR',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

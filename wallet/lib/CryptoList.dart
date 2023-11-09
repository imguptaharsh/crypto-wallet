import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wallet/widgets/CryptoInfoList.dart';
import 'package:wallet/Filter/FilterPage.dart';
import 'package:wallet/widgets/Poster.dart';
import 'package:http/http.dart' as http;
import 'package:wallet/provider/data.dart';
// import 'package:wallet/model.dart';

class CryptoInfo {
  final int id;
  final String name;
  final double price;
  final double percentChange24h;
  String logo; // Updated to include the logo URL

  CryptoInfo({
    required this.id,
    required this.name,
    required this.price,
    required this.percentChange24h,
    required this.logo, // Include the logo URL in the constructor
  });

  factory CryptoInfo.fromJson(Map<String, dynamic> json) {
    return CryptoInfo(
      id: json['id'],
      name: json['name'],
      price: (json['quote']['USD']['price'] as num).toDouble(),
      percentChange24h:
          (json['quote']['USD']['percent_change_24h'] as num).toDouble(),
      logo:
          'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png', // Set a default logo URL here
    );
  }
}

class CryptList extends StatefulWidget {
  const CryptList({Key? key}) : super(key: key);

  @override
  State<CryptList> createState() => _CryptListState();
}

class _CryptListState extends State<CryptList> {
  late Future<List<CryptoInfo>> data;

  Future<List<CryptoInfo>> fetchCryptoData() async {
    final apiUrl = Uri.parse(
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest');
    final headers = {
      'X-CMC_PRO_API_KEY': 'd7ac7eda-9c8e-40f9-ac31-5f5c449eb43a',
    };

    try {
      final response = await http.get(apiUrl, headers: headers);

      if (response.statusCode == 200) {
        // final List<dynamic> jsonData = json.decode(response.body)['data'];
        // final List<CryptoInfo> cryptoInfoList = jsonData
        //     .map((cryptoData) => CryptoInfo.fromJson(cryptoData))
        //     .toList();
        // // print("$cryptoInfoList['id']");
        // return cryptoInfoList.take(20).toList();
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        final List<CryptoInfo> cryptoInfoList = [];

        for (var cryptoData in jsonData.take(20)) {
          final cryptoInfo = CryptoInfo.fromJson(cryptoData);

          // Fetch the logo for each cryptocurrency
          final logoUrl = await fetchCryptoLogo(cryptoInfo.id);
          cryptoInfo.logo = logoUrl;

          cryptoInfoList.add(cryptoInfo);
        }
        final cryptoInfoProvider =
            Provider.of<CryptoInfoProvider>(context, listen: false);
        cryptoInfoProvider.cryptoData = cryptoInfoList;
        return cryptoInfoList;
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<String> fetchCryptoLogo(int cryptoId) async {
    final String apiUrl =
        'https://pro-api.coinmarketcap.com/v2/cryptocurrency/info?id=$cryptoId';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'X-CMC_PRO_API_KEY':
            'd7ac7eda-9c8e-40f9-ac31-5f5c449eb43a', // Replace with your actual CoinMarketCap API key
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> cryptoInfo = data['data']['$cryptoId'];
      final String logoUrl = cryptoInfo['logo'];
      return logoUrl;
    } else {
      throw Exception('Failed to load crypto data');
    }
  }

  @override
  void initState() {
    super.initState();
    data = fetchCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Poster(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Cryptocurrencies",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 127, 126, 126),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CryptoInfoList(data: data),
          ],
        ),
      ),
    );
  }
}

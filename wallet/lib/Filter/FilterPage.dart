import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/widgets/CryptoInfoList.dart';
import 'package:wallet/CryptoList.dart';
import 'package:wallet/provider/data.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key, required this.filter});
  String filter;

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late String q = widget.filter;
  late String title;

  List<CryptoInfo> cryptocurrencyList = [];
  bool sortAscending = false; // Used to toggle sorting order
  void sortCryptocurrencyList(String filter) {
    setState(() {
      cryptocurrencyList.sort((a, b) {
        if (filter == 'Price') {
          return b.price.compareTo(a.price);
          // : b.price.compareTo(a.price);
        } else if (filter == 'Top Gainers') {
          return b.percentChange24h.compareTo(a.percentChange24h);
          // : b.percentChange24h.compareTo(a.percentChange24h);
        } else if (filter == 'Top Losers') {
          return a.percentChange24h.compareTo(b.percentChange24h);
        } else {
          return a.id.compareTo(b.id);
        }
      });
      // Toggle the sorting order for the next sorting
      // sortAscending = !sortAscending;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cryptoInfoProvider = Provider.of<CryptoInfoProvider>(context);
    cryptocurrencyList = cryptoInfoProvider.cryptoData;
    sortCryptocurrencyList(q);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            (q == 'Price' || q == 'Filter')
                ? 'Ordered by $q'
                : '$q in the Last 24 Hours"',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cryptocurrencyList.length,
                itemBuilder: (context, index) {
                  final cryptoInfo = cryptocurrencyList[index];
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: InfoWidget(cryptoInfo: cryptoInfo),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

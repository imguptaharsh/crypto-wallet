import 'package:flutter/material.dart';
import 'package:wallet/model.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<CryptoInfo> cryptocurrencyList = [];

  bool sortAscending = true; // Used to toggle sorting order

  void sortCryptocurrencyList(bool byPrice) {
    setState(() {
      cryptocurrencyList.sort((a, b) {
        if (byPrice) {
          return sortAscending
              ? a.price.compareTo(b.price)
              : b.price.compareTo(a.price);
        } else {
          return sortAscending
              ? a.percentChange24h.compareTo(b.percentChange24h)
              : b.percentChange24h.compareTo(a.percentChange24h);
        }
      });

      // Toggle the sorting order for the next sorting
      sortAscending = !sortAscending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[200],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search Cryptocurrency',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                    color: const Color.fromARGB(255, 135, 134, 134))),
            child: const Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(11.0, 11.0, 2.0, 11.0),
                  child: Icon(Icons.filter_list,
                      color: Color.fromARGB(255, 135, 134, 134)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 11.0, 11.0, 11.0),
                  child: Text(
                    'Filter',
                    style: TextStyle(color: Color.fromARGB(255, 135, 134, 134)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

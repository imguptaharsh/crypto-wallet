import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/widgets/BottomNav.dart';
import 'package:wallet/widgets/CryptoList.dart';
import 'package:wallet/screens/FilterPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(' EXCHANGES',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        actions: [
          SvgPicture.asset('assets/notification.svg'),
          const SizedBox(width: 15),
          SvgPicture.asset(
            'assets/settings.svg',
            width: 25,
          ),
          const SizedBox(width: 15),
          // SearchBar()
        ],
        toolbarHeight: 75.0,
      ),
      body: const Column(
        children: [
          SearchBar(),
          Expanded(
            child: Stack(
              children: <Widget>[
                CryptList(), // The scrollable CryptoList
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomNav(),
                ), // The BottomNav overlaid on top
              ],
            ),
          ),
        ],
      ),
    );
    // body: CryptList());
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String selectedOption = 'Filter';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
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
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.only(left: 0, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Color.fromARGB(255, 175, 174, 174))),
            child: DropdownButton<String>(
              // icon: Icon(Icons.filter_list),
              alignment: Alignment.center,
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                  // Navigate to the FilterPage
                  // sortCryptocurrencyList(selectedOption);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FilterPage(filter: selectedOption)),
                  );
                });
              },
              items: <String>['Filter', 'Price', 'Top Gainers', 'Top Losers']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 145, 144, 144),
                fontWeight: FontWeight.w700,
              ),
              icon: const Icon(
                Icons.filter_list,
                color: Color.fromARGB(255, 145, 144, 144),
              ),
              iconSize: 24, // Adjust the size of the icon as needed
            ),
          ),
        ),
      ],
    );
  }
}

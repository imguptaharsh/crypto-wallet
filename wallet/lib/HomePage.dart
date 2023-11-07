import 'package:flutter/material.dart';
import 'package:wallet/Poster.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(' EXCHANGES',
              style: TextStyle(color: Colors.black, fontSize: 22)),
          actions: const [
            Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            SizedBox(width: 15),
            Icon(Icons.settings, color: Colors.black),
            SizedBox(width: 15),
          ],
          toolbarHeight: 80.0,
        ),
        body: const Column(
          children: [
            SearchBar(),
            Poster(),
          ],
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

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

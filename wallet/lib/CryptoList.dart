import 'package:flutter/material.dart';

class CryptList extends StatelessWidget {
  const CryptList({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Cryptocurrencies",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "View All",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 127, 126, 126),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                // border: Border.all(
                //     color: const Color.fromARGB(255, 135, 134, 134))
              ),
              child: Row(
                children: const [],
              )),
        ],
      ),
    );
  }
}

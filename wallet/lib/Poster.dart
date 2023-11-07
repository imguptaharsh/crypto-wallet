import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  const Poster({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                "Cryptocurrency",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(width: 25),
              Text(
                "NFT",
                style: TextStyle(
                    fontSize: 22, color: Color.fromARGB(255, 144, 142, 142)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
            height: 100,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                    color: const Color.fromARGB(255, 135, 134, 134))),
            child: const Column(
              children: [],
            )),
      ],
    );
  }
}

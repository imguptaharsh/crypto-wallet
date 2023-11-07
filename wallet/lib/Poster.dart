import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              // border: Border.all(
              //     color: const Color.fromARGB(255, 135, 134, 134))
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/btc.svg', // Replace with the path to your SVG file
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Column(
                        children: [
                          Text(
                            "\$55,0000 USD",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "                      +2.5%",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/posterlogo.svg', // Replace with the path to your SVG file
                  width: 350, // Set the width as needed
                )
              ],
            )),
      ],
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptList extends StatelessWidget {
  const CryptList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
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
          SizedBox(
            height: 30,
          ),
          Container(
              // height: 150,
              // width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                // border: Border.all(
                //     color: const Color.fromARGB(255, 135, 134, 134))
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/logo.svg', // Replace with the path to your SVG file
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "ETH",
                            style: TextStyle(
                                fontSize: 18,
                                // color: Color.fromARGB(255, 127, 126, 126),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Ethereum",
                            style: TextStyle(
                                fontSize: 15,
                                // color: Color.fromARGB(255, 127, 126, 126),
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset(
                          'assets/down.svg',
                          // alignment: Alignment.topCenter,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "\$55,0000 USD",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "+2.5%",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Column(
                  //   children: [
                  //     Row(
                  //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           "ETH",
                  //           style: TextStyle(
                  //               fontSize: 18,
                  //               // color: Color.fromARGB(255, 127, 126, 126),
                  //               fontWeight: FontWeight.w500),
                  //         ),
                  //         SizedBox(
                  //           width: 25,
                  //         ),
                  //         SvgPicture.asset(
                  //           'assets/down.svg', // Replace with the path to your SVG file
                  //         ),
                  //         SizedBox(
                  //           width: 25,
                  //         ),
                  //         Text(
                  //           "\$55,0000 USD",
                  //           style: TextStyle(
                  //               fontSize: 18,
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.w500),
                  //         ),
                  //       ],
                  //     ),
                  //     // SizedBox(
                  //     //   height: 10,
                  //     // ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: const [
                  //         Text(
                  //           "Ethereum",
                  //           style: TextStyle(
                  //               fontSize: 15,
                  //               // color: Color.fromARGB(255, 127, 126, 126),
                  //               fontWeight: FontWeight.w400),
                  //         ),
                  //         SizedBox(
                  //           width: 165,
                  //         ),
                  //         Text(
                  //           "+2.5%",
                  //           style: TextStyle(
                  //               fontSize: 14,
                  //               color: Colors.green,
                  //               fontWeight: FontWeight.w700),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              )),
        ],
      ),
    );
  }
}

// Column(
//                     children: [
//                       Row(
//                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "ETH",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 // color: Color.fromARGB(255, 127, 126, 126),
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           SizedBox(
//                             width: 25,
//                           ),
//                           SvgPicture.asset(
//                             'assets/down.svg', // Replace with the path to your SVG file
//                           ),
//                           SizedBox(
//                             width: 25,
//                           ),
//                           Text(
//                             "\$55,0000 USD",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: const [
//                           Text(
//                             "Ethereum",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 // color: Color.fromARGB(255, 127, 126, 126),
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           SizedBox(
//                             width: 25,
//                           ),
//                           Text(
//                             "+2.5%",
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),

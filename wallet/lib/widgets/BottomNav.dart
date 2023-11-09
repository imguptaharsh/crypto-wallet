import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0), color: Colors.black
            // border: Border.all(
            //     color: const Color.fromARGB(255, 135, 134, 134))
            ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/cshop.svg',
                  width: 25,
                  // color: Colors.white,
                ),
                const Text("€-\$hop",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 174, 173, 173),
                        fontWeight: FontWeight.w400))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/exchange.svg',
                  width: 30,
                  // color: Colors.white,
                ),
                const Text("Exchange",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/earth.svg',
              width: 80,
              // color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/LaunchPads.svg',
                  width: 30,
                  // color: Colors.white,
                ),
                const Text("LaunchPads",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 174, 173, 173),
                        fontWeight: FontWeight.w400))
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            // height: 50,
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/wallet.svg',
                  width: 25,
                  alignment: Alignment.center,
                  // color: Colors.white,
                ),
                const Text("Wallet",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 174, 173, 173),
                        fontWeight: FontWeight.w400))
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ]),
      ),
    );
  }
}

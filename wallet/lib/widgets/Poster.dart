import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wallet/CryptoList.dart';
import 'package:wallet/provider/data.dart';

class Poster extends StatelessWidget {
  Poster({super.key});
  double btcPrice = 550000;
  double changeIn24hours = 2.5;
  // var cryptocurrencyList;
  void getBTC(List<CryptoInfo> cryptocurrencyList) {
    for (CryptoInfo crypto in cryptocurrencyList) {
      if (crypto.name == 'Bitcoin') {
        btcPrice = double.parse(crypto.price.toStringAsFixed(2));
        changeIn24hours =
            double.parse(crypto.percentChange24h.toStringAsFixed(2));
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cryptoInfoProvider = Provider.of<CryptoInfoProvider>(context);
    final cryptocurrencyList = cryptoInfoProvider.cryptoData;
    getBTC(cryptocurrencyList);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 0),
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
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/btc.svg',
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            // cryptocurrencyList.isEmpty
                            //     ? "\$55,0000 USD"
                            //     : "\$${cryptocurrencyList.isNotEmpty ? cryptocurrencyList[0].price.toStringAsFixed(2) : ''} USD",
                            '\$$btcPrice USD',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            cryptocurrencyList.isEmpty
                                ? "2.5%"
                                : "${cryptocurrencyList.isNotEmpty ? (cryptocurrencyList[0].percentChange24h > 0 ? '+' : '') + cryptocurrencyList[0].percentChange24h.toStringAsFixed(2) : '2.5'}%",
                            style: TextStyle(
                              fontSize: 14,
                              color: cryptocurrencyList.isNotEmpty
                                  ? cryptocurrencyList[0].percentChange24h > 0
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/posterlogo.svg',
                  width: 350, // Set the width as needed
                )
              ],
            )),
      ],
    );
  }
}

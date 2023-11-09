import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/CryptoList.dart';

class CryptoInfoList extends StatelessWidget {
  const CryptoInfoList({
    super.key,
    required this.data,
  });

  final Future<List<CryptoInfo>> data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CryptoInfo>>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final cryptoInfoList = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cryptoInfoList!.length,
            itemBuilder: (context, index) {
              final cryptoInfo = cryptoInfoList[index];
              return InfoWidget(cryptoInfo: cryptoInfo);
            },
          );
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.cryptoInfo,
    //  required this.logo
  });
  // Future<String> logo;
  final CryptoInfo cryptoInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      // padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                cryptoInfo.logo,
                width: 50,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cryptoInfo.name.substring(0, 3).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    cryptoInfo.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  cryptoInfo.percentChange24h > 0
                      ? 'assets/up.svg'
                      : 'assets/down.svg',
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${cryptoInfo.price.toStringAsFixed(2)} USD",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${cryptoInfo.percentChange24h > 0 ? '+' : ''}${cryptoInfo.percentChange24h.toStringAsFixed(2)}%",
                style: TextStyle(
                  fontSize: 14,
                  color: cryptoInfo.percentChange24h > 0
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

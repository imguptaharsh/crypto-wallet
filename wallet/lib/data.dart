// class CryptoInfo {
//   final int id;
//   final String name;
//   final double price;
//   final double percentChange24h;

//   CryptoInfo({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.percentChange24h,
//   });

//   factory CryptoInfo.fromJson(Map<String, dynamic> json) {
//     return CryptoInfo(
//       id: json['id'],
//       name: json['name'],
//       price: (json['quote']['USD']['price'] as num).toDouble(),
//       percentChange24h:
//           (json['quote']['USD']['percent_change_24h'] as num).toDouble(),
//     );
//   }
// }
import 'package:wallet/CryptoList.dart';

late Future<List<CryptoInfo>> cryptoDataList;

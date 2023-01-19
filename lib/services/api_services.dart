import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;

import '../models/coin.dart';

class ApiServices {
  Future<List<dynamic>> getCoins() async {
    const url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=mxn&order=market_cap_desc&per_page=100&page=1&sparkline=false";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return data.map((e) => Coin.fromMap(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getDetails(String id) async {
    final url =
        "https://api.coingecko.com/api/v3/coins/$id?localization=true&tickers=true&market_data=true&community_data=true&developer_data=true&sparkline=true";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map data = jsonDecode(response.body);

        return data;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

final provider = Provider((ref) => ApiServices());
final coinsDataProvider = FutureProvider((ref) async {
  return ref.watch(provider).getCoins();
});
final coinsDetailsProvider = FutureProvider((ref) async {
  return ref.watch(provider);
});

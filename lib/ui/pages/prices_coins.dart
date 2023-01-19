import 'package:crypto_flutter/services/api_services.dart';
import 'package:crypto_flutter/ui/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/customListTile.dart';

class PricesCoins extends ConsumerWidget {
  const PricesCoins({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coinsProvider = ref.watch(coinsDataProvider);
    return SizedBox(
      height: double.infinity,
      child: coinsProvider.when(
        data: (coinsProvider) {
          return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  color: Colors.white,
                );
              },
              itemCount: coinsProvider.length,
              itemBuilder: (context, index) {
                final coin = coinsProvider[index];

                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => DetailsPage(
                            coin: coin,
                          )),
                    ),
                  ),
                  child: CustomListTile(
                    image: coin.image,
                    title: '${coin.name}',
                    subtitle: "${coin.symbol}",
                    currentPrice: coin.currentPrice,
                    priceChangePercentage24H: coin.priceChangePercentage24H,
                  ),
                );
              });
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

import 'package:crypto_flutter/services/api_services.dart';
import 'package:crypto_flutter/ui/widgets/customListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardsWidget extends ConsumerWidget {
  const CardsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coinController = ref.watch(coinsDataProvider);
    return Expanded(
      child: coinController.when(
        data: (coinController) {
          return ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => const Divider(
                    color: Colors.grey,
                    height: 5,
                  ),
              itemBuilder: (context, index) {
                final coin = coinController[index];
                return CustomListTile(
                  image: coin.image,
                  title: '${coin.name}',
                  subtitle: "${coin.symbol}",
                  currentPrice: coin.currentPrice,
                  priceChangePercentage24H: coin.priceChangePercentage24H,
                );
              });
        },
        error: (error, stackTrace) => Text("$error"),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

import 'package:crypto_flutter/services/api_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomList extends ConsumerWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardProvider = ref.watch(coinsDataProvider);
    final style = Theme.of(context).textTheme.bodyText1;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: 190,
      child: cardProvider.when(
        data: (cardProvider) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: size.width < 700 ? 5 : 15,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 196,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: customDecoration(cardProvider, index),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            "${cardProvider[index].image}",
                            width: 35,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cardProvider[index].name}",
                              style: style,
                            ),
                            Text(
                              "${cardProvider[index].symbol}",
                              style: style,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: LineChart(
                        LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                  color: cardProvider[index]
                                              .priceChangePercentage24H >
                                          0
                                      ? Colors.blueAccent.shade700
                                      : Colors.purpleAccent,
                                  preventCurveOverShooting: true,
                                  spots: [
                                    const FlSpot(0, 8),
                                    const FlSpot(1, 6),
                                    const FlSpot(2, 2),
                                    const FlSpot(3, 5),
                                    const FlSpot(4, 4),
                                    const FlSpot(4, 9),
                                  ])
                            ]),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$ ${cardProvider[index].currentPrice}",
                          style: style,
                        ),
                        const Spacer(),
                        Text(
                          "${cardProvider[index].priceChangePercentage24H}%",
                          style: TextStyle(
                            color:
                                cardProvider[index].priceChangePercentage24H > 0
                                    ? Colors.greenAccent.shade700
                                    : Colors.redAccent,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        error: (error, stackTarce) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  BoxDecoration customDecoration(cardProvider, index) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: cardProvider[index].priceChangePercentage24H < 0
            ? RadialGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.white.withOpacity(0.9),
                ],
                radius: .80,
              )
            : RadialGradient(
                colors: [
                  Colors.blue,
                  Colors.white.withOpacity(0.9),
                ],
                radius: .80,
              ),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 5)
        ]);
  }
}

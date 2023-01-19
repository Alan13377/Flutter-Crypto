import 'package:crypto_flutter/providers/theme_provider.dart';
import 'package:crypto_flutter/services/api_services.dart';
import 'package:crypto_flutter/ui/widgets/customListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/coin.dart';

class DetailsPage extends ConsumerWidget {
  final Coin coin;
  const DetailsPage({super.key, required this.coin});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsController = ref.watch(provider);
    final themeController = ref.watch(themeProvider);
    RegExp exp =
        RegExp(r'<[^>]*>|&[^;]+;', multiLine: true, caseSensitive: true);
    late String primeraMitad;
    late String segundaMitad;

    return FutureBuilder(
      future: detailsController.getDetails(coin.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final detail = snapshot.data;

          String text = detail["description"]["en"];
          final currentPrice = (detail["market_data"]["current_price"]["mxn"]);
          final priceChangePercentage24H =
              detail["market_data"]["price_change_percentage_24h"];
          if (text.length > 150) {
            primeraMitad = text.substring(0, 400);
            segundaMitad = text.substring(301, text.length);
          } else {
            primeraMitad = text;
            segundaMitad = "";
          }

          return Scaffold(
            body: CustomScrollView(
              slivers: [
                //*APPBAR
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250,
                  backgroundColor: Colors.grey[200],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      detail["image"]["large"],
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  //**TITULO */
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(20),
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Center(
                        child: Text(
                          "${detail["name"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //*DESCRIPCION
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          child: segundaMitad.length == ""
                              ? Text(
                                  text.replaceAll(exp, ""),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      themeController.isExpanded
                                          ? primeraMitad
                                          : text.replaceAll(exp, ""),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          child: const Text(
                                            "Sitio Web",
                                            style: TextStyle(
                                              color: Color(
                                                0xFF89dad0,
                                              ),
                                            ),
                                          ),
                                          onTap: () async {
                                            final url =
                                                detail["links"]["homepage"][0];
                                            if (await canLaunchUrl(
                                                Uri.parse(url))) {
                                              await launchUrl(Uri.parse(url));
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            themeController.isExpanded =
                                                !themeController.isExpanded;
                                          },
                                          child: Row(
                                            children: const [
                                              Text(
                                                "Show More",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xFF89dad0,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Color(
                                                  0xFF89dad0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                        ),
                        //*PRICES
                        CustomListTile(
                          image: "${detail["image"]["thumb"]}",
                          title: "${detail["name"]}",
                          subtitle: "${detail["symbol"]}",
                          currentPrice: currentPrice.toDouble(),
                          priceChangePercentage24H:
                              priceChangePercentage24H.toDouble(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

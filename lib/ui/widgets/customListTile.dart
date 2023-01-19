import "package:flutter/material.dart";

class CustomListTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double currentPrice;
  final double priceChangePercentage24H;

  const CustomListTile(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.currentPrice,
      required this.priceChangePercentage24H});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          image,
          width: 35,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle.toUpperCase()),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("\$ ${currentPrice.toString()}"),
          const SizedBox(
            height: 5,
          ),
          Text(
            "\$ ${priceChangePercentage24H.toString()}",
            style: TextStyle(
                color: priceChangePercentage24H > 0
                    ? Colors.greenAccent
                    : Colors.redAccent),
          ),
        ],
      ),
    );
  }
}

import 'package:crypto_flutter/ui/widgets/balance_widget.dart';
import 'package:crypto_flutter/ui/widgets/cards_widgets.dart';
import 'package:crypto_flutter/ui/widgets/custom_button.dart';
import 'package:crypto_flutter/ui/widgets/custom_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        const BalanceWidget(),
        const CustomList(),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Market Statistics",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const CardsWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomButton(text: "Deposit", bgColor: Colors.greenAccent),
            SizedBox(
              width: 20,
            ),
            CustomButton(text: "WithDraw", bgColor: Colors.redAccent),
          ],
        )
      ],
    );
  }
}

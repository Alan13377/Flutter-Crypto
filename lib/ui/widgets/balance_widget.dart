import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Balance",
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.w300)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "USD  13220.40",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              Text(
                "+7.65%",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff51AE6F)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

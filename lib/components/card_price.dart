import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardPrice extends StatelessWidget {
  final String time;
  final String price;

  const CardPrice({
    Key? key,
    required this.time,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // formatter price
    double parsedPrice = double.tryParse(price) ?? 0.0;
    String formattedPrice = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    ).format(parsedPrice);

    return Card(
      color: Colors.white,
      child: SizedBox(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    formattedPrice,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                child: const Icon(
                  Icons.chevron_right_rounded,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

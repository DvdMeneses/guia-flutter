import 'package:flutter/material.dart';

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
    return Card(
      color: Colors.white,
      child: Container(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'R\$ ${price}', // Exibe "R$" seguido do valor de `price`
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              child: Icon(
                Icons.chevron_right_rounded,
                size: 30,
              ),
            )
          ],
        ),
      )),
    );
  }
}

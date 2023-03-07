import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Item extends StatelessWidget {
  var item;
  Item({this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: myWidth * 0.05, right: myWidth * 0.05, top: myHeight * 0.02),
        child: Row(
          children: [
            Container(
                height: myHeight * 0.05, child: Image.network(item.image)),
            SizedBox(width: myWidth * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.id,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '0.4 ${item.symbol}',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

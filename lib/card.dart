// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_best_quotes/main.dart';

class Cardwidget extends StatelessWidget {
  Function delete;
  BestQuotes item;
  Cardwidget(
      {super.key,
      required this.item,
      required this.delete,
      });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Color.fromARGB(255, 50, 57, 121),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.title,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      delete(item);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                Text(
                  item.author,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

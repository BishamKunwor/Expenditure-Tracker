import 'package:design/data.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String id;
  final int amount;
  final String title;
  final String date;
  final VoidCallback func;

  DataCard(
      {required this.amount,
      required this.date,
      required this.title,
      required this.id,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        color: Colors.red.withOpacity(.15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(child: Text('Rs.')),
            Positioned(
              top: 20.0,
              // left: 0.0,
              child: Text(
                '$amount',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
                left: 70.0,
                child: Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Positioned(
                left: 70.0,
                top: 30.0,
                child: Text(
                  '$date',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.5)),
                )),
            Positioned(
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.delete_outline_rounded,
                ),
                onPressed: () {
                  int count = 0;
                  while (true) {
                    if (transactions[count].id == id) {
                      break;
                    }
                    count++;
                  }
                  total = 0;
                  transactions.remove(transactions[count]);
                  func();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  IconButton(
//               icon: Icon(
//                 Icons.delete_outline_rounded,
//               ),
//               onPressed: () {},
//             ))

import 'package:design/data.dart';
import 'package:design/transactions.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  final VoidCallback func;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  AddDialog({required this.func});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(80.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15.0,
                        color: Colors.black.withOpacity(.1),
                      )
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 35.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Add new Expenditure',
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          TextField(
                            maxLength: 25,
                            decoration: InputDecoration(
                              hintText: 'Name of Expenditure',
                              icon: Icon(
                                Icons.title,
                                color: Colors.black.withOpacity(.45),
                              ),
                            ),
                            controller: titleController,
                          ),
                          // Spacer(),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Amount',
                              icon: Icon(
                                Icons.attach_money_rounded,
                                color: Colors.black.withOpacity(.45),
                              ),
                            ),
                            controller: amountController,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              transactions.add(Transaction(
                                  id: DateTime.now().toString(),
                                  amount: int.parse(amountController.text),
                                  date: DateTime.now(),
                                  title: titleController.text));
                              total += int.parse(amountController.text);
                              func();
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 50.0,
                                vertical: 5.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                color: Colors.red.withOpacity(.5),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.black.withOpacity(.5),
                                size: 40.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
// TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Name of Expenditure',
//                   prefixIcon: Icon(
//                     Icons.title,
//                     color: Colors.black.withOpacity(.45),
//                   ),
//                   // prefixText: 'Name of Expenditure',
//                 ),
//               ),
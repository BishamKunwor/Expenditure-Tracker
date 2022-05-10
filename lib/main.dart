import 'package:design/addDialog.dart';
import 'package:design/cards.dart';
import 'package:design/data.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffffe6cc),
          textTheme: TextTheme(
              headline1:
                  TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void stager() {
    setState(() {
      transactions.length;
      // for (int i = 0; i < transactions.length; i++) {
      //   total += transactions[i].amount;
      // }
      transactions.forEach((element) {
        total += element.amount;
      });
    });
  }

  void stagerOne() {
    setState(() {
      transactions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MIMO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: Colors.black.withOpacity(.6)),
                    ),
                    Text(
                      'Total : $total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.black.withOpacity(.6)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AddDialog(
                            func: stagerOne,
                          );
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Colors.white.withOpacity(.8),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.black.withOpacity(.5),
                          size: 40.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                // height: 500.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70.0),
                    topRight: Radius.circular(70.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15.0, color: Colors.black.withOpacity(.1)),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                        child: Text(
                          "Expenditures",
                          style: TextStyle(
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Container(
                        child: CardColumn(
                          function: stager,
                        ),
                        height: 550,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardColumn extends StatefulWidget {
  const CardColumn({Key? key, required this.function}) : super(key: key);
  final VoidCallback function;

  @override
  _CardColumnState createState() => _CardColumnState(function: function);
}

class _CardColumnState extends State<CardColumn> {
  final VoidCallback function;
  _CardColumnState({required this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, count) {
          return DataCard(
            func: function,
            amount: transactions[count].amount,
            date: transactions[count].date.format(DateTimeFormats.american),
            title: transactions[count].title,
            id: transactions[count].id,
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

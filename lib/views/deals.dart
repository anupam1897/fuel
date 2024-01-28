import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Deals extends StatefulWidget {
  @override
  DealsState createState() => DealsState();
}

class DealsState extends State<Deals> {
  List investmentList = [
    ['Example Corp', 5000.0, DateTime.now(), "Equity"],
    ['ABC Ltd.', 75000.0, DateTime.now().subtract(Duration(days: 5)), "Loan"],
    ['Vio Corp', 100000.0, DateTime.now().subtract(Duration(days: 5)), "Equity"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          for (var element in investmentList)
            InvestmentDetails(
                companyName: element[0],
                investedAmount: element[1],
                investmentDate: element[2],
                investmentType: element[3])
        ],
      ),
    );
  }
}

class InvestmentDetails extends StatelessWidget {
  final String companyName;
  final double investedAmount;
  final DateTime investmentDate;
  final String investmentType;

  InvestmentDetails({
    required this.companyName,
    required this.investedAmount,
    required this.investmentDate,
    required this.investmentType,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Company Name: ${this.companyName} "),
          Text("Investment Amount: ${this.investedAmount} "),
          Text("Investment Type: ${this.investmentType} "),
          Text(
              "Investment Date: ${DateFormat("MMM d, y").format(investmentDate)} "),
        ]),
        color: Colors.white,
      ),
    );
  }
}

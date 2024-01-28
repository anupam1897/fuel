import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('account'),
      ),
    );
  }
}

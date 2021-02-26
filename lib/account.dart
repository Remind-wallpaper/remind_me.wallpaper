import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
  Widget commonButton(String desc) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        child: Stack(
          children: [
            Center(
              child: Text(
                desc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

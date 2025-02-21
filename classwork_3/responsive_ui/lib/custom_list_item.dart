import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final int number;

  CustomListItem({required this.number});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.purpleAccent,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

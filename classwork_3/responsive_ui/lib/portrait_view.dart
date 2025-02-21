import 'package:flutter/material.dart';
import 'custom_list_item.dart';

class PortraitView extends StatelessWidget {
  final List<int> numbers = List.generate(20, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive List - Portrait')),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return CustomListItem(number: numbers[index]);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'custom_list_item.dart';

class LandscapeView extends StatelessWidget {
  final List<int> numbers = List.generate(20, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive List - Landscape')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return CustomListItem(number: numbers[index]);
        },
      ),
    );
  }
}

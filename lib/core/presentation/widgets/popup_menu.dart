import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class CustomPopUpMenuItem extends StatelessWidget {
  final int padding;
  final List<PopupMenuItem<SampleItem>> items;
  @override
  final Key? key;

  const CustomPopUpMenuItem({this.key, required this.items, this.padding = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      padding: EdgeInsets.all(padding.toDouble()),
      itemBuilder: (BuildContext context) {
        return items;
      },
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.search, color: Colors.grey),
        Text('Active Cards', style: TextStyle(color: Colors.black),),
        Icon(Icons.settings, color: Colors.grey),
      ],
    );
  }
}
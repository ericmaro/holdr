import 'package:flutter/material.dart';

class DisplayTagList extends StatelessWidget {
  List tags;
  DisplayTagList({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      height: 25,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (contex, index) {
            return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(tags[index], style: TextStyle(color: Colors.black, fontSize: 12)));
          }),
    );
  }
}


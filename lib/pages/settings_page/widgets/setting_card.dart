import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;
  final Widget? leading;
  const SettingCard(
      {Key? key,
      required this.title,
      this.padding,
      this.trailing,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
          horizontalTitleGap: 0,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)
              .copyWith(right: 5, left: 15),
          leading: leading,
          title: Text(
            title,
          ),
          trailing: trailing),
    );
  }
}

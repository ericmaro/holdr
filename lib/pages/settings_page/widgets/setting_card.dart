import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holdr/theme/theme.dart';
import 'package:holdr/theme/themeService.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;
  final Function? onPress;
  final Widget? leading;
  const SettingCard(
      {Key? key,
      required this.title,
      this.padding,
      this.onPress,
      this.trailing,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: ThemeService().getThemeState()
            ? Theme.of(context).primaryColor
            : Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: ThemeService().getThemeState()
                ? Theme.of(context).canvasColor
                : Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
          horizontalTitleGap: 0,
          onTap: () => onPress!(),
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

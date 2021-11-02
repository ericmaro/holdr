import 'package:flutter/material.dart';

class Numpad extends StatefulWidget {
  final int length;
  String value;
  final Function(String) onChange;
  Numpad(
      {Key? key,
      required this.length,
      required this.value,
      required this.onChange})
      : super(key: key);

  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  setValue(String val) {
    if (widget.value.length < widget.length) widget.value += val;
    widget.onChange(widget.value);
  }

  backspace(String text) {
    if (text.length > 0) {
      setState(() {
        widget.value = text.split('').sublist(0, text.length - 1).join('');
        widget.onChange(widget.value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      child: Column(
        children: <Widget>[
          Preview(text: widget.value, length: widget.length),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '1',
                onPressed: () => setValue('1'),
              ),
              NumpadButton(
                text: '2',
                onPressed: () => setValue('2'),
              ),
              NumpadButton(
                text: '3',
                onPressed: () => setValue('2'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '4',
                onPressed: () => setValue('4'),
              ),
              NumpadButton(
                text: '5',
                onPressed: () => setValue('5'),
              ),
              NumpadButton(
                text: '6',
                onPressed: () => setValue('6'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '7',
                onPressed: () => setValue('7'),
              ),
              NumpadButton(
                text: '8',
                onPressed: () => setValue('8'),
              ),
              NumpadButton(
                text: '9',
                onPressed: () => setValue('9'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumpadButton(haveBorder: false),
              NumpadButton(
                text: '0',
                onPressed: () => setValue('0'),
              ),
              NumpadButton(
                haveBorder: false,
                icon: Icons.backspace,
                onPressed: () => backspace(widget.value),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Preview extends StatelessWidget {
  final int length;
  final String text;
  const Preview({Key? key, required this.length, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> previewLength = [];
    for (var i = 0; i < length; i++) {
      previewLength.add(Dot(isActive: text.length >= i + 1));
    }
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Wrap(children: previewLength));
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).listTileTheme.iconColor : Colors.transparent,
          border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool haveBorder;
  final Function()? onPressed;
  const NumpadButton(
      {Key? key, this.text, this.icon, this.haveBorder = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle =
        TextStyle(fontSize: 22.0, color: Theme.of(context).listTileTheme.iconColor);
    Widget label = icon != null
        ? Icon(
            icon,
            color: Theme.of(context).listTileTheme.iconColor!.withOpacity(0.8),
            size: 35.0,
          )
        : Text(this.text ?? '', style: buttonStyle);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: OutlineButton(
        borderSide:
            haveBorder ? BorderSide(color: Colors.grey[400]!) : BorderSide.none,
        highlightedBorderColor: icon != null
            ? Colors.transparent
            : Theme.of(context).primaryColor.withOpacity(0.3),
        splashColor: icon != null
            ? Colors.transparent
            : Theme.of(context).primaryColor.withOpacity(0.1),
        padding: EdgeInsets.all(20.0),
        shape: CircleBorder(),
        onPressed: onPressed,
        child: label,
      ),
    );
  }
}

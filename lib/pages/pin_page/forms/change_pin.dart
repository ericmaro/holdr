import 'package:flutter/material.dart';
import 'package:holdr/pages/pin_page/widgets/num_pad.dart';

class ChangePinForm extends StatefulWidget {
  final Function(String) onSubmit;
  final bool confirm;
  final bool? hasError;
  ChangePinForm(
      {Key? key, required this.confirm, this.hasError, required this.onSubmit})
      : super(key: key);

  @override
  State<ChangePinForm> createState() => _ChangePinFormState();
}

class _ChangePinFormState extends State<ChangePinForm> {
  String _value = '';
  List<String> _pairValues = [];

  setPairValue(String value) {
    setState(() {
      _pairValues.add(value);
      //reset _value to empty strings
      _value = '';
      //if _pairValue length is 2, then compare values in array if they match,
      //then submit first value with widget.onSubmit() else reset array
      if (_pairValues.length == 2) {
        if (_pairValues[0] == _pairValues[1]) {
          widget.onSubmit(_pairValues[0]);
          _pairValues = [];
        } else {
          _pairValues = [];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (widget.confirm)
        Center(
          child: Text(_pairValues.length == 0 ? "Enter pin" : "Confirm PIN"),
        ),
      Numpad(
          length: 4,
          shake: widget.hasError != null && widget.hasError!,
          onChange: (value) {
            //if value length is 4 setPairValue else do Nothing while set _value
            if (value.length == 4) {
              //if widget.confirm is true, then submuit value with widget.onSubmit()
              if (!widget.confirm) {
                widget.onSubmit(value);
                //set  state value _value to empty string
                setState(() {
                  _value = '';
                });
              } else {
                setPairValue(value);
              }
            } else {
              setState(() {
                _value = value;
              });
            }
          },
          value: _value)
    ]);
  }
}

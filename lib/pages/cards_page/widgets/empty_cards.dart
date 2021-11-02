import 'package:flutter/widgets.dart';

class EmptyCards extends StatelessWidget {
  const EmptyCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty.png'),
            Text(
              "It appears that you dont have a card yet, Lets create one using a plus add button below!",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

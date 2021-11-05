import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EmptyCards extends StatelessWidget {
  const EmptyCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: Get.height - 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: Image.asset('assets/images/empty.png',
                  colorBlendMode: BlendMode.multiply),
            ),
            SizedBox(height: 20),
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

import 'package:holdr/pages/cards_page/models/bank_card.dart';
import 'package:holdr/pages/cards_page/widgets/card_tags_list.dart';
import 'package:holdr/shared/constants/constants.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDisplay extends StatelessWidget {
  final BankCard card;
  final bool obsecure;
  final Function()? onPressed;
  CardDisplay(
      {Key? key, required this.card, this.onPressed, required this.obsecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cardNumList =
        obsecure ? hideCardNumber(card.cardNumber!) : card.cardNumber!;
    CreditCardType type = detectCCType(card.cardNumber!);
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).viewInsets.bottom == 0 ? 250 : 150,
        width: MediaQuery.of(context).viewInsets.bottom == 0 ? null : 250,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: card.color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DisplayTagList(tags: card.tags),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  fit: cardNumList.length > 16
                      ? BoxFit.contain
                      : BoxFit.scaleDown,
                  child: Text(
                    cardNumList,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('CVV ${card.cvv}',
                    style: TextStyle(fontSize: 15, color: Colors.grey[300]))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  cardIcon(type),
                  color: Colors.white,
                  size: 40,
                ),
                Row(
                  children: [
                    Text('VALID\nTHRU',
                        style:
                            TextStyle(fontSize: 10, color: Colors.grey[300])),
                    SizedBox(
                      width: 10,
                    ),
                    Text(card.validDate!,
                        style: TextStyle(fontSize: 17, color: Colors.white))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

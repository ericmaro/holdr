import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:starter/pages/cards_page/controllers/card_form_controller.dart';
import 'package:starter/pages/cards_page/widgets/card_tags_list.dart';
import 'package:starter/shared/constants/constants.dart';

class DynamicCardDisplay extends GetWidget<CardFormController> {
  const DynamicCardDisplay({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(() {


      List cardNumList = controller.cardNum.value.text.split(" ");

        return Container(
          height: MediaQuery.of(context).size.height/3,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: tagColors[controller.cardTags[0]] ?? Colors.blue
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DisplayTagList(tags: controller.cardTags),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < cardNumList.length; i++)
                    Text(
                      cardNumList[i],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                ],
              ),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('CVV ${controller.cvvNum.value.text}', style: TextStyle(fontSize: 15, color: Colors.grey[300]))],
              ),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(FontAwesomeIcons.ccVisa, color: Colors.white, size: 40,),
                  Row(
                    children: [
                      Text('VALID\nTHRU', style: TextStyle(fontSize: 10, color: Colors.grey[300])),
                      SizedBox(width: 10,),
                      Text(controller.dateNum.value.text, style: TextStyle(fontSize: 17, color: Colors.white))
                    ],
                  )
                ],
                )
    
            ],
          ),
        );
      }
    );
  }
}
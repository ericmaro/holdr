import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:starter/pages/cards_page/controllers/card_controller.dart';
import 'package:starter/pages/cards_page/controllers/card_form_controller.dart';
import 'package:starter/pages/cards_page/models/bank_card.dart';
import 'package:starter/pages/cards_page/widgets/filter_list.dart';
import 'package:starter/shared/constants/constants.dart';

class CardForm extends GetWidget<CardController> {
  CardForm({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();

  CardFormController _cardFormController = Get.put(new CardFormController());


  

  @override
  Widget build(BuildContext context) {
    BankCard card;

    // if(controller.edit) {
    //   _cardFormController.setUpForm();
    // }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _cardFormController.cardNum.value,
            decoration: blueform.copyWith(labelText: 'Card Number'),
            maxLength: 19,
            validator: (val) => val!.length<19? 'Invalid Card' : null,
            inputFormatters: [CreditCardFormatter()],
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: TextFormField(
                  validator: (val) => val!.length<3? 'Invalid' : null,
                  controller: _cardFormController.cvvNum.value,
                  decoration: blueform.copyWith(labelText: 'CVV'),
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  validator: (val) => val=='' || !val!.contains("/") || dateValidator(val)? 'Invalid Date' : null,
                  controller: _cardFormController.dateNum.value,
                  decoration: blueform.copyWith(labelText: 'Valid Until', hintText: 'MM/YY'),
                  maxLength: 5,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(flex: 4, child: DisplayFilterList(tagList: _cardFormController.cardTags, main: false),),

              Expanded(
                flex: 1,
                child: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: Colors.grey)),
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  card = BankCard(cardNumber: _cardFormController.cardNum.value.text, cvv: int.parse(_cardFormController.cvvNum.value.text), validDate: _cardFormController.dateNum.value.text, tags: _cardFormController.cardTags);

                if(controller.edit) {
                  controller.editCard(card);
                }
                else {
                  controller.addCard(card);
                }
                Get.delete<CardFormController>();
                Navigator.pop(context);
                }
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom))
        ],
      ),
    );
  }
}

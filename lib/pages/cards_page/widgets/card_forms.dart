import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:card_app/pages/cards_page/models/bank_card.dart';
import 'package:card_app/pages/cards_page/widgets/tag_widget.dart';
import 'package:card_app/shared/widgets/block_button.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardForm extends GetWidget<CardController> {
  CardForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final cardNumberFormatter = new MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
  final validDateFormatter = new MaskTextInputFormatter(
      mask: 'MM/YY', filter: {"M": RegExp(r'[0-9]'), "Y": RegExp(r'[0-9]')});
  final cvvFormatter =
      new MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    Future<bool> colorPickerDialog() async {
      return ColorPicker(
        color: controller.currentCard.value!.color,
        onColorChanged: (Color color) => controller.selectColor(color),
        width: 40,
        height: 40,
        borderRadius: 4,
        spacing: 5,
        runSpacing: 5,
        wheelDiameter: 155,
        heading: Text(
          'Select color',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subheading: Text(
          'Select color shade',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        wheelSubheading: Text(
          'Selected color and its shades',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        showMaterialName: true,
        showColorName: true,
        showColorCode: true,
        copyPasteBehavior: const ColorPickerCopyPasteBehavior(
          longPressMenu: true,
        ),
        materialNameTextStyle: Theme.of(context).textTheme.caption,
        colorNameTextStyle: Theme.of(context).textTheme.caption,
        colorCodeTextStyle: Theme.of(context).textTheme.bodyText2,
        colorCodePrefixStyle: Theme.of(context).textTheme.caption,
        selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
        pickersEnabled: const <ColorPickerType, bool>{
          ColorPickerType.both: false,
          ColorPickerType.primary: true,
          ColorPickerType.accent: true,
          ColorPickerType.bw: false,
          ColorPickerType.custom: true,
          ColorPickerType.wheel: true,
        },
      ).showPickerDialog(
        context,
        constraints:
            const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
      );
    }

    return Obx(
      () => Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: FormBuilder(
                onChanged: () {
                  _formKey.currentState!.save();

                  controller.editCard(BankCard.fromMap({
                    ...controller.currentCard.value!.toMap(),
                    ..._formKey.currentState!.value
                  }));
                },
                key: _formKey,
                child: Column(children: [
                  FormBuilderTextField(
                    name: 'cardNumber',
                    initialValue: controller.currentCard.value!.cardNumber,
                    keyboardType: TextInputType.number,

                    inputFormatters: [
                      cardNumberFormatter,
                    ],
                    // valueTransformer: (val),
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'validDate',
                            initialValue:
                                controller.currentCard.value!.validDate ==
                                        '2/22'
                                    ? ""
                                    : controller.currentCard.value!.validDate,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              labelText: 'Expiry Date',
                              hintText: 'XX/XX',
                            ),
                            inputFormatters: [validDateFormatter],
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'cvv',
                            textCapitalization: TextCapitalization.sentences,
                            initialValue:
                                controller.currentCard.value!.cvv == '222'
                                    ? ""
                                    : controller.currentCard.value!.cvv,
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                            inputFormatters: [cvvFormatter],
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  )
                ])),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: const Text('Select color below to change this color'),
            subtitle: Text(
                '${ColorTools.materialNameAndCode(controller.currentCard.value!.color)} '
                'aka ${ColorTools.nameThatColor(controller.currentCard.value!.color)}'),
            trailing: ColorIndicator(
                width: 44,
                height: 44,
                borderRadius: 22,
                color: controller.currentCard.value!.color,
                onSelect: () async {
                  // Wait for the dialog to return color selection result.
                  final bool state = await colorPickerDialog();
                }),
          ),
          Container(
              padding: EdgeInsets.all(15),
              child: TagWidget(
                  tags: controller.currentCard.value!.tags,
                  onChanged: (value) {
                    controller.addTag(value);
                  })),
          Container(
            padding: EdgeInsets.all(15),
            child: BlockButton(
              buttonText: 'Save',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.save();
                  Get.back();
                }
              },
            ),
          ),
          if (controller.currentCard.value!.id != null)
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 15),
              child: BlockButton(
                buttonText: 'Delete Card',
                color: Theme.of(context).errorColor,
                onPressed: () {
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.warning,
                      text: 'Are you sure you want to delete this card?',
                      confirmBtnText: "Yes",
                      cancelBtnText: "No",
                      showCancelBtn: true,
                      onConfirmBtnTap: () {
                        controller.deleteCard(controller.currentCard.value!);
                        Get.back();
                      });
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

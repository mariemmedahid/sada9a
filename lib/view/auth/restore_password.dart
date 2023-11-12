import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';
import '../../helper/size_config.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/defaultbutton.dart';
import '../../widgets/lodding_button.dart';


class RestorePassword extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RestorePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: GetBuilder<AuthViewModel>(
              init: AuthViewModel(),
              builder: (auth) {
                return Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(50),
                        right: 20,
                        left: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("dfdfdf"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text:
                                "Veuillez entrer votre numéro de téléphone pour recevoir une vérification"
                                    .tr,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          CustomTextFormField(
                            text: "téléphone".tr,
                            hint: 'Veuillez entrer votre numero téléphone'.tr,
                            prefix: 'assets/icons/Iconly-Curved-Calling.svg',
                            keyboardtype: TextInputType.number,
                            onSave: (value) {
                              auth.phone = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '❌ ' +
                                    'Veuillez entrer votre numéro de téléphone'
                                        .tr;
                              } else if (value.length < 8 || value.length > 8) {
                                return '❌ ' +
                                    'Veuillez entrer un numéro de téléphone valide'
                                        .tr;
                              }
                            },
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          if (auth.istoVerificate)
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                          Visibility(
                            visible: auth.istoVerificate,
                            child: CustomTextFormField(
                              text:
                                  'Veuillez entrer votre code reçu par SMS'.tr,
                              hint: '*****',
                              prefix: 'assets/icons/Iconly-Curved-Password.svg',
                              keyboardtype: TextInputType.number,
                              onSave: (value) {
                                auth.otp = value;
                              },
                              validator: (value) {
                                if (value.length < 5) {
                                  return '❌ ' +
                                      'Veuillez entrer un code valide'.tr;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          // --------------------------------button --------------------

                          auth.isLoading
                              ? Loddingbutton(
                                  loddinColor:
                                      Theme.of(context).backgroundColor,
                                  height: 50,
                                )
                              : Defaultbutton(
                                  textcolor: Colors.white,
                                  text: "envoyer".tr,
                                  haveIcon: true,
                                  onTap: () {
                                    _formKey.currentState!.save();
                                    if (_formKey.currentState!.validate()) {
                                      if (!auth.istoVerificate) {
                                        auth.restorePassword();
                                      } else {
                                        auth.otpRestorePassword();
                                      }
                                    }
                                  },
                                  color: Theme.of(context).primaryColor,
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

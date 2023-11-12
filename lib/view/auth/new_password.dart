import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../Constante.dart';
import '../../Controller/AuthController.dart';
import '../../helper/size_config.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/defaultbutton.dart';
import '../../widgets/lodding_button.dart';


class NewPassword extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                            Text("kjjkjk"),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all((8)),
                              height: (100),
                              width: (100),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Iconly-Curved-Password.svg",
                                color: primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          CustomTextFormField(
                            text: "Nouveaux mot de passe".tr,
                            hint: "Veuillez entrer le mot de passe".tr,
                            prefix: 'assets/icons/Iconly-Curved-Password.svg',
                            keyboardtype: TextInputType.number,
                            obscureText: true,
                            onSave: (value) {
                              auth.password = value;
                            },
                            validator: (value) {
                              if (value.length < 3) {
                                return '❌ ' +
                                    'Veuillez entrer un code valide'.tr;
                              }
                            },
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
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
                                  text: "Envoyer".tr,
                                  haveIcon: true,
                                  onTap: () {
                                    _formKey.currentState!.save();
                                    if (_formKey.currentState!.validate()) {
                                      auth.updatePassword();
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

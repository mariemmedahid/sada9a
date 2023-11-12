import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sadague/view/auth/register_view.dart';
import 'package:sadague/view/auth/restore_password.dart';

import '../../Constante.dart';
import '../../Controller/AuthController.dart';
import '../../helper/size_config.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/defaultbutton.dart';
import '../../widgets/lodding_button.dart';
import '../../widgets/top_rounded_container.dart';


class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passController=new TextEditingController();
  TextEditingController numeroController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   // colors: [primaryColor, Color(0xff6441a5)],
            //   begin: Alignment.bottomLeft,
            //   end: Alignment.topRight,
            // ),
            ),
        child: SingleChildScrollView(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image.asset(
                          //   "assets/images/logo+name.png",
                          //   width: 100,
                          // ),
                          SizedBox(
                            height: getProportionateScreenHeight(60),
                          ),
                          // CustomTextGradiant(
                          //   text: "Se connecter".tr,
                          //   fontSize: 20,
                          // ),
                          Center(
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/logo.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          const Center(
                              child: Text("صدقة")),
                          // SizedBox(
                          //   height: getProportionateScreenHeight(50),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 20),
                          //   child: Text(
                          //     'Se connecter'.tr,
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 30,
                          //         fontWeight: FontWeight.w500),
                          //   ),
                          // ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          TopRoundedContainer(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(30),
                                right: 20,
                                left: 20,
                              ),
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    controller: numeroController,
                                    text: "رقم الهاتف",
                                    hint: "رقم الهاتف",
                                    prefix:
                                        'assets/images/Iconly-Curved-Calling.svg',
                                    keyboardtype: TextInputType.number,
                                    onSave: (value) {
                                      auth.phone = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '❌ ' +
                                            "Veuillez entrer votre numéro de téléphone"
                                                .tr;
                                      } else if (value.length < 8 ||
                                          value.length > 8) {
                                        return '❌ ' +
                                            'Veuillez entrer un numéro de téléphone valide'
                                                .tr;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(30),
                                  ),
                                  CustomTextFormField(
                                    controller: passController,
                                    text: "كلمة السر",
                                    hint: "*****".tr,
                                    prefix:
                                        'assets/images/Iconly-Curved-Password.svg',
                                    keyboardtype: TextInputType.number,
                                    obscureText: true,
                                    onSave: (value) {
                                      auth.password = value;
                                    },
                                    validator: (value) {
                                      if (value.length < 3) {
                                        return '❌ ' +
                                            "Veuillez entrer le mot de passe valide"
                                                .tr;
                                      }
                                    },
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Visibility(
                                        visible: !auth.isLoading,
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(() => RestorePassword());
                                          },
                                          child: const Text(
                                            'هل نسيت كلمة السر ؟',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                          onTap: () {
                                            _formKey.currentState!.save();

                                            if (_formKey.currentState!
                                                .validate()) {
                                            auth.Login(passController.text, int.parse(numeroController.text));
                                            }
                                          },
                                          color: primaryColor,
                                          textcolor: Colors.white,
                                          text: "تسجيل الدخول",
                                          haveIcon: true,
                                        ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Center(
                                    child: Text(
                                      'أو'.tr,
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Visibility(
                                    visible: !auth.isLoading,
                                    child: Defaultbutton(
                                      onTap: () {
                                        Get.to(() => RegisterView());
                                      },
                                      haveBorder: true,
                                      textcolor: primaryColor,
                                      text: "إنشاء حساب",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),

                                  // --------------------------------lang --------------------

                                  // GetBuilder<LangController>(
                                  //   init: LangController(),
                                  //   builder: (langauth) {
                                  //     return Center(
                                  //       child: DropdownButton<String>(
                                  //           isDense: true,
                                  //           icon: const Icon(
                                  //             Icons.keyboard_arrow_down_rounded,
                                  //             color: Colors.grey,
                                  //             size: 18,
                                  //           ),
                                  //           value: langauth.lang,
                                  //           onChanged: (value) {
                                  //             langauth
                                  //                 .changeLang(value ?? 'fr');
                                  //           },
                                  //           underline: Container(
                                  //             color: Colors.white,
                                  //           ),
                                  //           items: const [
                                  //             DropdownMenuItem<String>(
                                  //               value: 'fr',
                                  //               child: Text(
                                  //                 'Francais',
                                  //                 style: TextStyle(
                                  //                   fontSize: 12,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //             DropdownMenuItem<String>(
                                  //                 value: 'ar',
                                  //                 child: Text(
                                  //                   'العربية',
                                  //                   style: TextStyle(
                                  //                     fontSize: 14,
                                  //                   ),
                                  //                 )),
                                  //             DropdownMenuItem<String>(
                                  //               value: 'en',
                                  //               child: Text(
                                  //                 'English',
                                  //                 style: TextStyle(
                                  //                   fontSize: 12,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ]),
                                  //     );
                                  //   },
                                  // ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(150),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constante.dart';
import '../../Controller/AuthController.dart';
import '../../helper/size_config.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/defaultbutton.dart';
import '../../widgets/lodding_button.dart';

class RegisterView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<AuthViewModel>(
        builder: (auth) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                right: 20,
                left: 20,
              ),
              child:Form(
                key: _formKey,
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        ),                      // const SizedBox(
                        //   height: 10,
                        // ),
                        // CustomText(
                        //   text: "C’est rapide et facile.".tr,
                        //   fontSize: 14,
                        //   color: Colors.grey,
                        // ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 5,
                        //   ),
                        //   child: CustomText(
                        //     text: 'Photo'.tr,
                        //     fontSize: 14,
                        //     color: Colors.grey.shade900,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     showPickerCreateCompte();
                        //   },
                        //   child: Container(
                        //     child: (auth.photo != null)
                        //         ? (!auth.isLoadingImage)
                        //             ? Container(
                        //                 width: (100),
                        //                 height: (100),
                        //                 margin: const EdgeInsets.only(
                        //                   right: 10,
                        //                 ),
                        //                 decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   image: DecorationImage(
                        //                     image: FileImage(
                        //                       auth.photo!,
                        //                     ),
                        //                     fit: BoxFit.cover,
                        //                   ),
                        //                 ),
                        //               )
                        //             : Container(
                        //                 decoration: BoxDecoration(
                        //                     color: Colors.grey[200],
                        //                     borderRadius:
                        //                         BorderRadius.circular(25)),
                        //                 width: 100,
                        //                 height: 100,
                        //                 child: const SpinKitRing(
                        //                   color: Colors.black38,
                        //                   lineWidth: 2,
                        //                 ),
                        //               )
                        //         : Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.grey[200],
                        //                 borderRadius: BorderRadius.circular(25)),
                        //             width: 100,
                        //             height: 100,
                        //             child: Icon(
                        //               Icons.add,
                        //               color: primaryColor,
                        //               size: 35,
                        //             ),
                        //           ),
                        //   ),
                        // ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        CustomTextFormField(
                          text: 'الإسم الكامل',
                          hint:
                          'الإسم الكامل',
                          prefix: 'assets/icons/Icon_material-person-outline.svg',
                          onSave: (value) {
                            auth.name = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '❌ ' + 'Veuillez entrer un nom valide'.tr;
                            }
                          },
                        ),
                        // SizedBox(
                        //   height: getProportionateScreenHeight(30),
                        // ),
                        // CustomTextFormField(
                        //   text: "email".tr,
                        //   hint: 'medmahmoud@gmail.com',
                        //   prefix: 'assets/icons/Iconly-Curved-Message.svg',
                        //   onSave: (value) {
                        //     auth.email = value;
                        //   },
                        //   validator: (value) {
                        //     if (isEmail(value) == false) {
                        //       return '❌ ' + 'Veuillez entrer un email valide'.tr;
                        //     }
                        //   },
                        // ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        CustomTextFormField(
                          text: "رقم الهاتف",
                          hint: "رقم الهاتف",
                          prefix: 'assets/icons/Iconly-Curved-Calling.svg',
                          keyboardtype: TextInputType.number,
                          onSave: (value) {
                            auth.phone = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '❌ ' +
                                  'Veuillez entrer votre numéro de téléphone'.tr;
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
                        CustomTextFormField(
                          text: "كلمة السر",
                          hint: "كلمة السر",
                          prefix: 'assets/icons/Iconly-Curved-Password.svg',
                          keyboardtype: TextInputType.number,
                          onSave: (value) {
                            auth.password = value;
                          },
                          validator: (value) {
                            if (value.length < 5) {
                              return '❌ ' +
                                  'Veuillez entrer un mot de passe valide'.tr;
                            }
                          },
                        ),
                        if (auth.istoVerificate)
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                        Visibility(
                          visible: auth.istoVerificate,
                          child: CustomTextFormField(
                            text: 'أدخل كود من 6 أرقام وصلك عبر sms'.tr,
                            hint: '*****',
                            prefix: 'assets/icons/Iconly-Curved-Password.svg',
                            keyboardtype: TextInputType.number,
                            onSave: (value) {
                              auth.otp = value;
                            },
                            validator: (value) {
                              if (value.length < 5) {
                                return '❌ ' + 'Veuillez entrer un code valide'.tr;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Visibility(
                        //   visible: auth.istoVerificate,
                        //   child: SwitchListTile.adaptive(
                        //       value: auth.isVendor,
                        //       title: Text('Vendeur ou Offre service'),
                        //       activeColor: primaryColor,
                        //       onChanged: (isOpen) {
                        //         auth.setIsVendor(isOpen);
                        //       }),
                        // ),
                        // auth.isVendor
                        //     ? Column(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           SizedBox(
                        //             height: 20,
                        //           ),
                        //           Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //               horizontal: 5,
                        //             ),
                        //             child: CustomText(
                        //               text: 'Categorie'.tr,
                        //               fontSize: 14,
                        //               color: Colors.grey.shade900,
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: 5,
                        //           ),
                        //           DropdownSearch<Category>(
                        //             validator: (value) {
                        //               if (value == null) {
                        //                 return '❌ ' +
                        //                     'Veuillez entrer votre categorie'.tr;
                        //               }
                        //             },
                        //             dropdownDecoratorProps:
                        //                 DropDownDecoratorProps(
                        //                     dropdownSearchDecoration:
                        //                         InputDecoration(
                        //                             hintText:
                        //                                 "Veuillez entrer votre categorie"
                        //                                     .tr,
                        //                             hintStyle: const TextStyle(
                        //                               color: Colors.black38,
                        //                               fontSize: 14,
                        //                             ),
                        //                             prefixIcon: Icon(
                        //                               Icons.category_outlined,
                        //                               color: Colors.black38,
                        //                             ))),
                        //             asyncItems: (String filter) async {
                        //               return AuthViewModel.zeboun?.category ?? [];
                        //             },
                        //             // selectedItem: AuthViewModel.zeboun?.category[0],
                        //             itemAsString: (category) {
                        //               if (Get.locale?.languageCode == 'fr') {
                        //                 return category.nameFr;
                        //               } else if (Get.locale?.languageCode ==
                        //                   'en') {
                        //                 return category.nameEn;
                        //               } else {
                        //                 return category.nameAr;
                        //               }
                        //             },
                        //             onChanged: (Category? data) {
                        //               auth.addCategory(data);
                        //             },
                        //           ),
                        //           (auth.category != null)
                        //               ? Column(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.start,
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: [
                        //                     SizedBox(
                        //                       height: 20,
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.symmetric(
                        //                         horizontal: 5,
                        //                       ),
                        //                       child: CustomText(
                        //                         text: 'classification'.tr,
                        //                         fontSize: 14,
                        //                         color: Colors.grey.shade900,
                        //                       ),
                        //                     ),
                        //                     const SizedBox(
                        //                       height: 5,
                        //                     ),
                        //                     DropdownSearch<Classification>(
                        //                       validator: (value) {
                        //                         if (value == null) {
                        //                           return '❌ ' +
                        //                               'Veuillez entrer votre classification'
                        //                                   .tr;
                        //                         }
                        //                       },
                        //                       dropdownDecoratorProps:
                        //                           DropDownDecoratorProps(
                        //                               dropdownSearchDecoration:
                        //                                   InputDecoration(
                        //                                       hintText:
                        //                                           "Veuillez entrer votre classification"
                        //                                               .tr,
                        //                                       hintStyle:
                        //                                           const TextStyle(
                        //                                         color: Colors
                        //                                             .black38,
                        //                                         fontSize: 14,
                        //                                       ),
                        //                                       prefixIcon: Icon(
                        //                                         Icons
                        //                                             .class_outlined,
                        //                                         color: Colors
                        //                                             .black38,
                        //                                       ))),
                        //                       asyncItems: (String filter) async {
                        //                         return auth
                        //                             .getClassificationWereIdCategory();
                        //                       },
                        //                       // selectedItem: AuthViewModel.zeboun?.category[0],
                        //                       itemAsString: (classification) {
                        //                         if (Get.locale?.languageCode ==
                        //                             'fr') {
                        //                           return classification.nameFr;
                        //                         } else if (Get
                        //                                 .locale?.languageCode ==
                        //                             'en') {
                        //                           return classification.nameEn;
                        //                         } else {
                        //                           return classification.nameAr;
                        //                         }
                        //                       },
                        //                       onChanged: (Classification? data) {
                        //                         auth.addClassification(data);
                        //                       },
                        //                     ),
                        //                   ],
                        //                 )
                        //               : SizedBox(),
                        //           (auth.classification != null)
                        //               ? Column(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.start,
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: [
                        //                     SizedBox(
                        //                       height: 20,
                        //                     ),
                        //                     Padding(
                        //                       padding: const EdgeInsets.symmetric(
                        //                         horizontal: 5,
                        //                       ),
                        //                       child: CustomText(
                        //                         text: 'Place'.tr,
                        //                         fontSize: 14,
                        //                         color: Colors.grey.shade900,
                        //                       ),
                        //                     ),
                        //                     const SizedBox(
                        //                       height: 5,
                        //                     ),
                        //                     DropdownSearch<Place>(
                        //                       validator: (value) {
                        //                         if (value == null) {
                        //                           return '❌ ' +
                        //                               'Veuillez entrer votre Place'
                        //                                   .tr;
                        //                         }
                        //                       },
                        //                       dropdownDecoratorProps:
                        //                           DropDownDecoratorProps(
                        //                               dropdownSearchDecoration:
                        //                                   InputDecoration(
                        //                                       hintText:
                        //                                           "Veuillez entrer votre Place"
                        //                                               .tr,
                        //                                       hintStyle:
                        //                                           const TextStyle(
                        //                                         color: Colors
                        //                                             .black38,
                        //                                         fontSize: 14,
                        //                                       ),
                        //                                       prefixIcon: Icon(
                        //                                         Icons
                        //                                             .place_outlined,
                        //                                         color: Colors
                        //                                             .black38,
                        //                                       ))),
                        //                       asyncItems: (String filter) async {
                        //                         return auth
                        //                             .getPlacesWereIdClassification();
                        //                       },
                        //                       // selectedItem: AuthViewModel.zeboun?.category[0],
                        //                       itemAsString: (classification) {
                        //                         if (Get.locale?.languageCode ==
                        //                             'fr') {
                        //                           return classification.nameFr;
                        //                         } else if (Get
                        //                                 .locale?.languageCode ==
                        //                             'en') {
                        //                           return classification.nameEn;
                        //                         } else {
                        //                           return classification.nameAr;
                        //                         }
                        //                       },
                        //                       onChanged: (Place? data) {
                        //                         auth.place = data;
                        //                       },
                        //                     ),
                        //                   ],
                        //                 )
                        //               : SizedBox(),
                        //         ],
                        //       )
                        //     : SizedBox(),

                        SizedBox(
                          height: 40,
                        ),
                        auth.isLoading
                            ? Loddingbutton(
                          loddinColor: Theme.of(context).backgroundColor,
                          height: 50,
                        )
                            : Defaultbutton(
                          textcolor: Colors.white,
                          text: "انشاء حساب".tr,
                          haveIcon: true,
                          onTap: () async {
                            print("cc :"+ base64Encode(utf8.encode(auth.password!)));
                            _formKey.currentState!.save();
                            // await auth.InsertUser(auth.name!,int.parse(auth.phone!),auth.password!);
                            if (_formKey.currentState!.validate()) {
                              if (!auth.istoVerificate) {
                                auth.verifyPhone();
                              } else {
                                auth.otpVerify();
                              }

                            }
                          },
                          color: primaryColor,
                        ),

                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

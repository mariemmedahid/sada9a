import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadague/helper/size_config.dart';
import 'package:sadague/widgets/top_rounded_container.dart';

import '../../Constante.dart';
import '../../Controller/AdminController.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/defaultbutton.dart';
import '../../widgets/lodding_button.dart';

class Add5abar extends StatefulWidget {

  @override
  State<Add5abar> createState() => _AddMchrou3State();
}

class _AddMchrou3State extends State<Add5abar> {

  final ImagePicker picker = ImagePicker();





  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AdminController>(
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: TopRoundedContainer(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getProportionateScreenHeight(20),),
                          Center(child: Text("اضافة مشروع جديد")),
                          SizedBox(height: getProportionateScreenHeight(30),),
                          CustomTextFormField(
                            controller: controller.nomProjetController,
                            text: "العنوان",
                            hint: "العنوان",
                            keyboardtype: TextInputType.text,
                            onSave: (value) {
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '❌ ' +
                                    "ادخل بيانات صالحة"
                                        .tr;
                              }
                            },
                          ),
                          SizedBox(height: getProportionateScreenHeight(30),),
                          CustomTextFormField(
                            controller: controller.DescriptionController,
                            text: "الوصف",
                            hint: "الوصف",
                            keyboardtype: TextInputType.text,
                            onSave: (value) {
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '❌ ' +
                                    "ادخل بيانات صالحة"
                                        .tr;
                              }
                            },
                          ),

                          SizedBox(height: getProportionateScreenHeight(25),),


                          controller.imageFile==null?      InkWell(
                            onTap: () async {
                              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                              controller.imageFile=File(image!.path);
                              setState(() {

                              });
                            },
                            child: Container(
                              height: getProportionateScreenHeight(200),
                              width: double.infinity,
                              color: Colors.grey.shade50,

                              child: Center(child: Text("اضافة صورة",style: TextStyle(color: primaryColor),)),
                            ),
                          ):InkWell(
                            onTap: () async {
                              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                              controller.imageFile=File(image!.path);
                              setState(() {

                              });
                            },
                            child: Container(
                                height: getProportionateScreenHeight(200),
                                width: double.infinity,
                                child: Image.file(controller.imageFile!,    height: getProportionateScreenHeight(200),fit: BoxFit.cover,)),
                          ),
                          SizedBox(height: getProportionateScreenHeight(220),),
                          controller.isloading
                              ? Loddingbutton(
                            loddinColor:
                            Theme.of(context).backgroundColor,
                            height: 50,
                          )
                              : Defaultbutton(
                            onTap: () async {
                              await controller.Addnews();
                            },
                            color: primaryColor,
                            textcolor: Colors.white,
                            text: "اضافة المقال",
                            haveIcon: true,
                          ),
                        ],
                      ),
                    ),
                  ),),
              ),
            ),
          );
        }
    );
  }
}

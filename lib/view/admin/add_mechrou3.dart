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

class AddMchrou3 extends StatefulWidget {

  @override
  State<AddMchrou3> createState() => _AddMchrou3State();
}

class _AddMchrou3State extends State<AddMchrou3> {
  String dropdownValue = 'سقاية';
  List<String> val=['سقاية', 'مشاريع', 'كفالة', 'مرضى'];
  final ImagePicker picker = ImagePicker();



  int GetType(String nom){
    int type=0;
    if(nom=="سقاية") type=1;
    if(nom=="مشاريع") type=2;
    if(nom=="كفالة") type=3;
    if(nom=="مرضى") type=4;
    return type;
  }


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
                        text: "اسم المشروع",
                        hint: "اسم المشروع",
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
                        text: "وصف المشروع",
                        hint: "وصف المشروع",
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
                        controller: controller.montantController,

                        text: "المبلغ الإجمالي",
                        hint: "المبلغ الإجمالي",
                        keyboardtype: TextInputType.number,
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

                      Text("نوع المشروع"),
                      Container(
                  color: Colors.white,

                  child: DropdownButton<String>(
underline: SizedBox(height: 0,),
                    isExpanded: true,
                    style: TextStyle(color: Colors.black,fontFamily: "Arabic"),
                    // Step 3.
                    value: dropdownValue,
                    // Step 4.
                    items:val
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,

                        ),
                      );
                    }).toList(),
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        controller.TypeP=GetType(newValue);
                      });
                    },
                  ),
                ),
                      SizedBox(height: getProportionateScreenHeight(20),),
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
                      SizedBox(height: getProportionateScreenHeight(20),),
                      controller.isloading
                          ? Loddingbutton(
                        loddinColor:
                        Theme.of(context).backgroundColor,
                        height: 50,
                      )
                          : Defaultbutton(
                        onTap: () async {
await controller.AddProject();
                        },
                        color: primaryColor,
                        textcolor: Colors.white,
                        text: "اضافة المشروع",
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

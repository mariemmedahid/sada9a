import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sadague/Constante.dart';
import 'package:sadague/Model/UserModel.dart';
import 'package:sadague/view/auth/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API.dart';
import '../view/admin/homeAdmin.dart';
import '../view/auth/new_password.dart';
import 'package:http/http.dart' as http;

import '../view/homepage.dart';




class AuthViewModel extends GetxController {
  String? phone = '', password = '', name = '', otp = '';
  String verId = '';
  fireAuth.User? _user = fireAuth.FirebaseAuth.instance.currentUser;
  get user => _user;
  bool isLoading = false;
  bool istoVerificate = false;
  late String token;
  fireAuth.FirebaseAuth auth = fireAuth.FirebaseAuth.instance;
  fireAuth.ConfirmationResult? confirmationResult;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  @override
  void onInit() {
    super.onInit();

  }




  Future<bool> Login(String mdps ,int tel) async {
    final SharedPreferences prefs = await _prefs;
    update();
    isLoading=true;
    bool isOk=false;
    Map<String, dynamic> payload = {

      "tel": tel,
      "mdp":base64Encode(utf8.encode(mdps)),


    };
    String jsonPayload = json.encode(payload);
    final reponse = await http.post(
      Uri.parse(API_LOGIN),
      headers: {'Content-Type': 'application/json'},
      body: jsonPayload,
    );
print("st"+reponse.body.toString());
    if(reponse.statusCode==200){
      final data = jsonDecode(utf8.decode(reponse.bodyBytes));
      if(data.length>0){
        isOk=true;
        UserModel u = UserModel.fromJson(data[0] as Map<String, dynamic>);
        prefs.setInt("id", u.id_user!);
        prefs.setInt("type", u.typeU!);
        prefs.setString("nom", u.nom!);
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: "+222${tel}@sada9a.mr" ,password: mdps);

        u.typeU==0?
        Get.offAll(Homepage()):Get.offAll(HomeAdmin());

      }else{
        Get.snackbar("خطأ", "معلومات غير صحيحة",backgroundColor: Colors.redAccent);
      }

    }

isLoading=false;
    update();

    return isOk;
  }


  verifyPhone() async {
    isLoading = true;
    update();
    try {
      await auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 120),
          phoneNumber: '+222$phone',
          verificationCompleted:
              (fireAuth.AuthCredential authCredential) async {
            if (authCredential.token != null) {
              fireAuth.UserCredential userCredential =
              await auth.signInWithCredential(authCredential);
              // await FirebaseFirestore.instance
              //     .runTransaction((transaction) async {
              await userCredential.user?.updateEmail('+222$phone@sada9a.mr');
              await userCredential.user?.updatePassword(password ?? '');
              await userCredential.user?.updateDisplayName(name);


          // save to users


              // isLoading = false;
              // }, onError: (e) {
              //   print("Error updating document $e");
              // });

              // update();

              print('sign complet ---- ');
              // Get.back(result: userCredential.user);
            }
          },
          verificationFailed: (authException) {
            isLoading = !isLoading;
            update();
            Get.rawSnackbar(
              messageText: Text(
                'Une erreur est survenue'.tr,

                style: TextStyle(color: Colors.red),
              ),
            );
          },
          codeSent: (String id, forceResent) {
            verId = id;
            print('code sent');
            isLoading = !isLoading;
            istoVerificate = true;
            update();
          },
          codeAutoRetrievalTimeout: (id) {
            print('codeAutoRetrievalTimeout $id');
            istoVerificate = false;
            isLoading = false;
            update();
            Get.rawSnackbar(
              messageText: Text(
                'Une erreur est survenue'.tr,

                style: const TextStyle(color: Colors.red),
              ),
            );
            verId = id;
          });
    } catch (e) {
      isLoading = !isLoading;
      print(e);
      update();
      Get.rawSnackbar(
        messageText: Text(
          'Une erreur est survenue'.tr+e.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
  }

  //---------------------otp sign up-------
  otpVerify() async {
    isLoading = true;
    update();
    try {
      fireAuth.UserCredential? userCredential = await auth.signInWithCredential(
          fireAuth.PhoneAuthProvider.credential(
              verificationId: verId, smsCode: otp ?? ''));
      if (userCredential.user != null) {
        // await FirebaseFirestore.instance.runTransaction((transaction) async {
        await userCredential.user?.updateEmail('+222$phone@sada9a.mr');
        await userCredential.user?.updatePassword(password ?? '');
        await userCredential.user?.updateDisplayName(name);
 // save user here

UserModel user =UserModel(
   4,
  name,
    int.parse(phone!),
  password,
  0

);
       await InsertUser(name!,int.parse(phone!),password!);
      }
    } on fireAuth.FirebaseAuthException catch (e) {
      istoVerificate = false;
      if (e.code == 'account-exists-with-different-credential') {
        fireAuth.AuthCredential? pendingCredential = e.credential;
        String? phone = e.phoneNumber;
        isLoading = false;
        print('------$phone-------$pendingCredential--------');
        print(e.message);
      } else if (e.code == 'invalid-verification-code') {
        print('error ${e.code}');
        isLoading = false;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'votre code OTP est incorrect.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      }
      if (e.code == 'email-already-in-use') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Cette adresse email est déjà utilisée.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      } else if (e.code == 'invalid-email') {
        print('error ${e.code}');

        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Cette adresse email est invalide.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      } else if (e.code == 'invalid-verification-code') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'votre code OTP est incorrect.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      } else if (e.code == 'weak-password') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Le mot de passe doit contenir au moins 6 caractères.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      } else {
        isLoading = false;
        print('error ${e.code}');
        update();
        Get.rawSnackbar(
            messageText: Text(
                'Une erreur est survenue'.tr+e.toString(),
              style: TextStyle(color: Colors.red),
            ));
      }
    }

    // Handle other OAuth providers...
  }




// insertUser

  Future InsertUser(String nom,int tel,String mdp) async{


    Map<String, dynamic> payload = {
      "nom": nom,
      "tel": tel,
      "mdp": base64Encode(utf8.encode(mdp)),
      "typeU": 0

    };
    String jsonPayload = json.encode(payload);

    try {
// Make the POST request
      var response = await http.post(
        Uri.parse(INSERT_USER),
        headers: {'Content-Type': 'application/json'},
        body: jsonPayload,
      );

      print(response.statusCode);
      print(response.body);

  if (response.statusCode == 200) {
    isLoading=false;
    update();
    Get.snackbar("تم بنجاح", "تم انشاء الحساب بنجاح",backgroundColor: primaryColor,colorText: Colors.white);

    Get.off(LoginView());
  }

}catch(e){
  print(e.toString());
}

  }


  // restore password-----------

  restorePassword() async {
    isLoading = true;
    update();
    try {
      await auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 120),
          phoneNumber: '+222$phone',
          verificationCompleted:
              (fireAuth.AuthCredential authCredential) async {
            if (authCredential.token != null) {
              fireAuth.UserCredential userCredential =
              await auth.signInWithCredential(authCredential);

              isLoading = false;
              update();

              Get.to(() => NewPassword());

              print('restore password authomatique ');
            }
          },
          verificationFailed: (authException) {
            isLoading = !isLoading;
            update();
            Get.rawSnackbar(
              messageText: Text(
                'Une erreur est survenue'.tr,

                style: const TextStyle(color: Colors.red),
              ),
            );
          },
          codeSent: (String id, forceResent) {
            verId = id;
            print('code sent');
            isLoading = !isLoading;
            istoVerificate = true;
            update();
          },
          codeAutoRetrievalTimeout: (id) {
            print('codeAutoRetrievalTimeout $id');
            istoVerificate = false;
            isLoading = false;
            update();
            Get.rawSnackbar(
              messageText: Text(
                'Une erreur est survenue'.tr,
                style: const TextStyle(color: Colors.red),
              ),
            );
            verId = id;
          });
    } catch (e) {
      isLoading = !isLoading;
      print(e);
      update();
      Get.rawSnackbar(
        messageText: Text(
                  'Une erreur est survenue'.tr+e.toString(),


          style: const TextStyle(color: Colors.red),
        ),
      );
    }
  }

  otpRestorePassword() async {
    isLoading = true;
    update();
    try {
      fireAuth.UserCredential? userCredential = await auth.signInWithCredential(
          fireAuth.PhoneAuthProvider.credential(
              verificationId: verId, smsCode: otp ?? ''));
      if (userCredential.user != null) {
        isLoading = false;
        update();

        Get.to(() => NewPassword());
        print('restore password complet ');
      }
    } on fireAuth.FirebaseAuthException catch (e) {
      istoVerificate = false;
      if (e.code == 'account-exists-with-different-credential') {
        fireAuth.AuthCredential? pendingCredential = e.credential;
        String? phone = e.phoneNumber;
        isLoading = false;
        print('------$phone-------$pendingCredential--------');
        print(e.message);
      } else if (e.code == 'invalid-verification-code') {
        print('error ${e.code}');
        isLoading = false;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'votre code OTP est incorrect.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      }
      if (e.code == 'email-already-in-use') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Cette adresse email est déjà utilisée.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      } else if (e.code == 'invalid-email') {
        print('error ${e.code}');

        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Cette adresse email est invalide.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      } else if (e.code == 'invalid-verification-code') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'votre code OTP est incorrect.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      } else if (e.code == 'weak-password') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Le mot de passe doit contenir au moins 6 caractères.'.tr,
              style: TextStyle(color: Colors.red),
            ));
      } else {
        isLoading = false;
        print('error ${e.code}');
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Une erreur est survenue'.tr+e.toString(),

              style: TextStyle(color: Colors.red),
            ));
      }
    }

    // Handle other OAuth providers...
  }

//  update password
  updatePassword() async {
    isLoading = true;
    update();
    try {
      await auth.currentUser?.updatePassword(password ?? '').then((value) {
        isLoading = false;
        update();
        Get.offAll(() => LoginView());
      });
    } on fireAuth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('error ${e.code}');
        isLoading = false;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Le mot de passe doit contenir au moins 6 caractères.'.tr,
              style: const TextStyle(color: Colors.red),
            ));
      } else {
        print('error ${e.code}');
        isLoading = false;
        update();
        Get.rawSnackbar(
            messageText: Text(
              'Une erreur est survenue'.tr+e.toString(),

              style: const TextStyle(color: Colors.red),
            ));
      }
    }
  }











}

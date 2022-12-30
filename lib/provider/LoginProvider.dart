import 'package:church/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/LoginScreen.dart';

class LoginProvider extends ChangeNotifier{
  bool isvisible = false;
  bool isvisible2 = false;
  final usernameConroller = TextEditingController();
  final emailConroller = TextEditingController();
  final passwordConroller = TextEditingController();
  bool ispasswordEightcharacter = false;
  bool haspasswordOneUppercase = false;
  bool haspasswordOneLowercase = false;
  bool haspasswordOneSpecialcharacter = false;
  bool haspasswordOnenumber = false;
  final formKey = GlobalKey<FormState>(); 
  onPasswordChanged(String password) {

      final numericRegx = RegExp(r'[0-9]');
      final uppercaseRegx = RegExp(r'(?=.*[A-Z])');
      final lowercaseRegx = RegExp(r'(?=.*[a-z])');
      final specialcharRegx = RegExp(r'(?=.*?[!@#\$&*~])');

      ispasswordEightcharacter = false;
      if (password.length >= 8) {
        ispasswordEightcharacter = true;

        haspasswordOnenumber = false;
        if (numericRegx.hasMatch(password)) {
          haspasswordOnenumber = true;
        }
        haspasswordOneUppercase = false;
        if(uppercaseRegx.hasMatch(password)){
          haspasswordOneUppercase = true;
        }
        if(lowercaseRegx.hasMatch(password)){
          haspasswordOneLowercase = true;
        }
        if(specialcharRegx.hasMatch(password)){
          haspasswordOneSpecialcharacter = true;
        }
      }
      notifyListeners();
  }
  emailValidate(value){
     if(value.isEmpty){
      return "Please enter email";
    }
    if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
      return "Enter valid email";
    }
    else{
      return null;
    }
  }
  onRegister(){
    if(formKey.currentState!.validate()){
      Get.off(()=>const HomePage());
    }
  }

  validatePassword(value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
}
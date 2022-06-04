import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get primaryColor;
  Color get terciaryColor;
  Color get grey;
}

class AppColors implements IAppColors {
  @override
  
  Color get primaryColor => const Color(0xff405EFE);
  
  @override
  Color get terciaryColor => const Color.fromARGB(255, 207, 214, 255);
  
  @override
  Color get grey => const Color(0XFF828282);



}
import 'package:flutter/material.dart';
//Helps to scale size on different device and maintain UI looks

height(double value, BuildContext context) {
    return MediaQuery.of(context).size.height * value;
  }

  width(double value, BuildContext context) {
    return MediaQuery.of(context).size.width * value;
  }
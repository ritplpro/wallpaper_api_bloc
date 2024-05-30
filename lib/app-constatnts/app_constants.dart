// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';



class AppConstants{

  static const List<Map<String,dynamic>> mcategory=[
    {
    "title":"Abstract",
      "image":"assets/images/image1.jpg",
      "color":Color(0XFFfeb7b9),
      "code":"feb7b9",
  },
    {
      "title":"Winter",
      "image":"assets/images/image2.jpg",
      "color":Color(0XFF4165e1),
      "code":"4165e1",

    },
    {
      "title":"Mountaines",
      "image":"assets/images/image3.jpg",
      "color":Color(0XFF6141e1),
      "code":"6141e1",

    },
    {
      "title":"River",
      "image":"assets/images/image4.jpg",
      "color":Color(0XFF5fbfc1),
      "code":"5fbfc1",

    },
    {
      "title":"Caves",
      "image":"assets/images/image5.jpg",
      "color":Color(0XFF000000),
      "code":"000000",

    },
    {
      "title":"Nature",
      "image":"assets/images/image6.jpg",
      "color":Color(0XFFff9a0c),
      "code":"ff9a0c",

    },
    {
      "title":"Dessert",
      "image":"assets/images/image7.jpg",
      "color":Color(0XFFb548eb),
      "code":"b548eb",

    },

  ];







}



List<ColorModel> listColorModel = [
  ColorModel(color: Colors.red, name: 'Red'),
  ColorModel(color: Colors.orange, name: 'Orange'),
  ColorModel(color: Colors.yellow, name: 'Yellow'),
  ColorModel(color: Colors.green, name: 'Green'),
  ColorModel(color: const Color(0xff30D5C8), name: 'Turquoise'),
  ColorModel(color: Colors.blue, name: 'Blue'),
  ColorModel(color: const Color(0xff7F00FF), name: 'Violet'),
  ColorModel(color: Colors.pink, name: 'Pink'),
  ColorModel(color: Colors.brown, name: 'Brown'),
  ColorModel(color: Colors.black, name: 'Black'),
  ColorModel(color: Colors.grey, name: 'Grey'),
  ColorModel(color: Colors.white, name: 'White'),
];

class ColorModel {
  Color? color;
  String? name;
  ColorModel({
    required this.color,
    required this.name,
  });
}

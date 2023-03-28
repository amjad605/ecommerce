import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item{
   int id;
  final String? name;
  final String? category;
  final String? image;
   bool isFav;
  final double? price;
  int quantity=0;
  bool inCart=false;
   Widget Iconfav=Icon(Icons.favorite,color: Colors.red,);
  Item(
      {
        required this.id,

    this.name,
    this.category,
    this.image,
     required this.isFav,
     this.price,


});
}
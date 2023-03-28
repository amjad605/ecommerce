import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget Catrgory(int index)=>GestureDetector(child: Padding(
  padding: const EdgeInsets.all(5),
  child:   Column(
    children: [
          CircleAvatar(backgroundImage:NetworkImage(category2[index]),
      minRadius: 65,
      ),
      SizedBox(height: 10,),
      Text(category[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    ],
  ),
),
);

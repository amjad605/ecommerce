import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/screens/grocery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
List <Item> ?items;

Widget Catrgory(int index, context,items,name)=>GestureDetector(
    onTap: (  ){

      Navigator.push(

        context,
        MaterialPageRoute(
            builder: (context) => Grocery(items,name)));},
  child: Padding(
  padding: const EdgeInsets.all(5),
  child:   Column(
    children: [
          CircleAvatar(backgroundImage:NetworkImage(category2[index]),
      minRadius: 50,
      ),
      SizedBox(height: 10,),
      Text(category[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    ],
  ),
),
);
 PageRouteBuilder scaleTransitionBuilder({required Widget child}) {
return PageRouteBuilder(
  transitionDuration:Duration(milliseconds: 200),
pageBuilder: (context, animation, secondaryAnimation) => child,
transitionsBuilder: (context, animation, secondaryAnimation, child) {
final _scale = animation.drive(Tween<double>(begin: 0, end: 1));

return SlideTransition(

  position: Tween(
      begin: Offset(0.0,0.1),
      end: Offset(0.0, 0.0))
      .animate(animation),
  child: child,
);
});
}
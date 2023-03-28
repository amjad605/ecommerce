import 'package:ecommerce/components/constance/color.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget{
  final String text;
  IconData? icon;
  Function onPressed;
  InfoCard(
      {required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed(),
      child: Card(
          color: Colors.grey[200],
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: ListTile(
            leading: Icon(
              icon,
              color:Color.fromARGB(255, 110, 73, 166),
            ),
            title: Text(
              text,
              style: TextStyle(
                color: defaultcolor2,
                fontSize:20,
                fontWeight: FontWeight.bold,

              ),
            ),
          )

      ),

    ) ;
  }

}
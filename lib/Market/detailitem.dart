import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
 Item item;

 DetailItem({required this.item});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(backgroundColor:defaultColor,),
     body: Column(
     children: [
      Container(
       width: double.infinity,
       height: 300,

       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Image.network('${item.image}'),
       ),
      ),
      Row(
       children: [

        Text('${item.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60),),

       ],
      )
     ],
     ),
    ) ;
  }
}

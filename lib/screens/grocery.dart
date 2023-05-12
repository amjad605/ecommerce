import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:ecommerce/screens/fav.dart';
import 'package:ecommerce/screens/itembuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Grocery extends StatelessWidget {
late List<Item> items;
String name;

Grocery(this.items,this.name);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white60,
        title: Text('${name}',style: TextStyle(color: Colors.black,fontSize: 25),),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: defaultcolor2,),onPressed:(){
          Navigator.pop(context);
        }),
      ),
      body:provider.items.length>0?
      SafeArea(
        minimum: EdgeInsets.all(20),
        child: Container(


          child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          )

            , itemBuilder: (context,index)=>Itembuilder(item: items[index],context:context),
            itemCount:items.length,



          ),
        ),
      ):Container(

      ),
    ) ;
  }
}

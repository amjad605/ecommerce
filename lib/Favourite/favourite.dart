import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/screens/fav.dart';
import 'package:ecommerce/screens/itembuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/constance/constant/const.dart';
import '../provider/home_provider.dart';

class Favourite extends StatefulWidget {

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {


@override
  void initState() {
 // Provider.of<HomeProvider>(context, listen: false).getfav();
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    if(provider.favItem.length>0){
    return Scaffold(

      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Container(


          child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          )

            , itemBuilder: (context,index)=>Itembuilder(item: provider.favItem[index],context:context),
            itemCount:provider.favItem.length,



          ),
        ),
      ),
      //ListView.builder(itemBuilder: (context , index) {
       // return fav(item: provider.favItem[index]);
     // },
         // itemCount: provider.favItem.length,)



    );}
    else
      {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.heart_broken,size: 40,color: Colors.grey,),
                Text('No Favourite items',style: TextStyle(fontSize: 40,color: Colors.grey),),
              ],
            ),
          ),
        );
      }

  }

}

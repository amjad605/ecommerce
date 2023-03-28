import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:ecommerce/screens/fav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    if(provider.cartItem.length>0){
    return Scaffold(
body: ListView.separated(itemBuilder: (context,index)=>fav(item: provider.cartItem[index]), separatorBuilder:(context,index)=>  Container(width: double.infinity,height: 1.0,color: Colors.grey[300],), itemCount: provider.cartItem.length),
  bottomSheet:Container(
    child: Row(
      children: [
        Text('Total price :',style: TextStyle(color:defaultcolor2,fontSize: 25,fontWeight: FontWeight.bold),),
        SizedBox(width: 100,),
        Text('${provider.TotalSum.toStringAsFixed(2)} LE',style: TextStyle(color: defaultcolor2,fontSize: 20,fontWeight: FontWeight.bold),maxLines: 1,),
      ],
    ),
    width: double.infinity,
    color: Colors.white60,
    height: 100,

  ),
    );
  }else
    {
      return Scaffold(
        body: Center(
          child: Image.network('https://cdn-icons-png.flaticon.com/512/2762/2762885.png'),
        ),
      );
    }
}
}

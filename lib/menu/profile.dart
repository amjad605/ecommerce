
import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/menu/info_card.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/cart.dart';


class profile extends StatelessWidget{
  Widget build(BuildContext context){
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
appBar: AppBar(
  backgroundColor: defaultColor,
  elevation: 0,
automaticallyImplyLeading: false,
scrolledUnderElevation: 10,
  toolbarHeight: 250,
  shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(390),

      ),),

  leadingWidth: 100,
title: Container(
  padding: EdgeInsetsDirectional.only(top: 40),
  alignment: Alignment.center,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      Stack(

        children :[ CircleAvatar(radius: 70,
            backgroundColor: defaultcolor2,
            child:Text(provider.user!.name[0],style: TextStyle(fontSize: 80,color: Colors.white),)
          // Icon(Icons.person,size: 120,color: Colors.blueGrey,),backgroundColor: Colors.grey[300],
        ),


          // CircleAvatar(child: IconButton(icon: Icon(Icons.add),onPressed: (){},),radius: 20,
          // backgroundColor: defaultColor,),

        ],
        alignment: AlignmentDirectional.bottomEnd,
      ),
      SizedBox(height: 30,),


    ],
  ),

) ,

),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            Container(


              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[50]),
              child: MaterialButton(onPressed: (){},child:
              Row(children: [
                Icon(Icons.email, color: defaultColor,),
                SizedBox(width: 15,),
                Text(provider.user!.email,style: TextStyle(fontSize: 16),),

              ],),),
            ),
            SizedBox(height: 10,),
            Container(


              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[50]),
              child: MaterialButton(onPressed: (){},child:
              Row(children: [
                Icon(Icons.person, color: defaultColor,),
                SizedBox(width: 15,),
                Text(provider.user!.name,style: TextStyle(fontSize: 16),),

              ],),),
            ),
            SizedBox(height: 10,),
            Container(


              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[50]),
              child: MaterialButton(onPressed: (){},child:
              Row(children: [
                Icon(Icons.phone_android, color: defaultColor,),
                SizedBox(width: 15,),
                Text(provider.user!.phoneNo,style: TextStyle(fontSize: 16),),

              ],),),
            ),
            SizedBox(height: 10,),
            Container(


              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[50]),
              child: MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(build)=>Cart()));
              },child:
              Row(children: [
                Icon(Icons.shopping_cart_rounded, color: defaultColor,),
                SizedBox(width: 15,),
                Text('Cart',style: TextStyle(fontSize: 16),),
                SizedBox(width: 210,),
                CircleAvatar(child: Text('${provider.cartItem.length}',style: TextStyle(color: Colors.white),),
                backgroundColor: defaultColor,
                radius: 15,
                )


              ],),),
            ),
            SizedBox(height: 10,),
            Container(


              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[50]),
              child: MaterialButton(onPressed: (){},child:
              Row(children: [
                Icon(Icons.settings, color: defaultColor,),
                SizedBox(width: 15,),
                Text('Settings',style: TextStyle(fontSize: 16),),

              ],),),
            ),
SizedBox(height: 80,),


Center(child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.logout,color: Colors.red,),
        TextButton(onPressed: (){

          Navigator.pushNamed(context, '/' );


    },child: Text("LOGOUT",style: TextStyle(color: Colors.red,fontSize: 18),),),
  ],
),)


          ],
        ),
      ),
    );
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//
//           child: Expanded(
//             child: Container(
// width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children:<Widget> [
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 50,
//                     child: Image.asset('assets/images/shop.png'),
//                   ),
//                   Text(
//                     "MARKTFY",
//                     style: TextStyle(
//                       fontSize: 40.0,
//                       color: Color.fromARGB(255, 101, 40, 154),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Welcome to Marktfy",
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.blueGrey[200],
//                       letterSpacing: 2.5,
//                       fontWeight: FontWeight.bold,
//
//
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                     width: 100,
//                     child: Divider(color:Color.fromARGB(255, 102, 58, 152),),
//                   ),
//                   InfoCard(text: phone,  onPressed: ()  {}),
//                   InfoCard(text: location, onPressed: ()  {}),
//                   InfoCard(text: email,  onPressed: ()  {}),
//                   SizedBox(height: 40,),
//                   MaterialButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (build)=>Login()));
//                   },
//                   child: Text('LOGOUT',style: TextStyle(color: Colors.white),),
//                   color: defaultcolor2,)
//                 ],
//
//               ),
//             ),
//           ),
//         )
//
//
//     );
  }
}
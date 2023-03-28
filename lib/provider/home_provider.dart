

import 'dart:core';

import 'package:ecommerce/Helperdp/databasehelper.dart';
import 'package:ecommerce/Market/market.dart';
import 'package:ecommerce/cart/cart.dart';
import 'package:ecommerce/menu/profile.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/models/usermodel.dart';
//import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Favourite/favourite.dart';

class HomeProvider extends ChangeNotifier {
 double  TotalSum=0;

  List<BottomNavigationBarItem> bottomItems=[

    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Fav'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),



  ];
  List<GButton>icons=[GButton(icon :Icons.home,text: 'home'),
    GButton(icon :Icons.favorite,text: 'Favoutite'),
    GButton(icon :Icons.shopping_cart,text: 'Cart'),
    GButton(icon :Icons.person,text: 'Profile')

 ];

  var indexed=0;
  List<Widget> screens=[
    Fakha(),
    Favourite(),
    Cart(),
    profile(),



  ];

 List<Item> a = [];
 List<Item> b = [];
 List<Item> c = [];
 List<Item> e = [];


Widget favicon=Icon(
  Icons.favorite_border,
);



 List<Item> items = [];
  List<Item>favItem=[];
  List <Item>cartItem=[];
  var quantity;
var Iconfav=Icon(Icons.add);
void plus(Item item){
  TotalSum+=item.price as double;

   item.quantity++;
   notifyListeners();
}
  void minus(Item item){
  if(item.quantity==0){
    removefromcart(item);
  }
if(item.quantity>1){
item.quantity--;
TotalSum-=item.price as double;
}


    notifyListeners();
  }
  void addItem(Item item) async {
    DatabaseHelper.newItem(item);
    // if(item.category=="a"){
    //   a.add(item);
    // }
    // else if(item.category=="b"){
    //   b.add(item);
    // }
    // else if(item.category=="c"){
    //   c.add(item);
    // }
    //
    // else if (item.category=="e"){
    // items.add(item);}

    notifyListeners();
  }

  void getItemsFromDB() async {





      items= await DatabaseHelper.getAllItems();

      for (var o in items) {
        if(o.category=="a"){
          a.add(o);
        }
        if(o.category=="b"){
          b.add(o);
        }
        if(o.category=="c"){
         if(! c.contains(o)) {
           c.add(o);
         }
        }
        if(o.category=="e"){
          e.add(o);
        }

      }

   notifyListeners();





//   for (var o in items) {
//     if(o.isFav){
//
//       favItem.add(o);
//       items.remove(o);}
//
//     if(o.category=="a"){
//
//       a.add(o);
//       items.remove(o);
//
//     }
// if(o.category=="b"){
//
//     b.add(o);
//     items.remove(o);}
//     if(o.category=="c"){
//
//         c.add(o);
//         items.remove(o);
//
//
//     }
//
//
//
//
//   }

  }

 void updateItem(Item item)async{

   DatabaseHelper.updateItem(item);
  // DatabaseHelper.updateItems(item);
   // if(item.isFav){
   //   favItem.add(item);
   // }
   // else{
   //   item.isFav=false;
   //   favItem.remove(item);
   // }

   notifyListeners();
 }




  void deleteItem(Item item){
    DatabaseHelper.deleteItem(item.id);
    items.removeWhere((element) => element.id == item.id);
    // List favor = items.where((element) => element.isFavourite).toList();
    notifyListeners();
  }
  void changenavbar(int index) async{
  indexed=index;

  if(index==1){
    favItem=await DatabaseHelper.getfavItems();
  }

  notifyListeners();


  }
  bool isClicked=false;
  void addtocart(Item item){

 item.inCart=true;

if(cartItem.contains(item)){

  plus(item);
}else {
 plus(item);
  cartItem.add(item);


}


notifyListeners();


  }
  void removefromcart(Item item){
    TotalSum-=item.quantity* (item.price as double);
    cartItem.remove(item);


    notifyListeners();
  }
 void changefav(Item item ) {
   item.isFav=!item.isFav;
  if(item.isFav){


    item.Iconfav= Icon(

      Icons.favorite,
      color: Colors.red,
    ) ;
  }else{
 item.Iconfav  = Icon(
    Icons.favorite_border,

  );}


notifyListeners();
 }
User? user ;
  void getuser(String s)async
  {
    user = await DatabaseHelper.getUser(s);

  }
  void removelove(Item item){
    if(item.isFav!=true)
    item.Iconfav=Icon(Icons.favorite_border);
    notifyListeners();

  }

}

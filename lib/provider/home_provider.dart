import 'dart:core';
import 'package:ecommerce/Helperdp/databasehelper.dart';
import 'package:ecommerce/Market/market.dart';
import 'package:ecommerce/cart/cart.dart';
import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/menu/profile.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Favourite/favourite.dart';
class HomeProvider extends ChangeNotifier {
  double TotalSum = 0;
  var indexed = 0;
  List<Widget> bottomItems = [
   Icon(Icons.home,color: Colors.white),
   Icon(Icons.favorite),
   Icon(Icons.shopping_cart),
     Icon(Icons.person),
  ];
  List<GButton> icons = [
    GButton(icon: Icons.home, text: 'home'),
    GButton(icon: Icons.favorite, text: 'Favoutite'),
    GButton(icon: Icons.shopping_cart, text: 'Cart'),
    GButton(icon: Icons.person, text: 'Profile')
  ];


  List<Widget> screens = [
    Fakha(),
    Favourite(),
    Cart(),
    profile(),
  ];

  List<Item> a = [];
  List<Item> b = [];
  List<Item> c = [];
  List<Item> e = [];
  List<Item> suggested = [];

  Widget favicon = Icon(
    Icons.favorite_border,
  );

  List<Item> items = [];
  List<Item> favItem = [];
  List<Item> cartItem = [];

  var Iconfav = Icon(Icons.add);
  void plus(Item item) {
    TotalSum += item.price as double;

    item.quantity++;
    notifyListeners();
  }

  void minus(Item item) {
    if (item.quantity == 0) {
      removefromcart(item);
    }
    if (item.quantity > 1) {
      item.quantity--;
      TotalSum -= item.price as double;
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

    notifyListeners();
  }

  void getItemsFromDB() async {
    a = [];
    b = [];
    c = [];
    e = [];

    items = await DatabaseHelper.getAllItems();
indexed=0;
    for (var o in items) {
      if (o.category == "a") {
        if (!a.contains(o)) a.add(o);
      }
      if (o.category == "b") {
        if (!b.contains(o)) b.add(o);
      }
      if (o.category == "c") {
        if (!c.contains(o)) {
          c.add(o);
        }
      }
      if (o.category == "e") {
        e.add(o);
      }
    }

    notifyListeners();

  }

  void updateItem(Item item) async {
    DatabaseHelper.updateItem(item);


    notifyListeners();
  }

  void deleteItem(Item item) {
    DatabaseHelper.deleteItem(item.id);
    items.removeWhere((element) => element.id == item.id);
    // List favor = items.where((element) => element.isFavourite).toList();
    notifyListeners();
  }

  void changenavbar(int index) async {
    indexed = index;
if(index==0){
  bottomItems[0]=Icon(Icons.home,color: Colors.white,);
  bottomItems[1]=Icon(Icons.favorite);
  bottomItems[2]=Icon(Icons.shopping_cart);
  bottomItems[3]=Icon(Icons.person);}

   else if (index == 1) {
     bottomItems[1]=Icon(Icons.favorite,color: Colors.white,);
     // bottomItems[0]=Icon(Icons.home,color: Colors.grey.shade300,);
     // bottomItems[2]=Icon(Icons.shopping_cart,color: Colors.grey);
     // bottomItems[3]=Icon(Icons.person,color: Colors.grey,);

      favItem = await DatabaseHelper.getfavItems();


    }
   else if(index==2){
  // bottomItems[0]=Icon(Icons.home,color: Colors.grey,);
  // bottomItems[1]=Icon(Icons.favorite,color: Colors.grey,);
  // bottomItems[2]=Icon(Icons.shopping_cart,color: Colors.white);
  // bottomItems[3]=Icon(Icons.person,color: Colors.grey,);
}
   else if(index==3){
  // bottomItems[0]=Icon(Icons.home,color: Colors.grey,);
  // bottomItems[1]=Icon(Icons.favorite,color: Colors.grey,);
  // bottomItems[2]=Icon(Icons.shopping_cart,color: Colors.grey);
  // bottomItems[3]=Icon(Icons.person,color: Colors.white,);
}



    notifyListeners();
  }

  bool isClicked = false;
  void addtocart(Item item, context) {
    item.inCart = true;

    if (cartItem.contains(item)) {
      plus(item);
    } else {
      if (item.quantity == 0) plus(item);
      cartItem.add(item);
    }

    notifyListeners();
  }

  void addindetails(Item item, context) {
    item.inCart = true;

    if (cartItem.contains(item)) {
      plus(item);
    } else {
      cartItem.add(item);
    }

    notifyListeners();
  }

  void removefromcart(Item item) {
    TotalSum -= (item.quantity) * (item.price as double);
    cartItem.remove(item);
    item.quantity = 0;
    if (cartItem.isEmpty) TotalSum = 0;

    notifyListeners();
  }
// get user from database
  User? user;
  void getuser(String s) async {
    user = await DatabaseHelper.getUser(s);
  }


// this widget is for the fav icon
  Widget favIcon(item) {
    if (item.isFav) {
      return Icon(
        Icons.favorite,
        color: Colors.red,
      );
    } else {
      return Icon(
        Icons.favorite_border,
      );
    }
  }
// this function used to add item to the suggested list according to the catrgory of the clicked item
  void suggest(Item items) {
    if (items.category == 'a') {
      suggested.addAll(a);
      if (suggested.contains(items)) suggested.remove(items);
    } else if (items.category == "b") {
      suggested.addAll(b);
      if (suggested.contains(items)) suggested.remove(items);
    } else {
      suggested.addAll(c);
      if (suggested.contains(items)) suggested.remove(items);
    }
  }
// this function used to clear all the items in the cart when the clear all button clicked
  void clear() {
    cartItem = [];
    TotalSum = 0;
    notifyListeners();
  }
// this function get rid of all the items in the sugggested list at each time w click on an item
  void clearSugessted() {
    suggested = [];
    notifyListeners();
  }
}

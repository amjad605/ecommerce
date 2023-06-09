//import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/Favourite/favourite.dart';
import 'package:ecommerce/Market/market.dart';
import 'package:ecommerce/cart/cart.dart';
import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/components/navdrawer/nav.dart';
import 'package:ecommerce/menu/menu.dart';
import 'package:ecommerce/menu/profile.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce/provider/home_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getItemsFromDB();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(

        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color:Colors.white),

          ),
          child: CurvedNavigationBar(
            height: 65,

            items: provider.bottomItems,
            index: provider.indexed,
            onTap: (index)=>provider.changenavbar(index),
            backgroundColor: Colors.transparent
            ,color:Colors.deepPurpleAccent.shade400,
            buttonBackgroundColor: defaultcolor2,




          ),
        ),





        // Container(
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     boxShadow: [
        //       BoxShadow(
        //         blurRadius: 20,
        //         color: Colors.black.withOpacity(.1),
        //       )
        //     ],
        //   ),
        //   child: SafeArea(
        //     child: Padding(
        //       padding:
        //           const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        //       child: GNav(
        //         rippleColor: Colors.grey[300]!,
        //         hoverColor: Colors.grey[100]!,
        //         gap: 8,
        //         curve: Curves.linear,
        //         activeColor: defaultcolor2,
        //         iconSize: 24,
        //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        //         duration: Duration(milliseconds: 500),
        //         tabBackgroundColor: Colors.transparent!,
        //         tabActiveBorder: Border.all(color: defaultcolor2),
        //         color: defaultColor,
        //         tabs: [
        //           GButton(
        //             icon: Icons.home,
        //             text: 'Home',
        //           ),
        //           GButton(
        //             icon: Icons.favorite,
        //             text: 'Favourite',
        //           ),
        //           GButton(
        //             icon: Icons.shopping_cart,
        //             text: 'Cart',
        //           ),
        //           GButton(
        //             icon: Icons.person,
        //             text: 'Profile',
        //           ),
        //         ],
        //         selectedIndex: provider.indexed,
        //         onTabChange: (index) {
        //           provider.changenavbar(index);
        //         },
        //       ),
        //     ),
        //   ),
        // ),

        appBar: provider.indexed == 3 || provider.indexed == 2
            ? null
            : AppBar(
                backgroundColor: Colors.white70,
                titleSpacing: 2,
                title: Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Image.asset(
                    'assets/images/name2.png',
                    width: 180,
                  ),
                ),
                toolbarHeight: 70,
                elevation: 0,
                // Color(0xffB9E0FF),
                automaticallyImplyLeading: false,
                actions: [
                  Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 10, end: 10, top: 14),
// this widget is for the cart icon in the app bar
                      child: Stack(
                        fit: StackFit.passthrough,
                        alignment: AlignmentDirectional.center,
                        children: [
                          badges.Badge(
                            badgeContent: Text(
                              '${provider.cartItem.length}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            position:
                                badges.BadgePosition.topEnd(end: 14, top: -9),
                            badgeStyle: badges.BadgeStyle(
                                padding: EdgeInsets.all(4),
                                badgeColor: Colors.redAccent),
                            child: MaterialButton(
                              child: Image.asset(
                                'assets/images/shop.png',
                                width: 45,
                                height: 250,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            provider.screens[2]));
                              },
                            ),
                          ),
                        ],
                      ))
                ],
              ),
        body: provider.screens[provider.indexed],
      ),
    );
  }
}

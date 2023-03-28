
import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/menu/info_card.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/material.dart';


class profile extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(

      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
            alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Stack(

                    children :[ CircleAvatar(radius: 100,
                      child: Icon(Icons.person,size: 150,color: Colors.blueGrey,),backgroundColor: Colors.grey[300],
                    ),


              CircleAvatar(child: IconButton(icon: Icon(Icons.add),onPressed: (){},),radius: 20,
              backgroundColor: defaultColor,),

                    ],
                    alignment: AlignmentDirectional.bottomEnd,
                  ),
                  SizedBox(height: 30,),


                ],
              ),

            ),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white70),
              child: MaterialButton(onPressed: (){},child: Text('Personal details'),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
              child: MaterialButton(onPressed: (){},child: Text('Personal details'),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
              child: MaterialButton(onPressed: (){},child: Text('Personal details'),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
              child: MaterialButton(onPressed: (){},child: Text('Personal details'),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
              child: MaterialButton(onPressed: (){},child: Text('Personal details'),),
            ),

Center(child: TextButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder:(build)=>Login()));
},child: Text("LOGOUT",style: TextStyle(color: Colors.red),),),)


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
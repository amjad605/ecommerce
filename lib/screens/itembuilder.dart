import 'package:ecommerce/Market/detailitem.dart';
import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/componentsonstant/const.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Itembuilder extends StatefulWidget {

   Item item;
   var context;


  Itembuilder({Key? key, required this.item,required this.context}) : super(key: key);

  @override
  State<Itembuilder> createState() => _ItembuilderState();
}

class _ItembuilderState extends State<Itembuilder> {

  bool t=false;
  @override
  Widget build(BuildContext context) {


    final provider = Provider.of<HomeProvider>(context, listen: true);
    return GestureDetector(
      onTap: (  ) {
        provider.clearSugessted();
        provider.suggest(widget.item);

       //Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailItem(item: widget.item)));
        Navigator.push(

        context,
          scaleTransitionBuilder (child: DetailItem(item: widget.item,)) );},

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:   Row(
          children: [
            Container(
              padding: EdgeInsetsDirectional.all(10),
              width: 200,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container(

                    child: Stack(alignment: AlignmentDirectional.bottomEnd
                      ,children:[ //Container(child: Image.network('${widget.item?.image}',fit: BoxFit.cover,width: 300,height: 300,scale: 30,),decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(50)),),
                        Container(
                          width: 150,
                          height: 280,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage('${widget.item?.image}'),fit: BoxFit.contain,
                            ),
                          ),

                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            widget.item.isFav = !widget.item.isFav;
    final index = provider.items.indexWhere((element) =>
    element.name == widget.item
    .name);
    if (index >= 0) {
   provider.items[index].isFav=widget.item.isFav;}

                            print('dost ${widget.item.hashCode}');




                            if(widget.item.isFav){
                              provider.favItem.add(widget.item);

                            }
                            else{
                              provider.favItem.remove(widget.item);


                            }
                            provider.updateItem(widget.item);


                          });

                        }, icon:widget.item.isFav?Icon(

                          Icons.favorite,
                          color: Colors.red,
                        ):Icon(
                          Icons.favorite_border,
                        ),) ],

                    ),
                  ),
                  ),
                  Container(width:180,
                      child: Text('${widget.item?.name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1)),
                  SizedBox(width: 30,),
                  Text('${widget.item?.price} LE',style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis,color: Colors.grey[800]),),
                  Container(
                    width: 120,
                    height: 30,

                    decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: defaultcolor2),

                    ),

                    child: MaterialButton(onPressed: (){
                      provider.addtocart(widget.item,context);

                    },child:Text("add to cart"),splashColor:defaultcolor2,



                    ),
                  )



                ],
              ),
            ),

          ],
        ),
      ),
    );

  }

  Widget favIcon(item) {
    if (widget.item.isFav) {
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
}
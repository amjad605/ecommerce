import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends Dialog {

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController=TextEditingController();
  final descriptionController=TextEditingController();
  List<DropdownMenuItem<String>> get  dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Grocery"),value: "a"),
    DropdownMenuItem(child: Text("Fruit"),value: "b"),
    DropdownMenuItem(child: Text("Vegetable"),value: "c"),
    DropdownMenuItem(child: Text("Usually buy"),value: "e"),


  ];
  return menuItems;
}

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 14,
      backgroundColor: Colors.white,
      child: Container(
        height: 500,
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DropdownButtonFormField(items:dropdownItems, onChanged: (String ?s,){
categoryController.text=s!;
              },),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),

            ),
            SizedBox(height:20),

            TextField(
              controller:priceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'price',
              ),
            ),



            // TextField(
            //   controller:categoryController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'Category',
            //   ),
            // ),

            SizedBox(height: 20),

            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Image',
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),



            Container(
              width: 200,
              margin: EdgeInsets.only(top: 30),
              child: MaterialButton(
color: defaultColor,
                onPressed: (){
                  var newItem = new Item( name:nameController.text, category: categoryController.text, image: imageController.text,  price:double.parse( priceController.text) , id: 0, isFav: false,description: descriptionController.text);
                  Navigator.pop(context, newItem);
                },
                child: Text("Add")
                ,

              ),
            )

          ],
        ),
      ),
    );
  }
}
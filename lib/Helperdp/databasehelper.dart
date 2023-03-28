

import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/models/usermodel.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  // Initialize Database Object
  static Database? _db;

  // Make Init function that will be used to identify the database object
  static Future<void> initDB() async {
    print("initDB");
    var databasesPath = await getDatabasesPath();
    String path = ("${databasesPath}appDB.db");

    _db = await openDatabase(path, version: 1, onOpen: (db) {
      print("Database Opened !!");
    }, onCreate: (Database db, int version) async {
      print("Database Created!!");
      //here we create the table and specify its columns [id, name, description, image, isFavourite]
      //notice that column names doesn't have to match the Variable names we have in "Item" model
      //In SQFLite, boolean values are stored as Integers, Strings are stored as TEXT
      //for more info about Data Types: https://www.sqlite.org/datatype3.html
      await db.execute("CREATE TABLE Users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT,phoneNo TEXT)");
      await db.execute("CREATE TABLE Items (id INTEGER PRIMARY KEY, name TEXT, category TEXT, image TEXT, isFav INTEGER,price REAL)");

    });
  }


  static void addUser(User user) {
    _db!.rawInsert(
        "INSERT INTO Users (id,name,email,password,phoneNo) VALUES (?,?,?,?,?)",
        //here we pass null in the place of the "id", because it is auto-generated PRIMARY KEY
        [null, user.name, user.email, user.password,user.phoneNo]
    );
  }

  static Future<bool> isUserPresent(String email, String password) async {
    List<dynamic> result = await  _db!.query("Users", where: "email = ? and password = ?", whereArgs: [email, password]);

    if(result.isNotEmpty){
      return true;
    }
    else {
      return false;
    }
  }





  ///Insert new item
  static void newItem(Item newItem) async {
    var res = await _db!.rawInsert(
        "INSERT INTO Items (id,name,category,image,price,isFav) VALUES (?,?,?,?,?,?)",
        //here we pass null in the place of the "id", because it is auto-generated PRIMARY KEY
        [null, newItem.name, newItem.category, newItem.image,newItem.price,newItem.isFav]
    );
    print(res);
  }

  ///Getting an item by its "id",
  ///NOTE: this can be made using any attributes, not a must that it should be "id"
  static Future<Item?> getItem(int id) async {

    List<dynamic> result = await  _db!.query("Items", where: "id = ?", whereArgs: [id]);

    if(result.isNotEmpty){
      // the result of a get query is always a List,
      // but in this case, we are sure that the id is unique, so we only have 1 row in the list
      var rowData = result[0];
      String name = rowData['name'] as String;
      String category = rowData['category'] as String;
      String imageUrl = rowData['image'] as String;
      int isFav = rowData['isFav'] as int;
      double price=rowData['price']as double;
      bool fav=isFav==1;
      return new Item(id:id,isFav: fav,category: category,image: imageUrl, name: name,price: price);
    }
    return null;
  }

  static Future<List<Item>> getAllItems() async {

    List<Item> items = [];

    print("db = $_db");
    List<dynamic> result = await  _db!.query("Items");

    for(var rowData in result){
      int id = rowData['id'] as int;
      String name = rowData['name'] as String;
      String category = rowData['category'] as String;
      String imageUrl = rowData['image'] as String;
      int isFav= rowData['isFav'] as int;
      double price= rowData['price'] as double;

bool fav =isFav==1;
      var item = new Item(id:id,isFav: fav,category: category,image: imageUrl, name: name,price: price);
items.add(item);
    }


     return items;
  }
  static Future<List<Item>> getfavItems() async {

    List<Item> favitems = [];

    print("db = $_db");
    List<dynamic> result = await  _db!.query("Items");

    for(var rowData in result){
      int id = rowData['id'] as int;
      String name = rowData['name'] as String;
      String category = rowData['category'] as String;
      String imageUrl = rowData['image'] as String;
      int isFav= rowData['isFav'] as int;
      double price= rowData['price']as double;

      bool fav =isFav==1;
      var item = new Item(id:id,isFav: fav,category: category,image: imageUrl, name: name,price: price);
     if(item.isFav) favitems.add(item);
    }


    return favitems;
  }

  ///Update item by its id
  static void updateItem(Item item) async {

    //notice that the id column will never change
    _db!.update('Items', {

      'isFav' : item.isFav,

    },
        where: "id = ?",
        whereArgs: [item.id]);

getfavItems();
  }

  ///Delete item by its id
  static void deleteItem(int id) async {
    int resultStatus = await _db!.delete('Items', where: "id = ?", whereArgs: [id]);
    print('Delete Res: $resultStatus');
  }
  static void delete(Item price) async {
   await _db!.delete('Items', where: "id = ?", whereArgs: [price.id]);

  }

  static void closeDB() async =>await _db!.close();

}
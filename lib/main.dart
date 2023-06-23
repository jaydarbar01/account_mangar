import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import 'alrt_box.dart';
import 'password_view.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  var box= await Hive.openBox("data");
  runApp(GetMaterialApp(home: Home(),));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static Database? database;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  Box box=Hive.box("data");
  var password="";


///login time is not working
 /* chek_loging()
  {

    if(box.containsKey("pass"))
    {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PasswordView();
      },));

    }else{
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return alrt_box();
      },));

    }
  }*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permision();// permision action
    dir_path();//path
    creat_data();//caret table and data directiry

  }
  permision() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
    }
  }
  dir_path()
  async {
    var path =
        await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS) +
            "/accountData";
    Directory dir = Directory(path);
    if (!await dir.exists()) {
      dir.create();
    }


  }
  creat_data() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'account.db');
    Home.database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table dashborapge

          await db.execute(
              'CREATE TABLE Balance (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, balance REAL, debit REAL ,credit REAL)'
              );
          // When creating the db, create the table Statmnet Page
          await db.execute(
              'CREATE TABLE Statement (id INTEGER PRIMARY KEY AUTOINCREMENT, acid INTEGER , debit REAL ,credit REAL,  detail TEXT, date TEXT)');
        });




    // Check if the table exists
    final tables = await Home.database!.query(
      'sqlite_master',

      where: 'type = ? AND name = ?',
      whereArgs: ['table', 'Statement'],

    );

    if (tables.isNotEmpty) {
      print('Table exists!');
    } else {
      print('Table does not exist!');

    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: InkWell(onTap: () {
        if(box.containsKey('pass'))
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PasswordView();
          },));
          print("ok");
        }else

        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return alrt_box();
          },));
          print("notok");
        }


      },child: Container(
        child: Lottie.asset('images/143072-investment-animation-remix-no-bg.json'),
        height: 400 ,width:400))),
    );
  }
}




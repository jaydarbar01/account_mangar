
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'main.dart';
import 'statement.dart';

class dashboard extends StatefulWidget {
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {




  Dashbored_Controller d_data= Get.put(Dashbored_Controller());
  Statement_Controller s_data = Get.put(Statement_Controller());
  TextEditingController t1=TextEditingController();

  var id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //s_data.get_data(1);
    d_data.get_data();// table dala get krva mate

  }

  //  List<Map> list=[];
  // get_data() async {
  //   String get_data = "select * from Balance";
  //   list = await Home.database!.rawQuery(get_data);
  //   print(list);
  // }


  @override
  Widget build(BuildContext context) {
    print("bulied pgrame");

    return SafeArea(
      child: Scaffold(
        drawer:Drawer(width: 270,child: Column(children: [
          Stack(children: [
            Container( height: MediaQuery.of(context).size.height*0.40,decoration:
            BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("images/drwer.jpg")),color: Colors.blue,borderRadius: BorderRadius.circular(20)),),
            Column(children: [
              Padding(padding: EdgeInsets.all(0),child: Icon(size: 90,Icons.account_balance_wallet)),
              Text("Account Manager",style: TextStyle(fontSize: 25),),

              Container(height: 1,color: Colors.white,),
              Padding(padding: EdgeInsets.all(10),
                child: Container(decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(10)),
                  height: 130,
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.all(10),child: Text("Credit",style: TextStyle(fontSize: 17),)),
                        Padding(padding: EdgeInsets.fromLTRB(50, 10, 2, 10),child: Text("10000",style: TextStyle(fontSize: 17))),
                      ],
                    ),
                    Row(children: [
                      Padding(padding: EdgeInsets.all(10),child: Text("Debit",style: TextStyle(fontSize: 17),)),
                      Padding(padding: EdgeInsets.fromLTRB(55, 10, 2, 10),child: Text("1000",style: TextStyle(fontSize: 17))),
                    ],),
                    Container(height: 1,color: Colors.white,),
                    Row(children: [
                      Padding(padding: EdgeInsets.all(10),child: Text("Balnce",style: TextStyle(fontSize: 17),)),
                      Padding(padding: EdgeInsets.fromLTRB(40, 10, 2, 10),child: Text("1000",style: TextStyle(fontSize: 17))),
                    ],)
                  ]),
                ),
              )
            ],)
          ],),
          ListTile(leading: Icon(Icons.home),title: Text("HOme"),),
          ListTile(leading: Icon(Icons.backup),title: Text("Backup"),),
          ListTile(leading: Icon(Icons.restart_alt),title: Text("Restore"),),
          ListTile(leading: Icon(Icons.account_balance),title: Text("Change cunranccy"),),
          ListTile(leading: Icon(Icons.password),title: Text("Chnage PAssword"),),
          ListTile(leading: Icon(Icons.question_answer),title: Text("Change secirty Question"),),
          ListTile(leading: Icon(Icons.settings),title: Text("Setting"),),

        ]),),
        appBar: AppBar(
          actions: [

            InkWell(onTap:() {
              String Dlt="DELETE FROM Balance WHERE id=${d_data.list[4]['id']}";
              Home.database!.delete(Dlt);

            },child: Icon(Icons.search_rounded)),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(child: Text("Crate a Pdf")),
                PopupMenuItem(child: Text("Crate a Exles")),
              ],
            ),
          ],
          title: Text("Dashbiard"),
        ),
        body: Obx(() => ListView.builder(itemCount: d_data.list.length,itemBuilder: (context, index) {
          return Card(
            child: InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Statemant(d_data.list[index]);
              },));
              print(d_data.list[index]['id']);
            },
              child: Container(height: MediaQuery.of(context).size.height*0.18,
                child: Column(children: [
                  Row(children: [
                    Expanded(child: Container(padding: EdgeInsets.all(10),alignment: Alignment.centerLeft,child: Text("${d_data.list[index]['name']}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),height: 50)),
                    Expanded(child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      IconButton(onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(title: Text("Update New Account",style: TextStyle(fontSize: 20),),
                            actions: [
                              TextField(controller: t1,decoration: InputDecoration(hintText: "Account Name"),),
                              SizedBox(height:15 ,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: () {
                                    Navigator.pop(context);
                                  }, child: Text("CANCLE")),
                                  SizedBox(width: 20,),
                                  ElevatedButton(onPressed: () async {

                                    d_data.name.value=t1.text;
                                    String up_qry="update Balance set name=${d_data.name.value} where id=${d_data.list[index]["id"]} ";
                                  await Home.database!.rawUpdate(up_qry).then((value) {
                                      print("update value$value");
                                    });


                                    // String qry = "INSERT INTO Balance VALUES(NULL, '$name', '$balance', '$debit', '$credit')";
                                    // Home.database!.rawInsert(qry).then((value) {
                                    //   print("value $value");
                                    // });

                                    Navigator.pop(context);

                                  }, child: Text("SAVE")),
                                ],
                              )
                            ],
                          );
                        });
                      }, icon: Icon(Icons.edit)),

                      SizedBox(width: 5,),
                     IconButton(onPressed: () {

                     }, icon: Icon(Icons.delete)),
                      SizedBox(width: 9,),
                    ]),height: 50)),
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Card(child: Container(alignment: Alignment.center,child: Text("Credit\n₹${d_data.list[index]['credit']}"),height: MediaQuery.of(context).size.height*0.1,width:MediaQuery.of(context).size.width*0.27,decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(10)),),),
                    Card(child: Container(alignment: Alignment.center,child: Text("Debit\n₹${d_data.list[index]['debit']}"),height: MediaQuery.of(context).size.height*0.1,width:MediaQuery.of(context).size.width*0.27,decoration: BoxDecoration(color: Colors.blueGrey.shade200,borderRadius: BorderRadius.circular(10))),),
                    Card(child: Container(alignment: Alignment.center,child: Text("Blance\n₹${d_data.list[index]['balance']}"),height: MediaQuery.of(context).size.height*0.1,width:MediaQuery.of(context).size.width*0.27,decoration: BoxDecoration(color: Colors.deepPurpleAccent.shade100,borderRadius: BorderRadius.circular(10))),),
                  ],)
                ]),

              ),
            ),
          );
        },),),
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(title: Text("Add New Account",style: TextStyle(fontSize: 20),),
              actions: [
                TextField(controller: t1,decoration: InputDecoration(hintText: "Account Name"),),
                SizedBox(height:15 ,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text("CANCLE")),
                    SizedBox(width: 20,),
                    ElevatedButton(onPressed: () {

                       d_data.name.value=t1.text;

                       d_data.insert_data();
                       d_data.get_data();
                       t1.text="";

                      // String qry = "INSERT INTO Balance VALUES(NULL, '$name', '$balance', '$debit', '$credit')";
                      // Home.database!.rawInsert(qry).then((value) {
                      //   print("value $value");
                      // });

                      Navigator.pop(context);

                    }, child: Text("SAVE")),
                  ],
                )
              ],
            );
          },);

        },child: Icon(Icons.add_chart_sharp),),
      ),
    );
  }
}

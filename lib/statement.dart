import 'package:account_mangar/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Statemant extends StatefulWidget {

  Map ?data;
  Statemant([this.data]);





  @override
  State<Statemant> createState() => _StatemantState();
}

class _StatemantState extends State<Statemant> {



 //Statemane controller
  Statement_Controller s_data = Get.put(Statement_Controller());

 //Dashbord Controller
  Dashbored_Controller d_data = Get.put(Dashbored_Controller());

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  int cred = 0;
  int debt = 0;


  bool Transaction = false;

//  String date = DateFormat("dd-MM-yyy").format(DateTime.now());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s_data.get_data(widget.data!['id']);
    //PAge run thia tyre sum caculte krava mate
    s_data.Sum(widget.data!['id']);
    s_data.Sub(widget.data!['id']);
   //s_data.blnce();
    print("my map data coll${widget.data}");

  }

  @override
  Widget build(BuildContext context) {
    double Hight = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("${/*d_data.list[widget.Id]['name']*/00}"),
        actions: [
          InkWell(
              onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return  AlertDialog(
                          title: Text("Add transction"),
                          actions: [
                            Column(
                              children: [
                                Text("Date:${s_data.date}"),
                                Row(
                                  children: [
                                    Text(
                                      "Transction Type:",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                   Obx(()=> Radio(
                                     value: true,
                                     groupValue: s_data.Transaction.value,
                                      onChanged: (value) {
                                       s_data.transction(value);
                                     },
                                   ),),
                                    Text(
                                      "Credit(+)",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                   Obx(()=> Radio(
                                     value: false,
                                     groupValue: s_data.Transaction.value,
                                     onChanged: (value) {
                                       s_data.transction(value);
                                     },
                                   ),),
                                    Text(
                                      "Debit(-)",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                TextField(
                                  onChanged: (value) {
                                    //print("my credit$Transaction");
                                  },
                                  controller: t1,
                                  decoration:
                                  InputDecoration(hintText: "Amount"),
                                ),
                                TextField(
                                  controller: t2,
                                  decoration:
                                  InputDecoration(hintText: "Particular"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("CANCLE")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (s_data.Transaction
                                              == true) {
                                            s_data.credit.value =
                                                int.parse(t1.text);
                                            t1.text = "";
                                            s_data.debit.value = 0;
                                          } else {
                                            s_data.debit.value =
                                                int.parse(t1.text);
                                            t1.text = "";
                                            s_data.credit.value = 0;
                                          }
                                          s_data.detail.value = t2.text;

                                          //inster data qry
                                          s_data.insert_data(widget.data!['id']);

                                          //shoq data qry
                                          s_data.get_data(widget.data!['id']);

                                          //total qry
                                          s_data.Sum(widget.data!['id']);
                                          s_data.Sub(widget.data!['id']);
                                          //s_data.blnce();

                                          Navigator.pop(context);
                                        },
                                        child: Text("ADD")),
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      });

              },
              child: Icon(Icons.add_chart_rounded)),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
              // s_data.blnce();
                s_data.setblance();
              },
              child: Icon(Icons.search_rounded)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: Hight * 0.05,
            width: Width * 1,
            color: Colors.grey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    "Particular",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Credit(₹)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Debit(₹)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                height: Hight * 0.72,
                child: Obx(
                  () => ListView.builder(
                    itemCount: s_data.mylist.length,
                    itemBuilder: (context, index) {
                      return Container(
                          alignment: Alignment.center,
                          height: Hight * 0.05,
                          width: Width * 1,
                          color: (widget.data!['id'] == s_data.mylist[index]["acid"])
                              ? (index % 2 == 1)
                                  ? Colors.grey.shade300
                                  : Colors.white10
                              : null,
                          child: (widget.data!['id'] == s_data.mylist[index]["acid"])
                              ? Row(children: [
                                  Container(
                                    width: Width * 0.25,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${s_data.mylist[index]['date']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: Width * 0.37,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${s_data.mylist[index]['detail']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: Width * 0.2,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${s_data.mylist[index]['credit']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: Width * 0.18,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${s_data.mylist[index]['debit']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ])
                              : Container(height: 150,width: 150,color: Colors.red,));
                    },
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Container(
                  child:Obx(() => Text("Credit\n₹${s_data.t_credit}")),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.27,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Card(
                child: Container(
                    child: Obx(() => Text("Debit\n₹${s_data.t_debit}")),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.27,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10))),
              ),
              Card(
                child: Container(
                    child: Text("Blance\n₹${s_data.blance}"),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.27,
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          )
        ],
      ),
    );
  }
}

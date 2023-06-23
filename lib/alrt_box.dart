import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class alrt_box extends StatefulWidget {

  @override
  State<alrt_box> createState() => _alrt_boxState();
}

class _alrt_boxState extends State<alrt_box> {
  String dropdownvalue = 'Security Question';
  var Question = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  TextEditingController t1= TextEditingController();
  Box box=Hive.box("data");
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:  AlertDialog(
        title: Text("Seting"),
        actions: [
          Column(children: [
            TextFormField(controller: t1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              decoration: InputDecoration( hintText: "Set Password"),

            ),
             /*DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),

              items: Question.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),*/
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);

              }, child: Text("Exit")),
              ElevatedButton(onPressed: () {
                String pass=t1.text;
                box.put("pass", pass);
                setState(() {

                });
                // Get.back();
              }, child: Text("Set"))
            ],)
          ],)
        ],
      ),
    );
  }
}
